<%@include file="../partials/cabecalho.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<p>Detalhe do Produto</p>

<div class="row">
<div class="col-6">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">${item.nome }</h5>
    <p class="card-text">${item.descricao }</p>
    <fmt:formatDate pattern="dd/MM/yyyy" value="${item.validade.time }" var="validadeFormatada" />
    <p>Validade: ${validadeFormatada }</p>
    <p><a href="${host }/produtoDetalhe/${item.id}.json">Json</a></p>
  </div>
</div>
</div>
</div>
<br>
<a href="<c:url value='/produtos'/>" class="btn btn-secondary">Voltar</a>

<%@include file="../partials/rodape.jsp" %>