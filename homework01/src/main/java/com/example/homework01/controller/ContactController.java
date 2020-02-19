package com.example.homework01.controller;

import com.example.homework01.entity.ContactEntity;
import com.example.homework01.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Optional;

@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;

    @GetMapping("/")
    public String getContacts(Model model, @PageableDefault(sort = {"createdAt"}, direction = Sort.Direction.DESC)Pageable pageable){
        Page<ContactEntity> page = contactService.find(pageable);
        model.addAttribute("title", "Контакты");
        model.addAttribute("page", page);
        model.addAttribute("url", "/");

        return "contacts";

    }


    @PostMapping("/create")
    public String createContact(@ModelAttribute("create-contact") ContactEntity contactEntity){
        try {
            contactService.save(contactEntity);
        } catch (Exception ex) {
        }
        return "redirect:/";
    }

    @GetMapping("/create")
    public String createContactPage(Model model){
        model.addAttribute("title", "Создать контакт");
        return "createContact";
    }

    @GetMapping("/{idContact}")
    public String contactPage(@PathVariable Long idContact, Model model){
        Optional<ContactEntity> found = contactService.findOne(idContact);

        if (!found.isPresent()) {
            return "redirect:/";
        }

        model.addAttribute("title", found.get().getName() + " " + found.get().getSurname());
        model.addAttribute("contact", found.get());
        return "contact";
    }

    @PostMapping("/{idContact}/delete")
    public String deleteContact(@PathVariable Long idContact){
        try{
            contactService.deleteOne(idContact);

        }catch (Exception e){

        }
        return "redirect:/";
    }

    /**
     * GET / - contacts
     * POST / - contact
     * GET /{id} - contact /1
     * POST /{id}/delete - contact
     *
     * */
}
