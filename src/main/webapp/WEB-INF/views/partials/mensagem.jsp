<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<c:if test="${not empty mensagem}">
  <div class="alert alert-warning alert-dismissible fade show">
   ${mensagem }
   <button type="button" class="close" data-dismiss="alert">
    <span >&times;</span>
   </button>
  </div>
</c:if>