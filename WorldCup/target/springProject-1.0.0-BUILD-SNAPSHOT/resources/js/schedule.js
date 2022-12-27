$(function(){
	let index = 0;
	$(".right_button").click(function(){
		//사용하고자 하는 함수
		fn_rbtn();
	});

    $(".left_button").click(function(){
		//사용하고자 하는 함수
		fn_lbtn();
	});
	
	$(".week_list li input").click(function(){
			let str = $(this)[0].value;
			let answer = str.replace(/[^0-9]/g, '');
			let listHtml ="";
			$.ajax({
				type: "get",
				url: "matchday.do?matchday=" + answer,
				dataType: "json",
				success: function(returnData) {
					let matchList = returnData.matchList;
					// 경기정보 
					matchList.forEach(match => {
						listHtml += '<div class="bx">'
						listHtml += '<div class="vs_center">'
						listHtml +=	'<span class="vs">vs</span></div>'
						listHtml += '<div class="vs_area" id="vs_left">'
						listHtml +=	'<div class="emblem"><img src="../resources/img/country/' + match.home + '.png" alt="' + match.home + '"></div>'
						listHtml +=	'<span class="team">' + match.home + '</span></div>'
						listHtml += '<div class="vs_area" id="vs_right">'
						listHtml +=	'<div class="emblem"><img src="../resources/img/country/' + match.away + '.png" alt="' + match.away + '"></div>'
						listHtml +=	'<span class="team">' + match.away + '</span></div><div class="vs_btn"><a href="matchInfo.do?matchnum=' + match.matchnum + '">전력비교</a></div></div>'			
					})
					if(matchList.length<4) {
						for(var i=4; i>matchList.length; i--) {
							listHtml += '<div class="bx">'
							listHtml +=	'<span class="empty">경기가 없습니다.</span></div>'							
						}
					}
					$(".d_list").html(listHtml);	
				},
				error: () => {
					alert("API 호출 에러")
				}
			});
		});
		
		
	function fn_rbtn(){
		if(index == 2) {
			$("#week_6").hide();
		}
		if(index >= 3) {
			index = 3;			
		}else {
			index++;
		}
		let day1 = ["DAY 1","DAY 7", "DAY 13", "DAY 19"];
		let day2 = ["DAY 2","DAY 8", "DAY 14", "DAY 20"];
		let day3 = ["DAY 3","DAY 9", "DAY 15", "DAY 21"];
		let day4 = ["DAY 4","DAY 10", "DAY 16", "DAY 22"];
		let day5 = ["DAY 5","DAY 11", "DAY 17", "DAY 23"];
		let day6 = ["DAY 6","DAY 12", "DAY 18", ""];
		
		document.getElementById("week_1").value = day1[index];
		document.getElementById("week_2").value = day2[index];
		document.getElementById("week_3").value = day3[index];
		document.getElementById("week_4").value = day4[index];
		document.getElementById("week_5").value = day5[index];
		document.getElementById("week_6").value = day6[index];
	}
	function fn_lbtn(){
		if(index == 3) {
			$("#week_6").show();
		}
		if(index > 0) {
			index--;
		} else if(index <= 0) {
			index = 0;
		}
		let day1 = ["DAY 1", "DAY 7", "DAY 13", "DAY 19"];
		let day2 = ["DAY 2", "DAY 8", "DAY 14", "DAY 20"];
		let day3 = ["DAY 3", "DAY 9", "DAY 15", "DAY 21"];
		let day4 = ["DAY 4", "DAY 10", "DAY 16", "DAY 22"];
		let day5 = ["DAY 5", "DAY 11", "DAY 17", "DAY 23"];
		let day6 = ["DAY 6", "DAY 12", "DAY 18", ""];
		document.getElementById("week_1").value = day1[index];
		document.getElementById("week_2").value = day2[index];
		document.getElementById("week_3").value = day3[index];
		document.getElementById("week_4").value = day4[index];
		document.getElementById("week_5").value = day5[index];
		document.getElementById("week_6").value = day6[index];
	}
});	
