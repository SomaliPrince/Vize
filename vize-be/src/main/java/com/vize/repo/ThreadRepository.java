package com.vize.repo;

import com.vize.dto.ThreadDTO;
import lombok.RequiredArgsConstructor;
import org.jooq.DSLContext;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ThreadRepository {

    private final DSLContext context;

    public ThreadDTO getThreadByID(Long id) {
//        ThreadsRecord thread = context.select()
        return null;
    }
}
