package com.vize.mapper;

import com.vize.dto.BoardDTO;
import com.vize.jooq.generated.public_.tables.records.BoardsRecord;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface BoardMapper {

    BoardMapper INSTANCE = Mappers.getMapper(BoardMapper.class);

    @Mapping(expression = "java(board.getName())", target = "name")
    @Mapping(expression = "java(board.getCode())", target = "code")
    BoardDTO boardRecordToBoardDto(BoardsRecord board);
}
