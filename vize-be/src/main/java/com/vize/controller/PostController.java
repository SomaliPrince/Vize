package com.vize.controller;

import com.vize.repo.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("posts")
@RequiredArgsConstructor
public class PostController {

    private final PostRepository postRepository;

    @GetMapping("/count")
    public Integer countAllPosts() {
        return postRepository.countPosts();
    }

    @GetMapping("/count/{board}")
    public Integer countPostsPerBoard(@PathVariable("board") String board) {
        return postRepository.countPostsPerBoard(board);
    }

    @GetMapping("/countToday")
    public Integer countPostsToday() {
        return postRepository.countPostsToday();
    }
}
