<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html dir="ltr" lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="description" content="Tastebite">
<meta name="keywords" content="Tastebite">
<meta name="author" content="Tastebite">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<link
	href="https://fabrx.co/preview/tastebite/assets/images/favicon.ico"
	rel="shortcut icon" type="image/x-icon">

<link href="/resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">

<link href="/resources/css/swiper-bundle.min.css" rel="stylesheet"
	type="text/css" media="all">

<link href="/resources/css/tastebite-styles.css" rel="stylesheet"
	type="text/css" media="all">

<style>
body {
	margin: auto;
}
</style>

<style>
img.rounded-circle {
	width: 150px;
	height: 150px;
}

/* Style the buttons that are used to open and close the accordion panel */
.accordion {
	background-color: #eee;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	text-align: left;
	border: none;
	outline: none;
	transition: 0.4s;
}

/* Add a background color to the button if it is clicked on (add the .active class with JS), and when you move the mouse over it (hover) */
.active, .accordion:hover {
	background-color: #ccc;
}

/* Style the accordion panel. Note: hidden by default */
.panel {
	padding: 0 18px;
	background-color: white;
	display: none;
	overflow: hidden;
}

@media screen and (min-width: 1008px) {
	body {
		width: 1140px;
		margin: auto;
	}
}

@media screen and (min-width: 641px) and (max-width: 1008px) {
	body {
		width: 800px;
		margin: auto;
	}
}

table th {
	text-align: center;
}

.middle {
  /* 이하 필수 설정 */
  position: absolute; left: 50%; top: 50%; 
  transform: translate(-50%, -50%); text-align: center;
  /* 이하 꾸밈 설정 */
  background: white;
}
</style>

<script>
	document.addEventListener("DOMContentLoaded", function(event) {

		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				/* Toggle between adding and removing the "active" class,
				to highlight the button that controls the panel */
				this.classList.toggle("active");

				/* Toggle between hiding and showing the active panel */
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			});
		}
	});
</script>
</head>

<body>

	<section class="tstbite-section p-0">
		<div class="container">

			<header class="tstbite-header bg-white">
				<nav class="navbar navbar-expand-lg has-header-inner px-0">
					<a class="navbar-brand" href="/"> <img
						src="/resources/img/meokalogo.png"
						style="max-width: 161px; opacity: 8.0;">
					</a>
					<div
						class="tstbite-header-links d-flex align-items-center ml-auto order-0 order-lg-2">
						<a href="/recipe/list" class="search-link"> <svg
								xmlns="http://www.w3.org/2000/svg" width="26.667"
								height="26.667" viewBox="0 0 26.667 26.667">
<path
									d="M24.39,26.276l-4.9-4.9a12.012,12.012,0,1,1,1.885-1.885l4.9,4.9a1.334,1.334,0,0,1-1.886,1.886ZM2.666,12a9.329,9.329,0,0,0,15.827,6.7,1.338,1.338,0,0,1,.206-.206A9.332,9.332,0,1,0,2.666,12Z"></path>
</svg>
						</a>

						<!-- lab begin -->
						<c:if test="${not empty login}">
							<a href="/user/info" class="ml-4 ml-md-4 mr-2 mr-md-0 circle">
								<img src="/resources/img/avatar1.png" alt="Avatar">
							</a>
						</c:if>

						<c:if test="${empty login}">
							<a href="javascript:void(0);" data-toggle="modal"
								data-target="#exampleModalCenter"
								class="btn btn-sm btn-outline-dark ml-0 ml-md-4"
								style="width: 90px; height: 28px; padding: 3px 20px 2px 20px;">로그인</a>
						</c:if>
						<!-- lab end -->

						<!-- modal lab begin -->
						<div class="modal fade" id="exampleModalCenter" tabindex="-1"
							role="dialog" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content rounded-4 shadow-17 mb-4 mb-md-5">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true"> <svg id="feather-icon_search"
												data-name="feather-icon/search"
												xmlns="http://www.w3.org/2000/svg" width="24" height="24"
												viewBox="0 0 24 24">
<rect id="Bounding_Box" data-name="Bounding Box" width="24" height="24"
													fill="#d8d8d8" opacity="0"></rect>
<path id="Shape"
													d="M14.435,15.849,8.071,9.485,1.707,15.849A1,1,0,0,1,.293,14.435L6.657,8.071.293,1.707A1,1,0,0,1,1.707.293L8.071,6.657,14.435.293a1,1,0,0,1,1.414,1.415L9.485,8.071l6.364,6.364a1,1,0,1,1-1.414,1.414Z"
													transform="translate(3.929 3.929)"></path>
