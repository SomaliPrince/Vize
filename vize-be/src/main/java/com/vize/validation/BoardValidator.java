package com.vize.validation;

import com.vize.dto.BoardDTO;
import com.vize.repo.BoardRepository;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BoardValidator implements ConstraintValidator<ExistingBoard, String> {

    @Autowired
    private BoardRepository boardRepository;
    private List<String> existingBoardCodes;

    @Override
    public void initialize(ExistingBoard constraintAnnotation) {
        existingBoardCodes = boardRepository.getBoards().stream().map(BoardDTO::code).toList();
    }

    @Override
    public boolean isValid(String code, ConstraintValidatorContext context) {
        if (code == null || code.isBlank()) return false;
        return existingBoardCodes.contains(code);
    }
}
