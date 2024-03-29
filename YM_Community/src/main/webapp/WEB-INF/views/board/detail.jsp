<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
	    <title>Hello YongminLand</title>
	    <link rel="stylesheet" href="/resources/css/detail.css">
	    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	    <script src="/resources/js/header.js"></script>
    </head>
    
	<script>
    		$(document).ready(function(){
				var formObj = $("form[role='form']"); // 같은 폼의 메소드가 여러 개일 때 지정

				<!-- 수정버튼 클릭 -->
				$("#btn-update").on("click",function() {
					formObj.attr("action", "/board/update");
					formObj.attr("method","get");
					formObj.submit();
				})
				
				<!-- 삭제 버튼 클릭-->
				$("#btn-delete").on("click", function() {
					if(confirm("삭제하시겠습니까?")) {
						formObj.attr("action", "/board/delete");
						formObj.attr("method","post");
						formObj.submit();
						}
				})

				<!-- 목록 버튼 클릭 -->
				$("#btn-list").on("click",function() {
					location.href = "/board/list?page=${Scriteria.page}"
									+ "&perPageNum=${Scriteria.perPageNum}"
									+ "&searchType=${Scriteria.searchType}" 
									+ "&keyword=${Scriteria.keyword}";
				})
    		})
	</script>
    
    <body>
        <header id="header">
            <nav class="gnb-menu">
                <a href="/member/home">Home</a>
                <a href="list">Community</a>
                <a href="">Archive</a>
                <a href="">Contact</a>
            </nav>
            <c:if test="${member!=null}">
		        <div class="right-side">
		        	<label>${member.userName}님 환영합니다!</label>
		            <button id="btn-mypage" type="button">My Page</button>
		            <button id="btn-out" type="button">LogOut</button>
		        </div>
	        </c:if>
        </header>

        <main>
            <div class="list-title">
                <img src="/resources/images/coffee.png">
                <h1>Community</h1>
            </div>
            <div class="detail-table">
            	<form role="form" method="post">
	            	<input type="hidden" id="bno" name="bno" value="${read.bno}">
	                <input type="hidden" id="page" name="page" value="${Scriteria.page}">
	                <input type="hidden" id="perPageNum" name="perPageNum" value="${Scriteria.perPageNum}">
	                <input type="hidden" id="searchType" name="searchType" value="${Scriteria.searchType}">
	                <input type="hidden" id="keyword" name="keyword" value="${Scriteria.keyword}">
	            </form>
	                <table class="table">
	                    <tbody>
	                        <tr>
	                            <th>제목</th>
	                            <td class="text-align-left text-indent text-strong text-orange" colspan="3"><c:out value="${read.title}"/></td>
	                        </tr>
	                        <tr>
	                            <th>작성일</th>
	                            <td class="text-align-left text-indent" colspan="3"><fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                        </tr>
	                        <tr>
	                            <th>작성자</th>
	                            <td class="align-center"><c:out value="${read.writer}"/></td>
	                            <th>조회수</th>
	                            <td class="align-center"><c:out value="${read.hit}"/></td>
	                        </tr>
	                        <tr>
	                            <th>첨부파일</th>
	                            <td colspan="3" class="align-center"></td>
	                        </tr>
	                        <tr class="content">
	                            <td colspan="4"><c:out value="${read.content}" /></td>
	                        </tr>
	                    </tbody>
	                </table>
            </div>

            <div class="list-bottom-side">
            <c:if test="${member.userId==read.writer}">
	            <button type="submit" id="btn-update" >수정</button>
	            <button type="submit" id="btn-delete" >삭제</button>
	        </c:if>
                <button type="submit" id="btn-list" >목록</button>
            </div>

            <div class="prev-next">
                <table class="pn-table">
                    <tbody>
                    	<tr>
                            <th>다음글</th>
                            <td colspan="3"><a href="/board/detail?bno=${getNext.bno}&page=${Scriteria.page}&perPageNum=${Scriteria.perPageNum}&searchType=${Scriteria.searchType}&keyword=${Scriteria.keyword}">
                            <c:out value="${getNext.title}" /></a>
                            <c:if test="${getNext==null }">
                            <p>다음글이 없습니다.</p>
                            </c:if>
                            </td>
                    	</tr>
                    	
                        <tr>
                        	<th>이전글</th>
                            <td colspan="3"><a href="/board/detail?bno=${getPrev.bno}&page=${Scriteria.page}&perPageNum=${Scriteria.perPageNum}&searchType=${Scriteria.searchType}&keyword=${Scriteria.keyword}">
                            <c:out value="${getPrev.title}" /></a>
                            <c:if test="${getPrev==null }">
                            <p>이전글이 없습니다.</p>
                            </c:if>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>
    </body>
</html>