<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.kh.faq.model.vo.FAQ" %>    
<%
	List<FAQ> list=(List)request.getAttribute("list");
%>
<table class="table table-hover tbl-faq">
	
	<colgroup>
		<col width="150px;" />
		<col width="750px;" />
		<col/>
	</colgroup>
	
	<tr>
		<th>카테고리</th>
		<th>제 목</th>
	</tr>
	
	<%for(FAQ f : list){ %>
		<tr>
			<td class="faq-category"><%= f.getFaqCategory() %></td>				
			<td><a href="<%= request.getContextPath() %>/faq/faqView?no=<%=f.getFaqNo() %>">
					<%= f.getFaqTitle() %>
				</a>
			</td>
		</tr>
	
	<%} %>
	
</table>




<div id="pagebar"  class="container pageBar-container">
	<ul class="pagination">
		<%=request.getAttribute("pageBar") %>
	</ul>
</div>
