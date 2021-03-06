package br.com.caelum.contas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.contas.dao.UsuarioDAO;
import br.com.caelum.contas.modelo.Usuario;

@Controller
public class UsuarioController {
	@RequestMapping("/loginForm")
	public String formLogin(Usuario usuario) {
		return "usuario/login";
	}

	@RequestMapping("/efetuaLogin")
	public String logar(Usuario usuario, HttpSession session) {

		UsuarioDAO usuarioDAO = new UsuarioDAO();

		if (usuarioDAO.existeUsuario(usuario)) {
			session.setAttribute("usuarioLogado", usuario);
			return "usuario/menu";
		}

		return "redirect:loginForm";

	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}

}
