package com.vize.repo;

import com.vize.dto.BoardDTO;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardRepository extends ListCrudRepository<BoardDTO, String> {
}
