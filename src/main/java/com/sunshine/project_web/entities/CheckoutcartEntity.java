package com.sunshine.project_web.entities;

import lombok.Data;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Fetch;

import javax.persistence.*;

@Entity
@Data
@Table(name = "checkoutcart", schema = "web_ban_hang", catalog = "")
public class CheckoutcartEntity {
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
    @Basic
    @Column(name = "status", nullable = true)
    private Integer status;

    @ManyToOne
    @JoinColumn(name = "productid", referencedColumnName = "id", insertable = false, updatable = false)
    private ProductEntity productEntity;

    @ManyToOne()
    @JoinColumn(name = "userid", referencedColumnName = "id", insertable = false, updatable = false)
    private UserEntity userEntity;
}
