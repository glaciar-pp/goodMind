<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div>
        <nav>
            <div class="container-fluid" id="airLogo"> 
            <img src="/img/airLogo.svg" alt="Logo" class="rounded-3 mx-2">
            </div>
            <div class="navbar-text me-3" id="projectName" >기분어때?
            </div>
            <div class="navbar-text" id="welcome"> 
	  			<c:if test="${not empty uname}">
	                ${uname}님 환영합니다. 
				</c:if>
				<c:if test="${empty uname}">
	                비회원 상태입니다. 
				</c:if>
				<c:if test="${not empty uid}">
				<a class="float-end" href="/goodM/user/logout"><i class="fas fa-sign-out-alt"></i>  로그아웃</a>
				</c:if>
				<c:if test="${empty uid}">
				<a class="float-end" href="/goodM/user/login"><i class="fas fa-sign-out-alt"></i> 로그인</a>
				</c:if>
            </div>
        </nav>
    </div>    
 