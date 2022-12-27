<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<script src="${contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<html lang="ko">

<head>
	<title>Game Warrior Template</title>
	<meta charset="UTF-8">

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">

	<link rel="stylesheet" href="${contextPath}/resources/css/sports.css"/>


</head>
<body>
	<!-- Page section -->
	<section class="page-section single-blog-page spad">
		<div class="container">
			<div class="row">
				<div class="flex_left">
                    <div class="fixture_section">
                        <div class="fixture_sticky_area">
                            <div class="match_list">
                                <div class="match_view_port">
                                    <ul class="list_ul">
                                    <c:forEach var="todayList" items="${todayList}">
                                        <li role="presentation" class="match_list_item" style="top : 0;">
                                            <a class="match_link" href="${contextPath}/match/matchInfo.do?matchnum=${todayList.matchnum}">
                                                <em class="match_status">경기종료</em>
                                                <p class="match_list_team">
                                                    <span class="match_flag"><img src="${contextPath}/resources/img/country/${todayList.home}.png" alt="logo" width="30" height="30"></span>
                                                    <span class="match_team">${todayList.home}</span>
                                                    <span class="match_score"></span>
                                                </p>
                                                <p class="match_list_team">
                                                    <span class="match_flag"><img src="${contextPath}/resources/img/country/${todayList.away}.png" alt="logo" width="30" height="30"></span>
                                                    <span class="match_team">${todayList.away}</span>
                                                    <span class="match_score"></span>
                                                </p>
                                            </a>
                                        </li> 
                                    </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<div class="flex_center">
					<div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">경기 정보</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">프리뷰</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">실시간 경기 정보</a>
                                </li>
                         		<li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">경기 영상</a>
                                </li>
                            </ul>
                            
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <div class="comments-area">
				                        <div class="game_contents">
				                            <div role="tabpanel" class="line_up_tap">
				                                <div class="lineUp_comp">
				                                    <div class="home_area">
				                                        <span class="line_logo">
				                                            <img src="${contextPath}/resources/img/country/${home}.png" alt="logo" width="30" height="30">
				                                        </span>
				                                        <span class="team_name">${home}</span>
				                                        <span class="team_formation">${homeInfo.formation}</span>
				                                    </div>
				                                    <div class="away_area">
				                                        <span class="line_logo">
				                                            <img src="${contextPath}/resources/img/country/${away}.png" alt="logo" width="30" height="30">
				                                        </span>
				                                        <span class="team_name">${away}</span>
				                                        <span class="team_formation">${awayInfo.formation}</span>
				                                    </div>
				                                    <div class="formation_area">
				                                        <div class="center_circle"></div>
				                                        <div class="lineUp_home">
				                                            <i class="goal_box" aria-hidden="true">
				                                                <span class="lineUp_box">
				                                                    <span class="goal"></span>
				                                                </span>
				                                            </i> 				
				                            				<div class="lineUp_line">
				                                               	<c:forEach var="homeList" items="${homeList}" begin="0" end="0">
					                                                <div class="lineUp_player_wrap">
					                                                    <div class="lineUp_player">
					                                                        <span class="lineUp_number css-tooltip" data-tooltip="생년월일 : ${homeList.p_birth} &#xa;소속 팀 : ${homeList.p_team}" style="background-color: ${homeInfo.color};">${homeList.p_num}</span>
					                                                    </div>
					                                                    <span class="lineUp_name">${homeList.p_name}</span>
					                                                </div>
				                                                </c:forEach>
				                                            </div>
				                                            <div class="lineUp_line_four"> 
				                                               	<c:forEach var="homeList" items="${homeList}" begin="1" end="4" step="1">
					                                                <div class="lineUp_player_wrap">
					                                                    <div class="lineUp_player">
					                                                        <span class="lineUp_number css-tooltip" data-tooltip="생년월일 : ${homeList.p_birth} &#xa;소속 팀 : ${homeList.p_team}" style="background-color: ${homeInfo.color};">${homeList.p_num}</span>
					                                                    </div>
					                                                    <span class="lineUp_name">${homeList.p_name}</span>
					                                                </div>
				                                                </c:forEach>
				                                            </div>
				                                            <div class="lineUp_line">
				                                               	<c:forEach var="homeList" items="${homeList}" begin="5" end="5">
					                                                <div class="lineUp_player_wrap">
					                                                    <div class="lineUp_player">
					                                                        <span class="lineUp_number css-tooltip" data-tooltip="생년월일 : ${homeList.p_birth} &#xa;소속 팀 : ${homeList.p_team}" style="background-color: ${homeInfo.color};">${homeList.p_num}</span>
					                                                    </div>
					                                                    <span class="lineUp_name">${homeList.p_name}</span>
					                                                </div>
				                                                </c:forEach>
				                                            </div>
				                                            <div class="lineUp_line_three">
				                                               	<c:forEach var="homeList" items="${homeList}" begin="6" end="8" step="1">
					                                                <div class="lineUp_player_wrap">
					                                                    <div class="lineUp_player">
					                                                        <span class="lineUp_number css-tooltip" data-tooltip="생년월일 : ${homeList.p_birth} &#xa;소속 팀 : ${homeList.p_team}" style="background-color: ${homeInfo.color};">${homeList.p_num}</span>
					                                                    </div>
					                                                    <span class="lineUp_name">${homeList.p_name}</span>
					                                                </div>
				                                                </c:forEach>
				                                            </div>
				                                            <div class="lineUp_line_two">
				                                               	<c:forEach var="homeList" items="${homeList}" begin="9" end="10" step="1">
					                                                <div class="lineUp_player_wrap">
					                                                    <div class="lineUp_player">
					                                                        <span class="lineUp_number css-tooltip" data-tooltip="생년월일 : ${homeList.p_birth} &#xa;소속 팀 : ${homeList.p_team}" style="background-color: ${homeInfo.color};">${homeList.p_num}</span>
					                                                    </div>
					                                                    <span class="lineUp_name">${homeList.p_name}</span>
					                                                </div>
				                                                </c:forEach>
				                                            </div>
				                                        </div>
				                                        <div class="lineUp_away">
				                                            <i class="goal_box" aria-hidden="true">
				                                                <span class="lineUp_box">
				                                                    <span class="goal"></span>
				                                                </span>
				                                            </i>
				                                            <div class="lineUp_line_two">
				                                               	<c:forEach var="awayList" items="${awayList}" begin="9" end="10" step="1">
					                                                <div class="lineUp_player_wrap">
					                                                    <div class="lineUp_player">
					                                                        <span class="lineUp_number css-tooltip" data-tooltip="생년월일 : ${awayList.p_birth} &#xa;소속 팀 : ${awayList.p_team}" style="background-color: ${awayInfo.color};">${awayList.p_num}</span>
					                                                    </div>
					                                                    <span class="lineUp_name">${awayList.p_name}</span>
					                                                </div>
				                                                </c:forEach>
				                                            </div>
				                                            <div class="lineUp_line_three">
				                                               	<c:forEach var="awayList" items="${awayList}" begin="5" end="8" step="1">
					                                                <div class="lineUp_player_wrap">
					                                                    <div class="lineUp_player">
					                                                        <span class="lineUp_number css-tooltip" data-tooltip="생년월일 : ${awayList.p_birth} &#xa;소속 팀 : ${awayList.p_team}" style="background-color: ${awayInfo.color};">${awayList.p_num}</span>
					                                                    </div>
					                                                    <span class="lineUp_name">${awayList.p_name}</span>
					                                                </div>
				                                                </c:forEach>
				                                            </div>
				                                            <div class="lineUp_line_four">
				                                               	<c:forEach var="awayList" items="${awayList}" begin="1" end="4" step="1">
					                                                <div class="lineUp_player_wrap">
					                                                    <div class="lineUp_player">
					                                                        <span class="lineUp_number css-tooltip" data-tooltip="생년월일 : ${awayList.p_birth} &#xa;소속 팀 : ${awayList.p_team}" style="background-color: ${awayInfo.color};">${awayList.p_num}</span>
					                                                    </div>
					                                                    <span class="lineUp_name">${awayList.p_name}</span>
					                                                </div>
				                                                </c:forEach>
				                                            </div>
				                                            <div class="lineUp_line">
				                                               	<c:forEach var="awayList" items="${awayList}" begin="0" end="0">
					                                                <div class="lineUp_player_wrap">
					                                                    <div class="lineUp_player">
					                                                        <span class="lineUp_number css-tooltip" data-tooltip="생년월일 : ${awayList.p_birth} &#xa;소속 팀 : ${awayList.p_team}" style="background-color: ${awayInfo.color};">${awayList.p_num}</span>
					                                                    </div>
					                                                    <span class="lineUp_name">${awayList.p_name}</span>
					                                                </div>
				                                                </c:forEach>
				                                            </div>
				                                        </div>
				                                        <div class="center_line"></div>
				                                    </div><!--faomation-->
				                                </div>
				                                <div class="subtitute_lineUp">
				                                    <div class="subtitute_table_area">
				                                        <div class="table_line"></div>
				                                        <table class="subtitute_table">
				                                            <thead>
				                                                <th scope="col">
				                                                    <div class="team_title">
				                                                        <span class="team_logo"><img src="${contextPath}/resources/img/country/${home}.png" alt="국기" width="30" height="30"></span>
				                                                        <span class="team_text">${home} 후보선수</span>
				                                                    </div>
				                                                </th>
				                                                <th scope="col">
				                                                    <div class="team_title">
				                                                        <span class="team_logo"><img src="${contextPath}/resources/img/country/${away}.png" alt="국기" width="30" height="30"></span>
				                                                        <span class="team_text">${away} 후보선수</span>
				                                                    </div>
				                                                </th>
				                                            </thead>
				                                            <tbody>
															<c:forEach var="homeList" items="${homeList}" varStatus="status" begin="11" end="22" step="1">
				                                                	<tr>
					                                                   <td>
					                                                        <div class="subtitute_player_item">
					                                                            <div class="subtitute_player_info">
					                                                                <span class="subtitute_player_name">${homeList.p_name}</span>
					                                                            </div>
				                                                             	<div class="subtitution">
					                                                                <span class="subtitution_logo"></span>
					                                                                <span class="subtitution_name"></span>
					                                                                <span class="subtitution_time"></span>
				                                                            	</div>
					                                                        </div>
					                                                    </td>
				
				
					                                                    <td>
					                                                        <div class="subtitute_player_item">
					                                                            <div class="subtitute_player_info">
					                                                                <span class="subtitute_player_name">${awayList[status.index].p_name}</span>
					                                                            </div>
																				<div class="subtitution">
					                                                                <span class="subtitution_logo"></span>
					                                                                <span class="subtitution_name"></span>
					                                                                <span class="subtitution_time"></span>
				                                                            	</div>
					                                                        </div>
					                                                    </td>   
				                                                	</tr>                       
				       	                               			 </c:forEach>               
				                                            </tbody>
				                                        </table>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
                                </div>

                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                     <div class="preview_container">
								        <h4>양팀 프리뷰</h4>
								        <div class="preview_intro">
								            <div class="preview_matchbox">
								                <div class="match_vs"><strong>VS</strong></div>
								                <div class="match_left">
								                    <div class="flag_div"><img class="preview_flag" src="${contextPath}/resources/img/country/${home}.png" alt="flag"></div>
								                    <span class="flag_name">${home}</span>
								                </div>
								                <div class="match_right">
								                    <div class="flag_div"><img class="preview_flag" src="${contextPath}/resources/img/country/${away}.png" alt="flag"></div>
								                    <span class="flag_name">${away}</span>
								                </div>
								            </div>
								        </div>
								        <div class="preview_detail">
								            <table class="info_table">
								                <colgroup>
								                    <col class="col1">
								                    <col class="col2">
								                    <col class="col3">
								                </colgroup>
								                <thead></thead>
								                <tbody>
								                	<tr>
								                        <td>${homeInfo.rank} 위</td>
								                        <th scope="row"><span>피파랭킹</span></th>
								                        <td>${awayInfo.rank} 위</td>
								                    </tr>
								                    <tr>
								                        <td>${homeInfo.coach}</td>
								                        <th scope="row"><span>감독</span></th>
								                        <td>${awayInfo.coach}</td>
								                    </tr>
								                    <tr>
								                        <td>${homeInfo.captain}</td>
								                        <th scope="row"><span>주장</span></th>
								                        <td>${awayInfo.captain}</td>
								                    </tr>
								                    <tr>
								                        <td>${homeInfo.formation}</td>
								                        <th scope="row"><span>주 포메이션</span></th>
								                        <td>${awayInfo.formation}</td>
								                    </tr>
								                    <tr>
								                        <td>속공-역습</td>
								                        <th scope="row"><span>팀 스타일</span></th>
								                        <td>점유율-역습</td>
								                    </tr>
								                    <tr>
								                        <td>12.3/1</td>
								                        <th scope="row"><span>숏패스/롱볼</span></th>
								                        <td>15.2/1</td>
								                    </tr>
								                    <tr>
								                        <td>187.4 cm</td>
								                        <th scope="row"><span>평균신장</span></th>
								                        <td>183.6 cm</td>
								                    </tr>
								                    <tr>
								                        <td>25.2 세</td>
								                        <th scope="row"><span>평균연령</span></th>
								                        <td>27.6 세</td>
								                    </tr>
								                </tbody>
								            </table>
								        </div>
								    </div>
                                </div>
                                <div class="tab-pane" id="tabs-3" role="tabpanel">
                                   <iframe src="https://www.scorebat.com/embed/league/fifa-world-cup/" frameborder="0" width="600" height="760" allowfullscreen allow='autoplay; fullscreen' style="width:100%;height:760px;overflow:hidden;display:block;" class="_scorebatEmbeddedPlayer_"></iframe><script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = 'https://www.scorebat.com/embed/embed.js?v=arrv'; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'scorebat-jssdk'));</script>
                                </div>
                                <div class="tab-pane" id="tabs-4" role="tabpanel">
                                	<iframe src="https://www.scorebat.com/embed/" frameborder="0" width="600" height="760" allowfullscreen allow='autoplay; fullscreen' style="width:100%;height:760px;overflow:hidden;display:block;" class="_scorebatEmbeddedPlayer_"></iframe><script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = 'https://www.scorebat.com/embed/embed.js?v=arrv'; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'scorebat-jssdk'));</script>
                                </div>
                            </div>
                        </div>
					
				</div>
				<!	-- sidebar -->
				<div class="flex_right">
					<!-- widget -->
					<div class="widget-item">
						<div class="cheer_area">
							<div class="cheer_box">
								<div class="cheer_vote">
									<div class="vote_home">
										<div class="vote_home_cover">
											<div class="cover_line"></div>
											<img class="cover_flag" src="${contextPath}/resources/img/country/${home}.png" alt="flag" width="50" height="50">
											<div class="vote_message">
												<div class="count_home">100</div>
											</div>
										</div>
									</div>
									<div class="vote_away">
										<div class="vote_away_cover">
											<div class="end">종료</div>
											<div class="cover_line"></div>
											<img class="cover_flag" src="${contextPath}/resources/img/country/${away}.png" alt="flag" width="50" height="50">
											<div class="vote_message">
												<div class="count_away">100</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div><!-- 투표 존 -->
					</div>
					<!-- widget -->
					<div class="widget-item">
						<h4 class="widget_title"></h4>
                        <c:if test="${(login.id ne '') and !(empty login.id)}">
       						<input type="hidden" value='${login.id }' id='chat_id' />
   						</c:if>
					    <c:if test="${(login.id eq '') or (empty login.id)}">
					        <input type="hidden" value='<%=session.getId().substring(0, 6)%>'
					            id='chat_id' />
					    </c:if>
					    <div id="_chatbox" style="display: block">
					        <fieldset>
					            <div id="messageWindow"></div>
					        </fieldset>
    					     <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
					         <input type="submit" value="send" onclick="send()" />
					    </div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Page section end -->

<script type="text/javascript">
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://localhost:8090//WorldCup/broadcasting');
    var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
        onError(event)
    };
    webSocket.onopen = function(event) {
        onOpen(event)
    };
    webSocket.onmessage = function(event) {
        onMessage(event)
    };
    function onMessage(event) {
        var message = event.data.split("|");
        var sender = message[0];
        var content = message[1];
        if (content == "") {
            
        } else {
            if (content.match("/")) {
                if (content.match(("/" + $("#chat_id").val()))) {
                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                    if (temp[1].trim() == "") {
                    } else {
                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
                    }
                } else {
                }
            } else {
                if (content.match("!")) {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'><b class='impress'>" + sender + " : " + content + "</b></p>");
                } else {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
                }
            }
        }
    }
    function onOpen(event) {
        $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다.</p>");
    }
    function onError(event) {
        alert(event.data);
    }
    function send() {
        if (inputMessage.value == "") {
        	
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
        }
        webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
        inputMessage.value = "";
    }
    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send();
        }
    }
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
    
</script>


	<!--====== Javascripts & Jquery ======-->
	<script src="${contextPath}/resources/js/vote.js"></script>
    </body>
</html>