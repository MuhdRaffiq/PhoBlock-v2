package com.hackathon.phoblock.Controller;

import com.hackathon.phoblock.Repository.PhoBlockUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.regex.Pattern;

@RestController
public class ValidateController {
    @Autowired
    PhoBlockUserRepository phoBlockUserRepository;

    @PostMapping("/Validate/Name")
    ResponseEntity<?> validateFirstName(@RequestParam String name){
        if(name.isEmpty() || name.equals(" ")){
            return ResponseEntity.status(406).build();
        }

        if(name.trim().length() == 1){
            return ResponseEntity.status(406).build();
        }

        return ResponseEntity.ok().build();
    }

    @PostMapping("/Validate/Username")
    ResponseEntity<?> validateUsername(@RequestParam String username){
        if(phoBlockUserRepository.findByUserName(username) != null){
            return ResponseEntity.status(406).build();
        }

        return ResponseEntity.ok().build();
    }

    @PostMapping("/Validate/Password")
    ResponseEntity<?> validatePassword(@RequestParam String password){
        if(password.length() != 8){
            return ResponseEntity.status(406).build();
        }

        final Pattern textPattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$");

        if(textPattern.matcher(password).matches()){
            return ResponseEntity.status(406).build();
        }else{
            return ResponseEntity.ok().build();
        }
    }
}
