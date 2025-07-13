package com.vize.mapper;

import com.vize.dto.ResponseThreadDTO;
import com.vize.jooq.generated.public_.tables.records.ThreadsRecord;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface ThreadMapper {

    ThreadMapper INSTANCE = Mappers.getMapper(ThreadMapper.class);

    @Mapping(expression = "java(thread.getTitle())", target = "title")
    @Mapping(expression = "java(thread.getId())", target = "id")
    ResponseThreadDTO threadRecordToResponseDto(ThreadsRecord thread);
}
