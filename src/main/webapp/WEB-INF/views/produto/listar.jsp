<%@include file="../partials/cabecalho.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>


<p>Lista de Produtos</p>

<%@include file="../partials/mensagem.jsp" %>

<a href="./produtoAdicionar" class="btn btn-primary">Adicionar</a>

<c:choose>
    <c:when test="${lista.size() > 0}">
        <table>
			<c:forEach items="${lista}" var="item">		
			<tr>
				<td>${item.nome }</td>
				<td>${item.descricao }</td>
				<td>
					<fmt:formatDate pattern="dd/MM/yyyy" value="${item.validade.time }" />
				</td>
				<td>
					<a href="./produtoDetalhe/${item.id }" class="btn btn-primary fas fa-eye"></a>
				</td>
				<td>
					<a href="./produtoEditar/?id=${item.id }" class="btn btn-primary fas fa-edit"></a>
				</td>
				<td>
					<a href="" class="btn btn-primary fas fa-trash-alt"></a>
				</td>
			</tr>
			</c:forEach>
		</table>
    </c:when>    
    <c:otherwise>
        Não há produtos cadastrados no momento.
    </c:otherwise>
</c:choose>

<c:url value="/resources" var="resourcePath"/>
<script src="${resourcePath }/js/jquery-3.3.1.slim.min.js"></script>
<script src="${resourcePath }/js/popper.min.js"></script>
<script src="${resourcePath }/js/bootstrap.min.js"></script>
<script>
	function ConfirmarRemover(obj){
		alert($(obj).data('id'))
	}
</script>

<%@include file="../partials/rodape.jsp" %>