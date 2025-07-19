package com.vize.dto;

import java.time.LocalDateTime;

public record ResponseThreadDTO(
        Integer id,
        String name,
        String comment,
        LocalDateTime createdAt
) {
}
