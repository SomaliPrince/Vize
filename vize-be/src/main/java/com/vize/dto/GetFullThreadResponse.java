package com.vize.dto;

import java.util.List;

public record GetFullThreadResponse(
        Integer id,
        String name,
        List<GetPostResponse> posts
) {
}
