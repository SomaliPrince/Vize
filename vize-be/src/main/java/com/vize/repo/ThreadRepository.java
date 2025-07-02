package com.vize.repo;

import com.vize.dto.ThreadDTO;
import com.vize.mapper.ThreadMapper;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.vize.jooq.generated.public_.tables.Threads.THREADS;

@Repository
@RequiredArgsConstructor
public class ThreadRepository {

    private final DSLContext context;

    public List<ThreadDTO> getThreads(String code) {
        return context.selectFrom(THREADS)
                .where(THREADS.BOARD_CODE.eq(code))
                .fetch()
                .map(ThreadMapper.INSTANCE::threadRecordToDto);
    }
}
