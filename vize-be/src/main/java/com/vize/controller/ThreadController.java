package com.vize.controller;

import com.vize.dto.RequestCreateThreadDTO;
import com.vize.dto.ResponseThreadDTO;
import com.vize.repo.ThreadRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("threads")
@RequiredArgsConstructor
public class ThreadController {

    private final ThreadRepository threadRepository;

    @GetMapping("/{code}")
    public List<ResponseThreadDTO> getThreadsByBoard(@PathVariable String code) {
        return threadRepository.getThreads(code);
    }

    @PostMapping
    public void createThread(@RequestBody RequestCreateThreadDTO threadDTO) {
        threadRepository.createThread(threadDTO);
    }
}
