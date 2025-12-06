package com.vize.controller;

import com.vize.dto.CreatePostRequest;
import com.vize.dto.GetPostResponse;
import com.vize.repo.PostRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("posts")
@RequiredArgsConstructor
public class PostController {

    private final PostRepository postRepository;

    @PostMapping
    public GetPostResponse createPost(@RequestBody @Validated CreatePostRequest post) {
        return postRepository.createPost(post);
    }

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
