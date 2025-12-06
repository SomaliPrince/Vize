package com.vize.repo;

import com.vize.dto.CreateThreadRequest;
import com.vize.dto.GetFullThreadResponse;
import com.vize.dto.GetPostResponse;
import com.vize.dto.GetThreadCardResponse;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.jooq.Records;
import org.springframework.stereotype.Repository;

import java.time.format.DateTimeFormatter;
import java.util.List;

import static com.vize.jooq.generated.public_.tables.Posts.POSTS;
import static com.vize.jooq.generated.public_.tables.Threads.THREADS;
import static org.jooq.impl.DSL.multisetAgg;

@Repository
@RequiredArgsConstructor
public class ThreadRepository {

    private final DSLContext context;

    public List<GetThreadCardResponse> getThreadCards(String code) {
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
                .map(Records.mapping(GetThreadCardResponse::new));
    }

    public List<GetFullThreadResponse> getThreads(String code) {
        return context.select(
                        THREADS.ID.as("id"),
                        THREADS.NAME.as("name"),
                        multisetAgg(POSTS.ID, POSTS.COMMENT, POSTS.CREATED_AT)
                                .orderBy(POSTS.ID.asc())
                                .convertFrom(x -> x.map(record -> new GetPostResponse(
                                        record.component1(),
                                        record.component2(),
                                        record.component3().format(DateTimeFormatter.ofPattern("MM/dd/yy(EEE)HH:mm:ss"))
                                ))))
                .from(THREADS)
                .join(POSTS).on(THREADS.ID.eq(POSTS.THREAD_ID).and(POSTS.BOARD_CODE.eq(code)))
                .where(THREADS.BOARD_CODE.eq(code))
                .groupBy(THREADS.ID, THREADS.BOARD_CODE, THREADS.NAME)
                .fetch(Records.mapping(GetFullThreadResponse::new));
    }

    public void createThread(CreateThreadRequest requestThreadDTO) {
        String sequence = requestThreadDTO.boardCode().concat("_seq");
        var nextval = context.dsl().nextval(sequence).intValue();

        context.insertInto(THREADS, THREADS.ID, THREADS.BOARD_CODE, THREADS.NAME)
                .values(nextval, requestThreadDTO.boardCode(), requestThreadDTO.name())
                .execute();

        context.insertInto(POSTS, POSTS.ID, POSTS.THREAD_ID, POSTS.BOARD_CODE, POSTS.COMMENT)
                .values(nextval, nextval, requestThreadDTO.boardCode(), requestThreadDTO.comment())
                .execute();
    }
}
