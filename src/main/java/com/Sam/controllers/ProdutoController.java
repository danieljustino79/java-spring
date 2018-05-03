package com.Sam.controllers;

import java.util.ArrayList;
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
		
		adicionarService(produto);
		
		ModelAndView model = new ModelAndView("redirect:produtos");
		viewBag.addFlashAttribute("mensagem", "Produto foi cadastrado com sucesso.");
		
		return model;
	}

	private void adicionarService(Produto produto) {
		produto.setId(lista.size() + 1);		
		lista.add(produto);
	}
	
	@RequestMapping("produtoEditar")
	public ModelAndView editar(Integer id) {
		
		Produto produto = lista.stream().filter(x -> x.getId() == id).findFirst().orElse(null);
		
		if(produto == null) {
			ModelAndView modelErro = new ModelAndView("produtos");
			modelErro.addObject("mensagem", "O registro solicitado não existe.");
		}
		
		ModelAndView model = new ModelAndView("produto/editar");		
		model.addObject("item", produto);
		
		return model;
	}
	
	@RequestMapping("produtoSalvarEditar")
	public ModelAndView salvarEditar(Produto produto, RedirectAttributes viewBag) {
		
		Produto produtoAux = obterService(produto);
		
		if(produtoAux == null) {
			ModelAndView modelErro = new ModelAndView("produtos");
			modelErro.addObject("mensagem", "O registro solicitado não existe.");
			return modelErro;
		}
		
		alterarService(produto, produtoAux);
		
		ModelAndView model = new ModelAndView("redirect:produtoEditar/?id=" + produtoAux.getId());
		viewBag.addFlashAttribute("mensagem", "Produto foi alterado com sucesso.");
		
		return model;
	}

	private Produto obterService(Produto produto) {
		Produto produtoAux = lista.stream().filter(x -> x.getId() == produto.getId()).findFirst().orElse(null);
		return produtoAux;
	}

	private void alterarService(Produto produto, Produto produtoAux) {
		int posicao = lista.indexOf(produtoAux);
		lista.remove(posicao);
		lista.add(produto);
	}
}