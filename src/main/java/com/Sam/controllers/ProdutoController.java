package com.Sam.controllers;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.Sam.models.Produto;

@Controller
public class ProdutoController {
	
	public List<Produto> lista = new ArrayList<Produto>();
	
	@RequestMapping("/produtos")
	public ModelAndView listar() {
		Produto obj = new Produto();
		obj.setNome("Teste");
		obj.setDescricao("teste de preenchimento.");
		obj.setValidade(Calendar.getInstance());
		lista.add(obj);
				
		ModelAndView model = new ModelAndView("produto/listar");
		model.addObject("lista", lista);
		return model;
	}
}