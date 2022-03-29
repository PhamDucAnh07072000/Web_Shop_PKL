package com.sunshine.project_web.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "product", schema = "web_ban_hang", catalog = "")
public class ProductEntity {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column(name = "name", nullable = true, length = 255)
    private String name;
    @Basic
    @Column(name = "price", nullable = true, precision = 0)
    private Double price;
    @Basic
    @Column(name = "brand", nullable = true, length = 255)
    private String brand;
    @Basic
    @Column(name = "img", nullable = true, length = 255)
    private String img;
    @Basic
    @Column(name = "descriptions", nullable = true, length = 255)
    private String descriptions;

}
