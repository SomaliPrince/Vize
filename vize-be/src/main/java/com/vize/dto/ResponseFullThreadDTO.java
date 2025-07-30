package com.vize.dto;

import java.util.List;

public record ResponseFullThreadDTO(
        Integer id,
        String name,
        List<PostDTO> posts
) {
}
