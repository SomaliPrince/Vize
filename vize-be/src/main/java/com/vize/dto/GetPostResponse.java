package com.vize.dto;

public record GetPostResponse(
        Integer id,
        String comment,
        String createdAt
) {
}
