package com.vize.repo;

import com.vize.jooq.generated.public_.tables.Posts;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.vize.jooq.generated.public_.tables.Boards.BOARDS;

@Repository
@RequiredArgsConstructor
public class BoardRepository {

    private final DSLContext context;

    public List<String> getBoardCodes() {
        return context.select(BOARDS.CODE)
                .from(BOARDS)
                .fetchInto(String.class);
    }

    public Integer countPosts() {
        return context.fetchCount(Posts.POSTS);
    }

    public Integer countPostsPerBoard(String board) {
        return context.fetchCount(Posts.POSTS, Posts.POSTS.BOARD_CODE.eq(board));
    }
}
