package com.vize.controller;

import com.vize.repo.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("boards")
@RequiredArgsConstructor
public class BoardController {

    private final BoardRepository boardRepository;

    @GetMapping("/codes")
    public List<String> getAllBoardCodes() {
        return boardRepository.getBoardCodes();
    }

    @GetMapping("/count")
    public Integer countAllPosts() {
        return boardRepository.countPosts();
    }

    @GetMapping("/count/{board}")
    public Integer countPostsPerBoard(@PathVariable("board") String board) {
        return boardRepository.countPostsPerBoard(board);
    }
}
