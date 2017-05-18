<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h3>Alterar Contas</h3>
	<form action="alteraConta" method="post">
		Descrição: <br>
		<textarea rows="5" cols="100" name="descricao">${conta.descricao}</textarea> 
		<br><br>
		
		Valor: <br>
		<input type="text" name="valor" value="${conta.descricao}"> 
		<br><br>
		
		Tipo: <br>
		<select name="tipo">
			<option value="ENTRADA"  ${conta.tipo=='ENTRADA' ? 'selected':''}>Entrada</option>
			<option value="SAIDA"  	 ${conta.tipo=='SAIDA' ? 'selected':''}>Saída</option>
		</select>
		
		<br><br>
        Pago? <input type="checkbox" name="paga"     ${conta.paga?'checked':''} />
        
        <br><br>
        Data de Pagamento: <input type="text" name="dataPagamento" value="<fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy" />" />
        
		<br><br>
		
		<input type="hidden" id="id" value="${conta.id}">
		<input type="submit" value="Alterar Conta">
		
	</form>
</body>
</html>