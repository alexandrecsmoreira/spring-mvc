package br.com.caelum.contas.controller;

import java.util.Calendar;
import java.util.List;

import javax.validation.Valid;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;

@Controller
public class ContaController {

	@DateTimeFormat(pattern="dd/MM/yyyy")
	private Calendar dataPagamento;
	
	@RequestMapping("/formulario")
	public String formulario() {
		return "conta/formulario";
	}

	@RequestMapping("/formularioAlterar")
	public ModelAndView formularioAlterar(Conta conta) {
		Conta contaDAO = new ContaDAO().buscaPorId(conta.getId());

		ModelAndView modelAndView = new ModelAndView("conta/formulario-alterar");
		modelAndView.addObject("conta", contaDAO);

		return modelAndView;
	}
	
	@RequestMapping("/adicionaConta")
	public String adiciona(@Valid Conta conta, BindingResult result) {

		if (result.hasFieldErrors("descricao")) {
			return "conta/formulario";
		}
		
		ContaDAO contaDAO = new ContaDAO();
		contaDAO.adiciona(conta);

		return "conta/conta-adicionada";
	}

	@RequestMapping("/listaConta")
	public ModelAndView lista(Conta conta) {

		List<Conta> contaDAO = new ContaDAO().lista();

		ModelAndView modelAndView = new ModelAndView("conta/lista");
		modelAndView.addObject("todasContas", contaDAO);

		return modelAndView;
	}

	@RequestMapping("/removeConta")
	public String remove(Conta conta) {
		ContaDAO contaDAO = new ContaDAO();
		contaDAO.remove(conta);

		return "redirect:listaConta";
	}

	@RequestMapping(value="/alteraConta", method=RequestMethod.POST)
	public String altera(Conta conta) {
		return "redirect:listaConta";
	}

}