</svg>
										</span>
									</button>
									<div class="modal-body">
										<h6 class="text-uppercase mb-4 pb-2"
											style="font-size: 23px; font-family: inter, sans-serif;">로그인</h6>
										<form action="/user/loginPost" method="post">
											<div class="form-group mt-md-3 pb-md-3">
												<div class="form-control-box">
													<input type="text" class="form-control" placeholder="아이디"
														name="memberId"> <span class="form-icon"> <img
														id="Icon" src="/resources/img/following.png" width="24"
														height="24" viewBox="0 0 24 24"> <rect
															data-name="Bounding Box" width="24" height="24"
															fill="rgba(255,255,255,0)"></rect> <path
															d="M3,18a3,3,0,0,1-3-3V3.01C0,3,0,2.99,0,2.98A3,3,0,0,1,3,0H19a3,3,0,0,1,3,2.968c0,.018,0,.036,0,.054V15a3,3,0,0,1-3,3ZM2,15a1,1,0,0,0,1,1H19a1,1,0,0,0,1-1V4.921l-8.427,5.9a1,1,0,0,1-1.147,0L2,4.921ZM11,8.78l8.895-6.226A1,1,0,0,0,19,2H3a1,1,0,0,0-.895.553Z"
															transform="translate(1 3)" fill="#7f7f7f"></path> </svg>
													</span>
												</div>
											</div>

											<div class="form-group mt-md-3 pb-md-3">
												<div class="form-control-box">
													<input type="password" class="form-control"
														placeholder="비밀번호" name="password"> <span
														class="form-icon"> <img
														src="/resources/img/lock.png" width="24" height="24"
														viewBox="0 0 24 24"> <rect data-name="Bounding Box"
															width="24" height="24" fill="rgba(255,255,255,0)"></rect>
														<path
															d="M3,22a3,3,0,0,1-3-3V12A3,3,0,0,1,3,9H4V6A6,6,0,0,1,16,6V9h1a3,3,0,0,1,3,3v7a3,3,0,0,1-3,3ZM2,12v7a1,1,0,0,0,1,1H17a1,1,0,0,0,1-1V12a1,1,0,0,0-1-1H3A1,1,0,0,0,2,12ZM14,9V6A4,4,0,1,0,6,6V9Z"
															transform="translate(2 1)" fill="#7f7f7f"></path> </svg>
													</span>
													<div class="text" style="float: left">
														<a href="/user/findId"
															class="text-orange small font-weight-medium">아이디 찾기</a>
													</div>
													<div class="text-right" style="float: right">
														<a href="/mail/mailForm"
															class="text-orange small font-weight-medium">비밀번호 찾기</a>
													</div>
												</div>
											</div>
											<button type="submit"
												class="btn btn-lg btn-block btn-primary">로그인</button>
										</form>


										<p class="text-center font-weight-light mt-4 pt-2"
											style="font-size: 13px;">카카오톡 or 네이버로 회원가입</p>
										<ul class="login-social list-unstyled">
											<li><a href="javascript:void(0);" class="카카오톡"> <img
													src="/resources/img/kakao1.png" alt="Icon" width="19"
													height="19"> <span>카카오톡</span>
											</a></li>
											<li><a href="javascript:void(0);" class="네이버"> <img
													src="/resources/img/naverlogo.png" alt="Icon" width="19"
													height="19"> <span>네이버</span>
											</a></li>
										</ul>
										<div class="text-center login-footer">
											<p>
												"아직도 회원이 아니세요?" <a href="/user/join">회원가입</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- modal lab end -->


					</div>
					<button class="navbar-toggler pr-0 ml-2 ml-md-3" type="button"
						data-toggle="collapse" data-target="#menu-4"
						aria-controls="menu-4" aria-expanded="false"
						aria-label="Toggle navigation">
						<svg data-name="Icon/Hamburger" xmlns="http://www.w3.org/2000/svg"
							width="24" height="24" viewBox="0 0 24 24">
