<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>

<main id="main">
  <div class="container">

  <!-- 메인 화면 -->
  <div class="txtBox lineOff managerTxtBox">
    <h1>AS</h1>
  </div>

  <!-- 상단 5개 선택 -->
  <ul class="customerList managerList">
    <li><a href="FaqList">FAQ</a></li>
    <li><a href="QnaList">Q&A</a></li>
    <li><a href="CounselList">1:1 전화상담 신청</a></li>
    <li class="on"><a href="AsList">A/S 신청</a></li>
    <li><a href="NoticeList">공지사항</a></li>
  </ul>

  <!-- contents / DB작업 -->
  <div id="list">
  	<div class="list">
  		<div class="noReply">
  			<p>미처리 : ${noReply}</p>
  		</div>
		<div class="searchBox">
		  <select name="category" id="asListCategory">
		    <option value="">선택</option>
		    <option value="name">이름</option>
		    <option value="title">제목</option>
		    <option value="contents">내용</option>
		  </select>
		  <input type="text" class="asListTxt" placeholder="검색어를 입력하세요" />
		  <button class="asListSearch">검색</button>
		</div>
	</div>
	<table>
	   <colgroup>
	    <col style="width: 5%" />
	    <col style="width: 10%" />
	    <col />
	    <col style="width: 15%" />
	    <col style="width: 15%" />
	    <col style="width: 5%" />
	  </colgroup>
	  <tr class="listHead">
	    <th>NO</th>
	    <th>NAME</th>
	    <th>TITLE</th>
	    <th>DATE</th>
	    <th>ASDATE</th>
	    <th>AS</th>
	  </tr>
	  <c:forEach items="${asList}" var="asDto" >
	  <tr>
	    <td>${asDto.num}</td>
	    <td>${asDto.name}</td>
	    <td><a href="AsView?no=${asDto.no }">${asDto.title}</a></td>
	    <fmt:parseDate value="${asDto.regDate}" var="regDate" pattern="yyyy-MM-dd"/>
	    <td><fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd"/></td>
	    <fmt:parseDate value="${asDto.replyRegDate}" var="replyRegDate" pattern="yyyy-MM-dd"/>
	    <td><fmt:formatDate value="${replyRegDate}" pattern="yyyy-MM-dd"/></td>
	    <td>${asDto.reply}</td>
	  </tr>
	  </c:forEach>
	</table>
	
	<div class="page">
	  <span class="material-icons"> arrow_left </span>
	  <ul>
	    <c:forEach items="${pageList }" var="pages">
   		<li class="${clickPage==pages? 'on' : '' }"><a href="AsList?page=${pages }&txt=${param.txt}&category=${param.option}">${pages }</a></li>
   		</c:forEach>
	  </ul>
	  <span class="material-icons"> arrow_right </span>
	</div>
  </div>

  <!-- 고객센터 하단 -->
</div>
</main>

<%@ include file="../include/footer.jsp" %>