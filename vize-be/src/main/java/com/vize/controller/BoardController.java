package com.vize.controller;

import com.vize.domain.Board;
import com.vize.repo.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("boards")
@RequiredArgsConstructor
public class BoardController {

    private final BoardRepository boardRepository;

    @GetMapping
    public List<String> getAllBoardCodes() {
        return boardRepository.findAll().stream()
                .map(Board::code)
                .toList();
    }

    @GetMapping
    public Integer countAllPosts() {
        return board
    }
}
