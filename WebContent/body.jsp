<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<div class="flex-layout">
		<c:forEach items="${listA}" var="p" >
			<div class="flex-item" onclick="location.href='InformationProductController?id=${p.id}'">
				<div class="flex-content">
					<img
						src="${p.src}" alt="" class="flex-image" />
					<div class="content">
						<h4 class="phone-co">${fn:toUpperCase(p.type)}</h4>
						<p class="phone-name">${p.name}</p>
						<p class="phone-cost">$${p.price }</p>
					</div>
				</div>
			</div>

		</c:forEach>
	</div>
	<%-- Paging java --%>
	<div class="pagination_rounded">
		<ul>
			<li><a href="ListProduct?index=${tag-1}" class="prev ${tag==1?'hidden':'' }"><i
					class="fa fa-angle-double-left"></i> Prev </a></li>
			<c:forEach begin="1" end="${endP}" var="i">
				<li class="hidden-xs"><a href="ListProduct?index=${i}" class='${tag ==i?"active":"" }'>${i}</a></li>
			</c:forEach>
			<li><a href="ListProduct?index=${tag+1}" class="next ${tag==endP?'hidden':'' }"> Next <i
					class="fa fa-angle-double-right" aria-hidden="true"></i></a></li>
		</ul>
	</div>

