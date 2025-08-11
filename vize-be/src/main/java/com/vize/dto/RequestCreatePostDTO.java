package com.vize.dto;

import com.vize.validation.ExistingBoard;
import jakarta.validation.constraints.NotBlank;

public record RequestCreatePostDTO(
        @NotBlank
        @ExistingBoard
        String board,

        @NotBlank
        String comment,

        Integer threadId
) {
}
