package com.vize.repo;

import com.vize.dto.RequestCreatePostDTO;
import com.vize.dto.ResponsePostDTO;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.Records;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;

import static com.vize.jooq.generated.public_.tables.Posts.POSTS;

@Repository
@RequiredArgsConstructor
public class PostRepository {

    private final DSLContext context;

    public Integer countPosts() {
        return context.fetchCount(POSTS);
    }

    public Integer countPostsPerBoard(String board) {
        return context.fetchCount(POSTS, POSTS.BOARD_CODE.eq(board));
    }

    public Integer countPostsToday() {
        Field<LocalDate> date = DSL.field(DSL.name("posts", "created_at"), LocalDate.class);
        return context.fetchCount(POSTS, DSL.localDate(POSTS.CREATED_AT.cast(date)).eq(LocalDate.now()));
    }

    public ResponsePostDTO createPost(RequestCreatePostDTO post) {
        String sequence = post.board().concat("_seq");
        var nextval = context.dsl().nextval(sequence).intValue();

        return context.insertInto(POSTS, POSTS.ID, POSTS.BOARD_CODE, POSTS.THREAD_ID, POSTS.COMMENT)
                .values(nextval, post.board(), post.threadId(), post.comment())
                .returningResult(POSTS.ID, POSTS.COMMENT, POSTS.CREATED_AT)
                .fetchOneInto(ResponsePostDTO.class);
    }
}