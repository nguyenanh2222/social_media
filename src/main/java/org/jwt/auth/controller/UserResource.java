package org.jwt.auth.controller;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.jwt.auth.domain.Role;
import org.jwt.auth.domain.User;
import org.jwt.auth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.activation.MimeType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URI;
import java.util.*;
import java.util.stream.Collectors;

import static java.util.Arrays.stream;
import static org.springframework.http.HttpHeaders.AUTHORIZATION;
import static org.springframework.http.HttpStatus.FORBIDDEN;
import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

@Controller
@RequestMapping("/api")
@RequiredArgsConstructor
public class UserResource {
    @Autowired
    private UserService userService;
    @GetMapping("/users")
    public ResponseEntity<List<User>> getUsers(){
        return ResponseEntity.ok().body(userService.getUsers());
    }
    @PostMapping("/user/save")
    public ResponseEntity<User> saveUser(@RequestBody User user){
        URI uri = URI.create(ServletUriComponentsBuilder.fromCurrentContextPath().path("api/role/save").toUriString());
        return ResponseEntity.ok().body(userService.saveUser(user));}
    @PostMapping("/role/save")
    public ResponseEntity<Role> saveUser(@RequestBody Role role){
        URI uri = URI.create(ServletUriComponentsBuilder.fromCurrentContextPath().path("api/role/save").toUriString());
        return ResponseEntity.ok().body(userService.saveRole(role));}
    @PostMapping("/role/addtouser")
    public ResponseEntity addRoleToUser(@RequestBody RoleToUserForm form){
        userService.addRoleToUser(form.getUsername(), form.getRoleName());
        return ResponseEntity.ok().build();}

    @PostMapping("/token/refresh")
    public String refreshToken(
            @RequestBody String refresh_token
    ) {
        System.out.println("GA KEU MEO HAY GAU");
        return "KHONG RETURN GI CA";
    }
//        System.out.println("GAUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU");
//
//        System.out.println(request.getHeaders("refresh_token"));
//
////        response.setHeader("access_token", access_token);
////        response.setHeader("refresh_token", refresh_token);
//        String authorizationHeader = request.getHeader("refresh_token");
//        System.out.println("MEO MEO MEO MEO");
//        System.out.println(authorizationHeader);
//        if(authorizationHeader != null && authorizationHeader.startsWith("Bearer ")){
//            try{
//                System.out.println("MEOooooooooooooooooooo");
//                String refresh_token = authorizationHeader.substring("Bearer ".length());
//                Algorithm algorithm = Algorithm.HMAC256("Secret".getBytes());
//                JWTVerifier verifier = JWT.require(algorithm).build();
//                DecodedJWT decodedJWT = verifier.verify(refresh_token);
//
//                String username = decodedJWT.getSubject();
//                System.out.println(username);
//
//                User user = userService.getUser(username);
//                System.out.println(username);
//
//                Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
//                stream(user.getRoles().toArray(new Role[0])).forEach(role -> {
//                    authorities.add(new SimpleGrantedAuthority(role.toString()));
//                });
//
//                System.out.println("MMMMMMMMMMMMMMMEOMEO");
//                System.out.println(authorities);
//
//                String access_token = JWT.create().withSubject(user.getUsername())
//                        .withExpiresAt(new Date(System.currentTimeMillis() + 10 * 60 * 1000))
//                        .withIssuer(request.getRequestURL().toString())
//                        .withClaim("roles", authorities.stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList()))
//                        .sign(algorithm);
//
////        response.setHeader("access_token", access_token);
////        response.setHeader("refresh_token", refresh_token);
//                Map<String, String> tokens = new HashMap<>();
//                tokens.put("access_token", access_token);
//                tokens.put("refresh_token", refresh_token);
//                new ObjectMapper().writeValue(response.getOutputStream(),tokens);
//            }catch (Exception e) {
//                response.setHeader("error", e.getMessage());
//                response.setStatus(FORBIDDEN.value());
////                    response.sendError(FORBIDDEN.value());
//                Map<String, String> error = new HashMap<>();
//                error.put("error_messenger", e.getMessage());
//                response.setContentType(APPLICATION_JSON_VALUE);
//                new ObjectMapper().writeValue(response.getOutputStream(),error);
//            }
//        }else {
//            throw new RuntimeException("refresh token missing");
//        }
    }
    @Data
    class RoleToUserForm{
        private String username;
        private String roleName;
    }

