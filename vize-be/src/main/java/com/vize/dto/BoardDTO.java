package com.vize.dto;

import org.springframework.data.annotation.Id;

public record BoardDTO(
        @Id String code,
        String name
) {
}
