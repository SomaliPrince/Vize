package com.vize.controller;

import com.vize.repo.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("boards")
@RequiredArgsConstructor
public class BoardController {

    private final BoardRepository boardRepository;

    //    @GetMapping
//    public List<BoardDTO> getBoards() {
//        var boards = boardRepository.findAll();
//        return null;
//    }
}
