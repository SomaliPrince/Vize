package com.vize.repo;

import com.vize.dto.RequestCreateThreadDTO;
import com.vize.dto.ResponseThreadDTO;
import com.vize.mapper.ThreadMapper;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.vize.jooq.generated.public_.tables.Posts.POSTS;
import static com.vize.jooq.generated.public_.tables.Threads.THREADS;

@Repository
@RequiredArgsConstructor
public class ThreadRepository {

    private final DSLContext context;

    public List<ResponseThreadDTO> getThreads(String code) {
        return context.selectFrom(THREADS)
                .where(THREADS.BOARD_CODE.eq(code))
                .fetch()
                .map(ThreadMapper.INSTANCE::threadRecordToResponseDto);
    }

    public void createThread(RequestCreateThreadDTO requestThreadDTO) {
        Integer postId = context.insertInto(POSTS, POSTS.BOARD_CODE, POSTS.COMMENT)
                .values(requestThreadDTO.boardCode(), requestThreadDTO.comment())
                .returningResult(POSTS.ID)
                .fetchOne()
                .into(Integer.class);

        context.insertInto(THREADS, THREADS.POST_ID, THREADS.BOARD_CODE, THREADS.NAME)
                .values(postId, requestThreadDTO.boardCode(), requestThreadDTO.name()).execute();
    }
}
