package com.vize.repo;

import com.vize.dto.ThreadDTO;
import com.vize.jooq.generated.public_.tables.Threads;
import com.vize.jooq.generated.public_.tables.records.ThreadsRecord;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

import static com.vize.jooq.generated.public_.tables.Threads.THREADS;

@Repository
@RequiredArgsConstructor
public class ThreadRepository {

    private final DSLContext context;

    public ThreadDTO getThreadByID(Long id) {
//        ThreadsRecord thread = context.select()
        return null;
    }
}
