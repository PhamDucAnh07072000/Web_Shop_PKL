package com.sunshine.project_web.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "category", schema = "web_ban_hang", catalog = "")
public class CategoryEntity {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column(name = "name", nullable = false, length = 255)
    private String name;
    @Basic
    @Column(name = "img", nullable = true, length = 255)
    private String img;
}
