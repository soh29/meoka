<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr"/>
<title>Home</title>


</head>
<body>

	
						<!-- modal lab end -->





						<!-- lab begin -->
						<!-- <a class="dropdown-item" href="#" data-toggle="modal" data-target="#moaModal">
								<i class="fas fa-arrow-right"></i></a> -->
						<!-- lab end -->

					
					

			<div class="tstbite-search">
				<div class="container">
					<div class="input-group search-box">
						<input type="text" name="Search" placeholder="Search"
							class="form-control" id="Search">
						<button type="button">
							<img src="/resources/img/close.svg" alt="img">
						</button>
					</div>
					<div class="search-results" id="SearchList">
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu111.png" class="rounded-circle"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Cake</strong> <span class="tiny">Category</span>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu112.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Black Forest Birthday Cake</strong>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu113.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Double Thick Layered Sponge Cake</strong>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu114.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Cranberry Macaroon Ice cream
										Cake</strong>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu115.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Almond Cinnamon Sponge Cake</strong>
								</div>
							</a>
						</div>
						<div class="tstbite-search-list">
							<a href="#0">
								<figure>
									<img src="/resources/img/menu116.jpg" class="rounded-2"
										alt="Menu">
								</figure>
								<div class="tstbite-search-name">
									<strong class="small">Four Mini Birthday Cupcakes</strong>
								</div>
							</a>
						</div>
						<div class="text-center py-4">
							<a href="#0" class="btn btn-sm btn-outline-dark px-4 py-2">See
								all 343 results</a>
						</div>
					</div>
				</div>
			</div>









<form role="form" method="post">
	<input name="bno" type="hidden" value="${boardVO.bno }">
	<input name="groupno" type="hidden" value="${boardVO.groupno }">
	<input name="grouporder" type="hidden" value="${boardVO.grouporder }">
	<input name="depth" type="hidden" value="${boardVO.depth }">
	
	<h6>제목</h6>
	<input class="form-control bg-lightest-gray"  type="text" name="title"><br>
	<h6>작성자</h6>
	<input class="form-control bg-lightest-gray"  type="text" name="writer" value="${login.memberId }"><br>
	<h6>내용</h6>
	<textarea class="form-control bg-lightest-gray"  name="content"></textarea>
	
	<button class="btn btn-primary" type="submit">작성</button>
	<button class="btn btn-primary" type="button" onclick="location.href='list'">글 목록</button>
</form>






<!-- jQuery 2.1.4 --><!-- Bootstrap 3.3.2 JS -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script>

	$("button[type='submit']").on("click", function(event) {
		event.preventDefault();
		//alert();
		var form = $("form[role='form']");
		if(form.children("input[name='title']").val()==="")	{
			alert("제목을 입력하세요.");
			return;
		}
		if(form.children("textarea[name='content']").val()==="")	{
			alert("내용을 입력하세요.");
			return;
		}
		form.submit();
	});
</script>




<%@include file="../include/footer.jsp"%>




	</section>

	<script src="/resources/js/bootstrap.bundle.min.js"
		type="text/javascript"></script>
	<script src="/resources/js/html5.min.js" type="text/javascript"></script>
	<script src="/resources/js/sticky.min.js" type="text/javascript"></script>
	<script src="/resources/js/swiper-bundle.min.js"
		type="text/javascript"></script>
	<script src="/resources/js/masonry.min.js" type="text/javascript"></script>
	<script src="/resources/js/tastebite-scripts.js"
		type="text/javascript"></script>
	<script defer="" src="/resources/js/beacon.min.js"
		data-cf-beacon="{&quot;rayId&quot;:&quot;6a50d4b4c883204a&quot;,&quot;version&quot;:&quot;2021.10.0&quot;,&quot;r&quot;:1,&quot;token&quot;:&quot;9ae02b4a12234f118cf01e6f25c04e9d&quot;,&quot;si&quot;:100}"></script>



	<!-- lab end -->
</body>
</html>
