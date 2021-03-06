<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import = "com.kh.faq.model.vo.FAQ" %>

<%
	FAQ f = (FAQ)request.getAttribute("faq");
%>


<style>
	.faq-header{
		margin : 0px;
		margin-top : 50px;
		
	}
	
	.form-control{
		font-size : 30px !important;
	}
	
	/* section{
		font-size : 20px;
	} */
	
	.title-con{
		width : 450px !important;
	}
	
	#faq-content{
		margin-top : 5px;
	}
	
	.write-container{
		font-size : 30px;	
	}
	
	.select-btn{
		width : 300px !important;
	}
	
	#blank{
		
		margin-right : 500px;
	}
	
	table {
	  border-collapse: separate;
	  border-spacing: 0 15px;
	}
	
	.btn-container button{
		font-size : 25px;
		font-weight : bolder;
	}
	
	#faq-container{
		height : 800px;
		width : 1000px;
		margin-left : 150px;
		
	}
	
	


</style>

<section id="faq-container">

	<div class="row">
		<div class="col-2"></div>
		<div class="container faq-header col-10">
			<p style="font-size:40px; font-weight:bolder;">FAQ 수정</p>
		</div>
	</div>
	
	
	<div class="write-container container form-group">
		<form action="<%=request.getContextPath() %>/faq/faqUpdateEnd"
		method="post">
			<input type="hidden" name="no" value="<%=f.getFaqNo() %>"/>
			
			<table id="tbl-faq">
			
				<colgroup>
					<col width="150px;" />
					<col width="750px;" />
					<col/>
				</colgroup>
			
				<tr>
					<th>제 목</th>
					<td>
						<input type="text" autocomplete="off" name="title" class="form-control title-con" value="<%=f.getFaqTitle()%>" id="faq_title" required/>
					</td>
				</tr>
				
				<tr>
					<th>카테고리</th>
						<td>
							<select class="form-control select-btn" name="category">
								<option value="">카테고리 선택</option>
								<option value="회원">회원</option>
								<option value="스터디개설">스터디개설</option>
								<option value="결제">결제</option>
								<option value="기타">기타</option>
							</select>
						</td>
					<!-- <input type="text" name="category" required></td> -->
				</tr>
				
				
				
				<tr id="faq-content">
					<th>내 용</th>
					<td>
						<textarea class="form-control" rows="8" name="content" style="resize:none;"><%=f.getFaqContent() %></textarea>
					</td>
				</tr>
				
				<!-- <tr>
					<th colspan="2">
						<input type="submit" value="등록"/>
					</th>
				</tr> -->
			</table>
			
			<div class="btn-container" style="display:flex; margin-top:30px;">
				<div id="blank">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div id="btn-regist">
					<button class="btn btn-outline-dark" type="submit">등록하기</button>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="back-to-list">
					<button class="btn btn-outline-dark" onclick="fn_backToList()">취 소</button>
				</div>
					
			</div>
		
		
		</form>

	</div>
</section>

<script>
	
	function fn_backToList(){
		location.replace("<%=request.getContextPath()%>/faq/faqList")
	}

</script>



<%@ include file="/views/common/footer.jsp"%>
