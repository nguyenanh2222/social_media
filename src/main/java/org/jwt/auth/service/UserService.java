package org.jwt.auth.service;

import org.jwt.auth.domain.Role;
import org.jwt.auth.domain.User;

import java.util.List;

public interface UserService {
    User saveUser(User user);
    Role saveRole(Role role);
    void addRoleToUser(String username, String roelName );
    User getUser(String username);
    List<User> getUsers();
}