<path data-name="Icon Color"
								d="M1.033,14a1.2,1.2,0,0,1-.409-.069.947.947,0,0,1-.337-.207,1.2,1.2,0,0,1-.216-.333,1.046,1.046,0,0,1-.072-.4A1.072,1.072,0,0,1,.072,12.6a.892.892,0,0,1,.216-.321.947.947,0,0,1,.337-.207A1.2,1.2,0,0,1,1.033,12H22.967a1.206,1.206,0,0,1,.409.069.935.935,0,0,1,.336.207.9.9,0,0,1,.217.321,1.072,1.072,0,0,1,.072.391,1.046,1.046,0,0,1-.072.4,1.206,1.206,0,0,1-.217.333.935.935,0,0,1-.336.207,1.206,1.206,0,0,1-.409.069Zm0-6a1.2,1.2,0,0,1-.409-.069.934.934,0,0,1-.337-.207,1.189,1.189,0,0,1-.216-.333A1.046,1.046,0,0,1,0,6.989,1.068,1.068,0,0,1,.072,6.6a.9.9,0,0,1,.216-.322.947.947,0,0,1,.337-.207A1.2,1.2,0,0,1,1.033,6H22.967a1.206,1.206,0,0,1,.409.068.935.935,0,0,1,.336.207.9.9,0,0,1,.217.322A1.068,1.068,0,0,1,24,6.989a1.046,1.046,0,0,1-.072.4,1.193,1.193,0,0,1-.217.333.923.923,0,0,1-.336.207A1.206,1.206,0,0,1,22.967,8Zm0-6a1.2,1.2,0,0,1-.409-.068.947.947,0,0,1-.337-.207,1.193,1.193,0,0,1-.216-.334A1.039,1.039,0,0,1,0,.988,1.068,1.068,0,0,1,.072.6.892.892,0,0,1,.288.276.934.934,0,0,1,.625.069,1.2,1.2,0,0,1,1.033,0H22.967a1.206,1.206,0,0,1,.409.069.923.923,0,0,1,.336.207A.9.9,0,0,1,23.928.6,1.068,1.068,0,0,1,24,.988a1.039,1.039,0,0,1-.072.4,1.2,1.2,0,0,1-.217.334.935.935,0,0,1-.336.207A1.206,1.206,0,0,1,22.967,2Z"
								transform="translate(0 5)" fill="#000"></path>
</svg>
					</button>
					<div class="collapse navbar-collapse" id="menu-4">
						<ul class="navbar-nav m-auto pt-3 pt-lg-0">
							<li class="nav-item dropdown"><a class="nav-link" href="#"
								role="button" id="HomePage" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span>레시피
								</span> <svg xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="HomePage">
									<a class="dropdown-item" href="/recipe/list">레시피</a> <a
										class="dropdown-item" href="/rec/list">추천</a> <a
										class="dropdown-item" href="home-v3">레시시피 3</a> <a
										class="dropdown-item" href="/recipe/write">레시피 작성</a>
								</div></li>
							<li class="nav-item dropdown"><a class="nav-link" href="#"
								role="button" id="RecipePage" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span>음식
								</span> <svg xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="RecipePage">
									<a class="dropdown-item" href="/food/list">음식 1
									</a> <a class="dropdown-item" href="/food/write">음식 2</a>
								</div></li>
												<li class="nav-item dropdown"><a class="nav-link" href="#"
								role="button" id="RecipePage" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span>테마
								</span> <svg xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="RecipePage">
									<a class="dropdown-item" href="/theme/list">테마 1 
									</a> <a class="dropdown-item" href="/theme/write">테마 2 </a>
								</div></li>


			<li class="nav-item dropdown"><a class="nav-link" href="#"
								role="button" id="RecipePage" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <span>푸드 테마
								</span> <svg xmlns="http://www.w3.org/2000/svg" width="9.333"
										height="5.333" viewBox="0 0 9.333 5.333">
<path
											d="M1.138.2A.667.667,0,0,0,.2,1.138l4,4a.667.667,0,0,0,.943,0l4-4A.667.667,0,1,0,8.2.2L4.667,3.724Z"></path>
</svg>
							</a>
								<div class="dropdown-menu" aria-labelledby="RecipePage">
									<a class="dropdown-item" href="/foodTheme/foodList">푸드테마 1
									</a> <a class="dropdown-item" href="/foodTheme/list">푸드테마 2</a>
									</a> <a class="dropdown-item" href="/foodTheme/write">푸드테마 작성 3</a>
								</div></li>
						
							<li class="nav-item"><a class="nav-link" href="/board/list">Q&A</a></li>
							
						</ul>
					</div>
				</nav>
			</header>