package com.vize.controller;

import com.vize.dto.ThreadDTO;
import com.vize.repo.ThreadRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("threads")
@RequiredArgsConstructor
public class ThreadController {

    private final ThreadRepository threadRepository;

    @GetMapping("/{code}")
    public List<ThreadDTO> getThreadsByBoard(@PathVariable String code) {
        return threadRepository.getThreads(code);
    }
}
