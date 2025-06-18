package com.vize.controller;

import com.vize.domain.Board;
import com.vize.dto.ThreadDTO;
import com.vize.repo.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("threads")
@RequiredArgsConstructor
public class ThreadController {

    private final BoardRepository boardRepository;

    @GetMapping
    public List<ThreadDTO> getThreadById() {
        return null;
    }
}
