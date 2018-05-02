<%@include file="../partials/cabecalho.jsp" %>

<p>Adicionar Produto</p>

<form action="./produtoSalvar" method="post">
  <div class="form-group">
    <label for="nome">Nome</label>
    <input type="text" class="form-control" id="nome" name="nome" autofocus>
  </div>
  <div class="form-group">
    <label for="descricao">Descrição</label>
    <textarea name="descricao" id="descricao" class="form-control" rows="3"></textarea>
  </div>
  <div class="form-group">
    <label for="validade">Validade</label>
    <input type="text" class="form-control" id="validade" name="validade">
  </div>
  <a href="./produtos" class="btn btn-secondary">Voltar</a> | 
  <button type="submit" class="btn btn-primary">Salvar</button>
</form>

<%@include file="../partials/rodape.jsp" %>