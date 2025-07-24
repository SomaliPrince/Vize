package com.vize.repo;

import com.vize.dto.RequestCreateThreadDTO;
import com.vize.dto.ResponseThreadDTO;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Records;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.vize.jooq.generated.public_.tables.Posts.POSTS;
import static com.vize.jooq.generated.public_.tables.Threads.THREADS;

@Repository
@RequiredArgsConstructor
public class ThreadRepository {

    private final DSLContext context;

    public List<ResponseThreadDTO> getThreads(String code) {
        //Order inside select must match fetch target DTO
        return context.select(
                        THREADS.ID.as("id"),
                        POSTS.COMMENT.as("comment"),
                        THREADS.NAME.as("name"),
                        POSTS.CREATED_AT.as("createdAt"))
                .from(THREADS)
                .join(POSTS)
                .on(THREADS.ID.eq(POSTS.ID).and(POSTS.BOARD_CODE.eq(code)))
                .where(THREADS.BOARD_CODE.eq(code))
                .fetch()
                .map(Records.mapping(ResponseThreadDTO::new));
    }

    public void createThread(RequestCreateThreadDTO requestThreadDTO) {
        String sequence = requestThreadDTO.boardCode().concat("_seq");
        var nextval = context.dsl().nextval(sequence).intValue();

        context.insertInto(THREADS, THREADS.ID, THREADS.BOARD_CODE, THREADS.NAME)
                .values(nextval, requestThreadDTO.boardCode(), requestThreadDTO.name()).execute();

        context.insertInto(POSTS, POSTS.ID, POSTS.THREAD_ID, POSTS.BOARD_CODE, POSTS.COMMENT)
                .values(nextval, nextval, requestThreadDTO.boardCode(), requestThreadDTO.comment()).execute();
    }
}
