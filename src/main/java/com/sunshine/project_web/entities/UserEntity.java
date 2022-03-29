package com.sunshine.project_web.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "user", schema = "web_ban_hang", catalog = "")
public class UserEntity {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column(name = "username", nullable = false, length = 255)
    private String username;
    @Basic
    @Column(name = "email", nullable = false, length = 255)
    private String email;
    @Basic
    @Column(name = "passwd", nullable = false, length = 255)
    private String passwd;
    @Basic
    @Column(name = "descriptions", nullable = true, length = 255)
    private String descriptions;
    @Basic
    @Column(name = "phone", nullable = true)
    private Long phone;
    @Basic
    @Column(name = "avatar", nullable = true, length = 255)
    private String avatar;
    @Basic
    @Column(name = "permissions", nullable = true, length = 255)
    private String permissions;
}
