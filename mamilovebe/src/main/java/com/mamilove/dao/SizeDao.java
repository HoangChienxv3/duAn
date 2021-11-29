package com.mamilove.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.mamilove.entity.Category;
import com.mamilove.entity.Size;
import com.mamilove.entity.Typesize;

public interface SizeDao extends JpaRepository<Size, Long> {
    List<Size> findAll();

    List<Size> findByTypesize(Typesize typesize);

    void delete(Size size);

    Optional<Size> findByNameAndAndIdtypesize(String name, Long idtypesite);

    Optional<Size> findByName(String name);
}
