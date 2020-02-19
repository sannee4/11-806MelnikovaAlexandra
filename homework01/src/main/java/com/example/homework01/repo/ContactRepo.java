package com.example.homework01.repo;

import com.example.homework01.entity.ContactEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactRepo extends JpaRepository<ContactEntity, Long> {

}
