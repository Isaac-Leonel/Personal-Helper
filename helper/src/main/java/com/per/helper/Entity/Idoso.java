package com.per.helper.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Entity
public class Idoso {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false)
    private String cpf;

    @Column(nullable = false)
    private Double nascimento;
    
    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String senha;

    private String cuidID;

    @ManyToOne()
    private Medico medico;

    @Column(nullable = false)
    private String img;

    @Column(nullable = false)
    private String rg;

}
