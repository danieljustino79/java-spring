<%@include file="../partials/cabecalho.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<p>Lista de Produtos</p>

<c:if test="${fn:length(lista) gt 0}">
   <p>Produto(s): ${lista.size()}</p>
</c:if>


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
				<td><button>Editar</button></td>
				<td><button>Remover</button></td>
			</tr>
			</c:forEach>
		</table>
    </c:when>    
    <c:otherwise>
        Não há produtos cadastrados no momento.
    </c:otherwise>
</c:choose>




<%@include file="../partials/rodape.jsp" %>