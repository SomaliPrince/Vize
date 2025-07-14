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
        Integer threadId = context.insertInto(THREADS, THREADS.BOARD_CODE, THREADS.TITLE)
                .values(requestThreadDTO.boardCode(), requestThreadDTO.title()).returning(THREADS.ID).execute();
        context.insertInto(POSTS, POSTS.BOARD_CODE, POSTS.THREAD_ID, POSTS.CONTENT)
                .values(requestThreadDTO.boardCode(), threadId, requestThreadDTO.content()).execute();
    }
}
