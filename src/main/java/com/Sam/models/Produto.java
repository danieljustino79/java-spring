package com.Sam.models;

import java.util.Calendar;

import org.springframework.format.annotation.DateTimeFormat;

public class Produto {
	private int id;
	private String nome;
	private String descricao;
	
	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Calendar Validade;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Calendar getValidade() {
		return Validade;
	}
	public void setValidade(Calendar validade) {
		Validade = validade;
	}

}
