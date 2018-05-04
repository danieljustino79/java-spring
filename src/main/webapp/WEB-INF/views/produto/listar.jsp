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
				    <button class="btn btn-primary fas fa-trash-alt" onclick="Remover(this)" data-id="${item.id}"></button>
				</td>
			</tr>
			</c:forEach>
		</table>
    </c:when>    
    <c:otherwise>
        Não há produtos cadastrados no momento.
    </c:otherwise>
</c:choose>

<div id="modalRemover" class="modal" tabindex="-1" >
  <div class="modal-dialog" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Remover Produto</h5>
        <button type="button" class="close" data-dismiss="modal" >
          <span >&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p id="produtoNome"></p>
        <p>Voce tem certesa que deseja remover este Produto?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <form id="form1" method="post">
         <input type="hidden" id="id" name="id" />
         <button id="btnRemover" type="submit" class="btn btn-primary" onclick="ConfirmarRemover(this)">Confirmar</button>
        </form>
      </div>
    </div>
  </div>
</div>

<c:url value="/resources" var="resourcePath"/>
<script src="${resourcePath }/js/jquery.min.js"></script>
<script src="${resourcePath }/js/bootstrap.min.js"></script>
<script src="${resourcePath }/js/app-java-spring.js"></script>
<script>
function Remover(obj){
	
	var id = $(obj).data('id');	
	var urlEndPoint = "${host}/produtoRemover/"+id+".json"; 
	
	$.get(urlEndPoint, function( data ) {
        console.log("json"+ data );
    })
    .done(function(data) {
  	  obj = data;
  	  $('#produtoNome').text("Produto: "+obj.nome);
  	  $('#btnRemover').data('id', obj.id);
  	  
  	  $('#modalRemover').modal({
		  keyboard: false,
		  backdrop:'static'
		})
  	})
  	.fail(function() {
  		console.log( "error" );
  	});
}

function ConfirmarRemover(obj){
	
	$("#form1").submit(function(event) {
	  
		event.preventDefault();
		
		$('#id').val($(obj).data('id'));
		var urlEndPoint = "${host}/produtoRemoverConfirmar";
		$("#form1").attr('action', urlEndPoint);
		//fonte: https://stackoverflow.com/questions/31379409/form-submission-causing-maximum-call-stack-size-exceeded
		$('#form1')[0].submit();	  
	});
}
</script>

<%@include file="../partials/rodape.jsp" %>