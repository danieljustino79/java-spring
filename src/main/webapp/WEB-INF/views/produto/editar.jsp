<%@include file="../partials/cabecalho.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>

<p>Editar Produto</p>

<%@include file="../partials/mensagem.jsp" %>

<form action="<c:url value='/produtoSalvarEditar'/>" method="post">
  <input type="hidden" name="id" value="${item.id }"/>
  <div class="form-group">  
    <label for="nome">Nome</label>
    <input type="text" class="form-control" id="nome" name="nome" autofocus
    value="${item.nome }">
  </div>
  <div class="form-group">
    <label for="descricao">Descrição</label>
    <textarea name="descricao" id="descricao" class="form-control" rows="3">${item.descricao }</textarea>
  </div>
  <div class="form-group">
    <label for="validade">Validade</label>
    <fmt:formatDate pattern="dd/MM/yyyy" value="${item.validade.time }" var="validadeFormatada" />
    <input type="text" class="form-control" id="validade" name="validade"
    value="${validadeFormatada }">
    
  </div>
  <a href="<c:url value='/produtos'/>" class="btn btn-secondary">Voltar</a> | 
  <button type="submit" class="btn btn-primary">Salvar</button>
</form>

<c:url value="/resources" var="resourcePath"/>
<script src="${resourcePath }/js/jquery-3.3.1.slim.min.js"></script>
<script src="${resourcePath }/js/popper.min.js"></script>
<script src="${resourcePath }/js/bootstrap.min.js"></script>

<%@include file="../partials/rodape.jsp" %>