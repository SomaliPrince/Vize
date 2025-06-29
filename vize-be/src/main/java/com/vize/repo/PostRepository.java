package com.vize.repo;

import com.vize.jooq.generated.public_.tables.Posts;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Field;
import org.jooq.impl.DSL;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;

@Repository
@RequiredArgsConstructor
public class PostRepository {

    private final DSLContext context;

    public Integer countPosts() {
        return context.fetchCount(Posts.POSTS);
    }

    public Integer countPostsPerBoard(String board) {
        return context.fetchCount(Posts.POSTS, Posts.POSTS.BOARD_CODE.eq(board));
    }

    public Integer countPostsToday() {
        Field<LocalDate> date = DSL.field(DSL.name("posts", "created_at"), LocalDate.class);
        return context.fetchCount(Posts.POSTS, DSL.localDate(Posts.POSTS.CREATED_AT.cast(date)).eq(LocalDate.now()));
    }
}
