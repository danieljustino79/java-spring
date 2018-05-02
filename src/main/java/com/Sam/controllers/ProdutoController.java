package com.Sam.controllers;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Sam.models.Produto;

@Controller
public class ProdutoController {
	
	public List<Produto> lista = new ArrayList<Produto>();
	
	@RequestMapping("/produtos")
	public ModelAndView listar() {
				
		ModelAndView model = new ModelAndView("produto/listar");
		model.addObject("lista", lista);
		return model;
	}
	
	@RequestMapping("/produtoAdicionar")
	public ModelAndView adicionar() {
		
		ModelAndView model = new ModelAndView("produto/adicionar");
		return model;
	}
	
	@RequestMapping("/produtoSalvar")
	public ModelAndView salvar(Produto produto, RedirectAttributes viewBag) {		
		
		lista.add(produto);
		
		ModelAndView model = new ModelAndView("redirect:produtos");
		viewBag.addFlashAttribute("mensagem", "Produto cadastrado com sucesso.");
		
		return model;
	}
}