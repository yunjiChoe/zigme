<!--
     Date : 2021/07/02
     Writer : 2조
     Content : Spring project 변환
     version : V1.0.0
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.css" />

<!-- 메뉴 style -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/menu.css" />

<!-- 사용자정의 스타일 위에 위치하도록 해주세요 -->
<c:import url="../inc/header.jsp" />
<style type="text/css">
.nav>li>a {
	font-size: 16px;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus
	{
	color: #ffffff;
	background-color: #3cf;
}

.nav-tabs>li>a {
	color: #ffffff;
	background-color: #037;
}

.form-control {
	padding: 0px;
	font-size: 13px;
}

#parent.form-control {
	font-family: none;
	margin-bottom: 6px;
}

option {
	font-family: none;
}

.tab-pane>p {
	font-size: 15px;
	color: #000000;
	margin: 3px 30px 0 0;
}

button {
	margin-left: 10px;
	color: #000000;
}
</style>
</head>
<body>
	<div class="container">
		<!--  include :: container 바로 아래에 있어야합니다 -->
		<c:import url="../inc/navbar.jsp" />
		<div class="content">
			<p class="sub_title">선호 음식 순위</p>
			<!-- <form class="form-inline pull-right">
				<div class="form-group">
					<select id="parent" class="form-control">
						<option value="">--- 선택하세요 ---</option>
						<option value="202010">2020년 10월</option>
						<option value="202011">2020년 11월</option>
						<option value="202012">2020년 12월</option>
					</select>
				</div>
				<span class="between"> &nbsp;<strong>~</strong>&nbsp;
				</span>
				<div class="form-group">
					<select id="parent" class="form-control">
						<option value="">--- 선택하세요 ---</option>
						<option value="202106">2021년 6월</option>
						<option value="202107">2021년 7월</option>
						<option value="202108">2021년 8월</option>
					</select>
				</div>
				<button type="button" class="btn btn-default view">
					<b>조회</b>
				</button>
			</form> -->
			<!-- 탭 메뉴 시작 -->
			<ul id="myTab" class="nav nav-tabs">
				<li class="active"><a href="#gna" data-toggle="tab">성별/연령별</a></li>
				<li><a href="#weather" data-toggle="tab">날씨별</a></li>
			</ul>
			<!-- 탭 메뉴 끝 -->

			<!-- 탭 화면 시작 -->
			<div class="tab-content">
				<div class="tab-pane fade in active" id="gna">
					<br />
					<!-- <div class="selection">
						
						<strong><span id="none">l</span>&nbsp;&nbsp;성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</strong>
						<div class="btn-group" data-toggle="buttons">
							<button type="button" class="pull-left btn btn-sm" id="men">
								&nbsp;&nbsp;&nbsp;<b>남성</b>&nbsp;&nbsp;&nbsp;
							</button>
							<button type="button" class="pull-left btn btn-sm" id="women">
								&nbsp;&nbsp;&nbsp;<b>여성</b>&nbsp;&nbsp;&nbsp;
							</button>
						</div>

						<br /> <br />
						
						<strong>&nbsp;연령별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
						<div class="btn-group" data-toggle="buttons">
							<button type="button" class="pull-left btn btn-sm btn-success"
								id="twenties">
								&nbsp;&nbsp;&nbsp;<b>20대</b>&nbsp;&nbsp;&nbsp;
							</button>
							<button type="button" class="pull-left btn btn-sm btn-info"
								id="thirties">
								&nbsp;&nbsp;&nbsp;<b>30대</b>&nbsp;&nbsp;&nbsp;
							</button>
							<button type="button" class="pull-left btn btn-sm btn-warning"
								id="fourties">
								&nbsp;&nbsp;&nbsp;<b>40대</b>&nbsp;&nbsp;&nbsp;
							</button>
							<button type="button" class="pull-left btn btn-sm btn-primary"
								id="fifties">
								<b>50대 이상</b>
							</button>
						</div>
					</div> -->
					<div class="chart1">
						<br />
						<!-- <p class="type1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방문횟수</p> -->
						<div class="axis clearfix">
							<div class="pull-left">
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br>
							</div>
							<div class="pull-left"  >
							<canvas id="line-chart" width="1000" height="500"></canvas>
								
							</div>
						</div>
						<!-- <p class="type2">업종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
						<p class="category">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							한식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							분식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							양식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 그
							외&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							일식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							중식&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p> -->
					</div>
				</div>

				<div class="tab-pane fade" id="weather">
					<br />

					<div class="btn-group">
						<button type="button" class="pull-left btn btn-lg btn-default"
							id="sunny">
							<img
								src="${pageContext.request.contextPath}/img/common/weather-icons/002-sunny.png"
								width="55"><b> 맑음</b>
						</button>
						<button type="button" class="pull-left btn btn-lg btn-default"
							id="cloudy">
							<img
								src="${pageContext.request.contextPath}/img/common/weather-icons/005-cloudy.png"
								width="55"><b> 흐림</b>
						</button>
						<button type="button" class="pull-left btn btn-lg btn-default"
							id="rainy">
							<img
								src="${pageContext.request.contextPath}/img/common/weather-icons/012-rainy.png"
								width="60"><b> 비</b>
						</button>
						<button type="button" class="pull-left btn btn-lg btn-default"
							id="snowy">
							<img
								src="${pageContext.request.contextPath}/img/common/weather-icons/008-snowy.png"
								width="60"><b> 눈</b>
						</button>
					</div>

					<div class="chart2">
						<br />
						<p class="topfive">
							<strong>"&nbsp;<span id="day"></span>&nbsp;" 날 선호 음식 Top
								5
							</strong>
						</p>
						<div class="show clearfix">
							<div class="pull-left">
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br> <br> <br> <br> <br>
								<br> <br> <br>
							</div>
							<div class="pull-left">
							<canvas id="myChart" width="1000"></canvas>
								
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- 탭 화면 끝 -->
		</div>
	</div>
	<!-- //container 종료 -->


	<!-- include :: Javascript 파일 포함 
      <script src="../assets/js/jquery.min.js"></script>
      <script src="../assets/js/bootstrap.min.js"></script>
      
      </body> 바로 위에 위치해야합니다. 
    -->
	<c:import url="../inc/footer.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
	<script type="text/javascript">
	new Chart(document.getElementById("line-chart"), {
		  type: 'line',
		  data: {
		    labels: ["한식","양식","일식","중식","분식","그외"],
		    datasets: [{ 
		        data: [17,6,7,10,3,2],
		        label: "남성 ",
		        borderColor: "#3e95cd",
		        fill: false
		      }, { 
		        data: [8,19,9,8,11,5],
		        label: "여성 ",
		        borderColor: "#8e5ea2",
		        fill: false
		      }, { 
		        data: [10,15,12,10,3,8],
		        label: "20대 ",
		        borderColor: "#3cba9f",
		        fill: false
		      }, 
		      { 
		        data: [1,11,15,11,13,4],
		        label: "30대",
		        borderColor: "#e8c3b9",
		        fill: false
		      }, 
		      { 
			     data: [11,4,15,7,3,2],
			     label: "40대",
			     borderColor: "#999",
			     fill: false
			   }, 
			   { 
		        data: [18,1,11,3,3,2],
		        label: "50대 이상",
		        borderColor: "#c45850",
		        fill: false
		      }
		    ]
		  },
		  options: {
		    title: {
		      display: true,
		      text: ''
		    }
		  }
		});
	

	
		$(function() {
			$("#men").click(function() {
				$("#male").toggleClass("on off");
			});

			$("#women").click(function() {
				$("#female").toggleClass("on off");
			});

			$("#twenties").click(function() {
				$("#zg").toggleClass("on off");
			});

			$("#thirties").click(function() {
				$("#yg").toggleClass("on off");
			});

			$("#fourties").click(function() {
				$("#xg").toggleClass("on off");
			});

			$("#fifties").click(function() {
				$("#old").toggleClass("on off");
			});

		});
		
		$(function(){
			$("#sunny").click(function() {
								$("#day").html("맑은");
								var ctx = document.getElementById('myChart').getContext('2d');
								var chart = new Chart(ctx, {
								    // The type of chart we want to create
								    type: 'pie',

								    // The data for our dataset
								    data: {
								    	labels: ['냉면', '딤섬', '닭가슴살샐러드', '스테이크', '또띠아'],
								        datasets: [{
								            label: 'My First dataset',
								            backgroundColor: [
								            	'rgb(116, 140, 65)',								            	
								            	'rgb(133, 165, 78)',
								            	'rgb(155, 187, 89)',
								            	'rgb(185, 205, 150)',
								            	'rgb(209, 222, 190)'
								            	],
								            borderColor: 'white',
								            data: [35, 23, 21, 14, 7],
								            fontSize: 20
								        }]
								    },

								    // Configuration options go here
								    options: {
									    title: {
									      display: true,
									      
									      text: "",
									      fontColor: 'black'
									      
									    },
							            legend: {
							                labels: {
							                	fontColor: 'black',
							                	fontSize: 20
							                }
							            }
								    }
								});
								
							});

			$("#cloudy").click(function() {
				
				
						$("#day").html("흐린");
						
						var ctx = document.getElementById('myChart').getContext('2d');
						var chart = new Chart(ctx, {
						    // The type of chart we want to create
						    type: 'pie',

						    // The data for our dataset
						    data: {
						    	labels: ['우동', '칼국수', '마라탕', '만두전골', '설렁탕'],
						        datasets: [{
						            label: 'My First dataset',
						            backgroundColor: [
						            	'rgb(54, 129, 149)',								            	
						            	'rgb(65, 152, 175)',
						            	'rgb(75, 172, 198)',
						            	'rgb(145, 195, 213)',
						            	'rgb(187, 215, 227)'
						            	],
						            borderColor: 'white',
						            data: [28, 26, 21, 14, 11]
						        }]
						    },
						    options: {
						    	title: {
								      display: true,
								      
								      text: "",
								      fontColor: 'black'
								      
								    },
				            legend: {
				                labels: {
				                	fontColor: 'black',
				                	fontSize: 20
						           }
						       }
						    }
						});
					});

			$("#rainy").click(function() {
					$("#day").html("비 오는");
					var ctx = document.getElementById('myChart').getContext('2d');
					var chart = new Chart(ctx, {
					    // The type of chart we want to create
					    type: 'pie',

					    // The data for our dataset
					    data: {
					    	labels: ['파전', '수제비', '삼곁살', '라면', '부대찌개'],
					        datasets: [{
					            label: 'My First dataset',
					            backgroundColor: [
					            	'rgb(57, 96, 142)',								            	
					            	'rgb(69, 114, 167)',
					            	'rgb(79, 129, 189)',
					            	'rgb(147, 169, 207)',
					            	'rgb(188, 200, 223)'
					            	],
					            borderColor: 'white',
					            data: [30, 24, 22, 13, 11]
					        }]
					    },
		    	options: {
			    	title: {
					      display: true,
					      
					      text: "",
					      fontColor: 'black'
					      
					    },
			            legend: {
			                labels: {
			                	fontColor: 'black',
			                	fontSize: 20
			                }
			            }
					    }
					});
				});

			$("#snowy").click(function() {
					$("#day").html("눈 오는");
					var ctx = document.getElementById('myChart').getContext('2d');
					var chart = new Chart(ctx, {
					    // The type of chart we want to create
					    type: 'pie',

					    // The data for our dataset
					    data: {
					    	labels: ['어묵탕', '김치전', '떡볶이', '콩나물국밥', '짬뽕'],
					        datasets: [{
					            label: 'My First dataset',
					            backgroundColor:[
					            	'rgb(95, 73, 121)',								            	
					            	'rgb(113, 88, 143)',
					            	'rgb(128, 100, 162)',
					            	'rgb(182, 173, 194)',
					            	'rgb(200, 192, 212)'
					            	],
					            borderColor: 'white',
					            data: [26, 24, 20, 19, 11]
					           
					        }]
					    },								    
		    	options: {
			    	title: {
					      display: true,
					      
					      text: "",
					      fontColor: 'black'
					      
					    },
			            legend: {
			                labels: {
			                	fontColor: 'black',
			                	fontSize: 20
			                }
			            }
								    
								    	
					}
				});
			});
		});
	</script>
</body>
</html>