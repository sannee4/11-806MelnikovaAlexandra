package com.example.homework01.service;

import com.example.homework01.entity.ContactEntity;
import com.example.homework01.repo.ContactRepo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ContactService  {
    private final ContactRepo contactRepo;

    public ContactService(ContactRepo contactRepo){
        this.contactRepo = contactRepo;
    }

    public Page<ContactEntity> find(Pageable pageable){
        return contactRepo.findAll(pageable);
    }


    public ContactEntity save(ContactEntity contact) {
        return contactRepo.save(contact);
    }

    public Optional<ContactEntity> findOne(Long id) {
        return contactRepo.findById(id);
    }

    public void deleteOne(Long id) throws Exception {
        Optional<ContactEntity> note = this.findOne(id);
        if (!note.isPresent()) {
            throw new Exception("note was not found");
        }
        contactRepo.delete(note.get());
    }
}
