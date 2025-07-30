package com.vize.dto;

import java.time.LocalDateTime;

public record PostDTO(
        Integer id,
        String comment,
        LocalDateTime createdAt
) {
}
