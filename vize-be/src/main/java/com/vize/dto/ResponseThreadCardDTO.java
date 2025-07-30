package com.vize.dto;

import java.time.LocalDateTime;

public record ResponseThreadCardDTO(
        Integer id,
        String name,
        String comment,
        LocalDateTime createdAt
) {
}
