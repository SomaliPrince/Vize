package com.vize.dto;

import com.vize.validation.ExistingBoard;
import jakarta.validation.constraints.NotBlank;

public record CreateThreadRequest(
        @NotBlank
        @ExistingBoard
        String boardCode,

        @NotBlank
        String name,

        @NotBlank
        String comment
) {
}
