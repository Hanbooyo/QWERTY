<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>경기 일정</title>
	<meta charset="UTF-8">
</head>

<body>
	<!-- Page info section -->
	<section class="page-info-section set-bg" data-setbg="${contextPath}/resources/img/page-top-bg/6.jpg">
		<div class="pi-content">
			<div class="container">
				<div class="row">
				</div>
			</div>
		</div>
	</section>
	<!-- Page info section -->
	<!-- Page section -->
	<section class="page-section review-page spad">
		<div class="container">
			<div class="schedule_week_area">
				<div class="schedule_week" id="_dateList">
					<ul class="week_list">
						<li>
							<input type="button" id="week_1" value="DAY 1"/>
							<input type="button" id="week_2" value="DAY 2"/>
							<input type="button" id="week_3" value="DAY 3"/>
							<input type="button" id="week_4" value="DAY 4"/>
							<input type="button" id="week_5" value="DAY 5"/>
							<input type="button" id="week_6" value="DAY 6"/>
						</li>						
					</ul>
					<div class="schedule_button">
						<img class="left_button" src="${contextPath}/resources/img/button/scrollZone_prev.png" alt="좌">
						<img class="right_button" src="${contextPath}/resources/img/button/scrollZone_next.png" alt="우">
					</div>
				</div>
				<div class="day_list">
					<div class="d_list">
						<c:forEach var="match" items="${matchList}">
							<div class="bx">
								<div class="vs_center">
									<span class="vs">vs</span>
								</div>
								<div class="vs_area" id="vs_left">
									<div class="emblem"><img class="flag" src="${contextPath}/resources/img/country/${match.home}.png" alt="${match.home}"></div>
									<span class="team">${match.home}</span>
								</div>
								<div class="vs_area" id="vs_right">
									<div class="emblem"><img class="flag" src="${contextPath}/resources/img/country/${match.away}.png" alt="${match.away}"></div>
									<span class="team">${match.away}</span>
								</div>
								<div class="vs_btn"><a href="${contextPath}/match/matchInfo.do?matchnum=${match.matchnum}">전력비교</a></div>
							</div>								
						</c:forEach>
						<c:if test="${matchList.size()<4}">
							<c:forEach begin="${matchList.size()}" end="3" step="1">
								<div class="bx">
									<span class="empty">경기가 없습니다.</span>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			<div class="schedule_month_area">
				<div class="schedule_month_table">
					<table>
						<thead>
							<tr>
								<th class="t_date">날짜</th>
								<th class="t_time">시간</th>
								<th class="t_place">장소</th>
								<th class="t_match">경기</th>
								<th class="t_detail">상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="schedule" items="${scheduleList}">
								<tr>
									<c:choose>
										<c:when test="${schedule.day<10}">
											<td>${schedule.month}.0${schedule.day}</td>
										</c:when>
										<c:otherwise>
											<td>${schedule.month}.${schedule.day}</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${schedule.hour<10}">
											<td>0${schedule.hour}:00</td>
										</c:when>
										<c:otherwise>
											<td>${schedule.hour}:00</td>
										</c:otherwise>
									</c:choose>
									<td class="place">${schedule.stadium}</td>
									<td>
										<div class="inner">
											<span class="team_left">
												<span class="emblem"><img src="${contextPath}/resources/img/country/${schedule.home}.png" alt="${schedule.home}"></span>
												<span class="name">${schedule.home}</span>
											</span>
											<span class="team_right">
												<span class="emblem"><img src="${contextPath}/resources/img/country/${schedule.away}.png" alt="${schedule.away}"></span>
												<span class="name">${schedule.away}</span>
											</span>
										</div>
									</td>
									<td><a href="${contextPath}/match/matchInfo.do?matchnum=${schedule.matchnum}">전력비교</a></td>
								</tr>							
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</section>
	<!-- Page section end -->

</body>

</html>