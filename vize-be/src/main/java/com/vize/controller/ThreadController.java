package com.vize.controller;

import com.vize.dto.CreateThreadRequest;
import com.vize.dto.GetFullThreadResponse;
import com.vize.repo.ThreadRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("threads")
@RequiredArgsConstructor
public class ThreadController {

    private final ThreadRepository threadRepository;

    @GetMapping("/{code}")
    public List<GetFullThreadResponse> getThreadsByBoard(@PathVariable String code) {
        return threadRepository.getThreads(code);
    }

    @PostMapping
    public void createThread(@RequestBody @Validated CreateThreadRequest threadDTO) {
        threadRepository.createThread(threadDTO);
    }
}
