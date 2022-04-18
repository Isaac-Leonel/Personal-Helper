package com.per.helper.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;

@Entity
@Setter
@Getter
public class Idoso {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(nullable = false)
    private String NomeC;
    @Column(nullable = false)
    private String CPF;
    @Column(nullable = false)
    private String Nascimento;
    @Column(nullable = false)
    private String email;
    @Column(nullable = false)
    private String senha;
    @Column(nullable = false)
    private String cuidID;
    @Column(nullable = false)
    private String medID;
    @Column(nullable = false)
    private String img;
    @Column(nullable = false)
    private String rg;

}
