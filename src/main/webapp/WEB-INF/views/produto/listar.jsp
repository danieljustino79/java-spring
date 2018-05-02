<%@include file="../partials/cabecalho.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<p>Lista de Produtos</p>

<c:if test="${not empty mensagem}">
  <div class="alert alert-warning alert-dismissible fade show">
   ${mensagem }
   <button type="button" class="close" data-dismiss="alert">
    <span >&times;</span>
   </button>
  </div>
</c:if>

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

<c:url value="/resources" var="resourcePath"/>
<script src="${resourcePath }/js/jquery-3.3.1.slim.min.js"></script>
<script src="${resourcePath }/js/popper.min.js"></script>
<script src="${resourcePath }/js/bootstrap.min.js"></script>

<%@include file="../partials/rodape.jsp" %>