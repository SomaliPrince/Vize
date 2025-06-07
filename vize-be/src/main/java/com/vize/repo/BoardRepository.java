package com.vize.repo;

import com.vize.domain.Board;
import org.springframework.data.repository.ListCrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardRepository extends ListCrudRepository<Board, String> {
}
