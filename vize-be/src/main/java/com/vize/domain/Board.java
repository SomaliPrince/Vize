package com.vize.domain;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table(name = "boards")
public record Board(
        @Id String code,
        String name
) {
}
