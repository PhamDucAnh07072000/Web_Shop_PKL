package com.sunshine.project_web.entities;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "cartmodel", schema = "web_ban_hang", catalog = "")
public class CartmodelEntity {
    @Id
    @Column(name = "id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Basic
    @Column(name = "number", nullable = true)
    private Integer number;
    @Basic
    @Column(name = "productid", nullable = true)
    private Long productid;
    @Basic
    @Column(name = "userid", nullable = true)
    private Long userid;
    @Basic
    @Column(name = "productimg", nullable = true, length = 255)
    private String productimg;

    @ManyToOne
    @JoinColumn(name = "productid", referencedColumnName = "id", insertable = false, updatable = false)
    private ProductEntity productEntity;
}
