<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Caelum</title>

<script src="resources/js/jquery.js"></script>

<script type="text/javascript">
	
	function deuCerto(resp){
		alert("Conta paga com sucesso");
		
	}
	
	function pagarConta(id){
		$.get("pagaConta?id=" + id,function() {
			  $("#conta_"+id).html("Paga");
		});
	}


</script>

</head>
<body>
	<table style="height: 10px; width: 775px;" border="1">
        <tr>
        <th>Código</th>
        <th>Descrição</th>
        <th>Valor</th>
        <th>Tipo</th>
        <th>Paga?</th>
        <th>Data de pagamento</th>
        </tr>

        <c:forEach items="${todasContas}" var="conta">
        <tr>
            <td>${conta.id}</td>
            <td>${conta.descricao}</td>
            <td>${conta.valor}</td>
            <td>${conta.tipo}</td>
            <td id="conta_${conta.id}">
            <c:if test="${conta.paga eq false}">
            	Não paga
            </c:if>
            <c:if test="${conta.paga eq true }">
            	Paga!
            </c:if>
            </td>
            <td><fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy"/></td>
            
            <td>
				<a href="removeConta?id=${conta.id}">Deletar</a>
				
				<c:if test="${conta.paga eq false}">
					<a href="javascript:pagarConta(${conta.id})">Paga</a>
				</c:if>
				
				<a href="formularioAlterar?id=${conta.id}">Alterar</a>	
			</td>
        </tr>     
        </c:forEach>
    </table>
</body>
</html>