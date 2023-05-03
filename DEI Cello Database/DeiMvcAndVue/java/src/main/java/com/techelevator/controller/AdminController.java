//package com.techelevator.controller;
//
//import javax.validation.Valid;
//import javax.websocket.OnError;
//
//import com.techelevator.model.*;
//import org.springframework.http.HttpHeaders;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.ResponseEntity;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.server.ResponseStatusException;
//
//import com.techelevator.dao.UserDao;
//import com.techelevator.security.jwt.JWTFilter;
//import com.techelevator.security.jwt.TokenProvider;
//
//import java.util.List;
//
//@RestController
//@CrossOrigin
//
//
//public class AdminController implements UserDao {
//
//    @Override
//    public boolean equals(Object obj) {
//        return false;
//    }
//
//    @Override
//    public List<User> findAll(){
//        return null;
//    }
//
//    @Override
//    public User getUserById(int userId){
//        return null;
//    }
//
//    @Override
//    public User findByUsername(String username){
//        return null;
//    }
//
//    @Override
//    public int findIdByUsername(String username){
//        return 0;
//    }
//
//    @Override
//    public boolean create(String username, String password, String role){
//        return false;
//    }
//}
//
//
