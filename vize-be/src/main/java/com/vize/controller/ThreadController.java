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

    @GetMapping("/{board}")
    public List<GetFullThreadResponse> getThreadsByBoard(@PathVariable String board) {
        return threadRepository.getThreads(board);
    }

    @GetMapping("/{board}/{thread}")
    public GetFullThreadResponse getThread(@PathVariable String board, @PathVariable Integer thread) {
        return threadRepository.getFullThread(board, thread);
    }

    @PostMapping
    public void createThread(@RequestBody @Validated CreateThreadRequest threadDTO) {
        threadRepository.createThread(threadDTO);
    }
}
