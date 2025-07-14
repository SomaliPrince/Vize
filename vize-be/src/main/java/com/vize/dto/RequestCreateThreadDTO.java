package com.vize.dto;

import com.vize.validation.ExistingBoard;
import jakarta.validation.constraints.NotBlank;

public record RequestCreateThreadDTO(
        @NotBlank
        @ExistingBoard
        String boardCode,

        @NotBlank
        String title,

        @NotBlank
        String content
) {
}
