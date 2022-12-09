package org.jwt.auth.repo;

import org.jwt.auth.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository <User, Long> {
    User findByUsername(String username);
}
