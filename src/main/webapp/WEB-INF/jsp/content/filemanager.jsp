
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<ol class="breadcrumb">
    <li><a href="<%=request.getContextPath().toString()%>"><span class="glyphicon glyphicon-hdd"></span></a></li>
            <c:forEach var="nav" items="${navegador}" >
        <li ><a href="#"  onclick="navegacionBreadCrum(${ubicado})"  title="${fn:indexOf(ubicado, nav) } - ${ubicado} - ${nav}"  >${nav}</a></li>
        </c:forEach>
        
</ol>
<!--<nav>
    <ul class="pager">
        <li><a href="#">Previous</a></li>
    </ul>
</nav>-->

<div id="cargando"  style="display: none">
    <img src="<%=request.getContextPath().toString()%>/resources/img/loading.gif" style="width: 20px"/>
</div>        
<table class="table table-responsive table-bordered table-hover table-striped" >
    <thead>
        <tr>
            <th>Tipo</th>
            <th>Dir/File</th>
            <!--<th>Ruta</th>-->
            <!--<th>Parent</th>-->
            <th>Descargar</th>
            <th>Borrar</th>
        </tr>

    </thead>
    <tbody>
        <c:forEach  var="r" items="${root}"  >
            <c:if test="${!r.isHidden()}">
                <tr class="items" style="cursor: pointer"  >
                    <c:choose>
                        <c:when test="${r.isDirectory()}">
                            <td>
                                <span class="glyphicon glyphicon-folder-open "   aria-hidden="true" ></span>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td class=""> 
                                <span class="glyphicon glyphicon-file  " aria-hidden="true"></span>
                            </td>
                        </c:otherwise>
                    </c:choose>

                    <td class="text-primary" title="${r.path}">
                        <h3>
                            <span class="label label-info ">${r.name}</span>   
                            <span class="badge">${fn:length(r.list())}</span>  
                        </h3>

                    </td>
                    <!--<td>${r.path}</td>-->
                    <!--<td>${r.parent}</td>-->

                    <td>
                        <c:if test="${!r.isDirectory()}">
                            <button type="button" class="btn btn-default btn-lg btn-warning">
                                <span class="glyphicon glyphicon-download" aria-hidden="true"></span> 
                            </button>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${!r.isDirectory()}">
                            <button type="button" class="btn btn-default btn-lg btn-danger">
                                <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span> 
                            </button>
                        </c:if>
                    </td>
                </tr>
            </c:if>
        </c:forEach> 
    </tbody>
    <c:if test="${empty root}"><h3 class="alert-warning">No se encontraron archivos</h3></c:if>
${img}
</table>