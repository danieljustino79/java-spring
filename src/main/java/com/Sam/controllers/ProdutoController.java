package com.Sam.controllers;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Sam.models.Produto;

@Controller
public class ProdutoController {
	
	public List<Produto> lista = new ArrayList<Produto>();
	
	public ProdutoController() {
		Produto obj = new Produto();
		obj.setId(1);
		obj.setNome("Sam");
		obj.setDescricao("ok");
		obj.setValidade(Calendar.getInstance());
		lista.add(obj);
	}
	
	private void adicionarService(Produto produto) {
		produto.setId(lista.size() + 1);		
		lista.add(produto);
	}
	
	private void editarService(Produto produto, Produto produtoOriginal) {
		int posicao = lista.indexOf(produtoOriginal);
		lista.remove(posicao);
		lista.add(produto);
	}	
	
	private Produto obterPorIdService(int id) {
		Produto produtoAux = lista.stream().filter(x -> x.getId() == id).findFirst().orElse(null);
		return produtoAux;
	}
	
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
		
		Produto produtoOriginal = obterPorIdService(produto.getId());
		
		if(produtoOriginal == null) {
			ModelAndView modelErro = new ModelAndView("produtos");
			modelErro.addObject("mensagem", "O registro solicitado não existe.");
			return modelErro;
		}
		
		editarService(produto, produtoOriginal);
		
		ModelAndView model = new ModelAndView("redirect:produtoEditar/?id=" + produto.getId());
		viewBag.addFlashAttribute("mensagem", "Produto foi alterado com sucesso.");
		
		return model;
	}

	@RequestMapping("produtoDetalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") int id) {
		
		ModelAndView model = new ModelAndView("produto/detalhe");
		Produto produto = obterPorIdService(id);
		model.addObject("item", produto);
		return model;
	}
	
	
}