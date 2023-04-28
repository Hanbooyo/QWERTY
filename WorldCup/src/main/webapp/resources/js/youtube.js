
let search;
$(function() {
    search='카타르 월드컵 경기';
    fnGetList();
    $('.btn_v').click(function() {
        $('.btn_v').css('color','#aeaeae');
        $(this).css('color','#000');
    });

});

function find(select) {
    search=select;

    fnGetList();
}

//유튜브 API 연동 및 검색 결과 영상/데이터 불러오기

function fnGetList(sGetToken){
    
    var $getval=search;
    // alert(search);

    $("#get_view").empty();
    $("#btn_page").empty();
    //https://developers.google.com/youtube/v3/docs/search/list
    //동영상 정렬 기준(viewCount : 조회수 높은 순으로)
    var order = "relevance";
    //최대 조회 갯수
    var maxResults = "8";
    //유튜브 api key
    var key = "AIzaSyDmXf2e9u6uTnGnjYw_LAHJGqojloU3voM";
    //유튜브 api를 활용해 위의 변수들을 담은 영상 데이터 출력 변수 생성(체널에 대한 EndPoint 설정)
    var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order="+order
            + "&q="+ encodeURIComponent($getval) +"&key="+key+"&maxResults="+maxResults+"&videoEmbeddable = true" + "&videoSyndicated = true" ;

    console.log(sGetToken);

    if(sGetToken != null){
        sTargetUrl += "&pageToken="+sGetToken+"";
    }

    console.log(sTargetUrl);
    $.ajax({
        type: "POST",
        url: sTargetUrl,
        dataType: "jsonp",
        success: function(jdata) {
            console.log(jdata);
            $(jdata.items).each(function(i){
                //console.log(this.snippet.channelId);
                let src_youtube = this.id.videoId;
                $('#get_view').append(
                    '<div class="review-item"><div class="review-title"><h6 align="center">'+ this.snippet.title + '</h6></div>'
                    + '<div class="review-cover set-bg">'
                    + '<iframe width="500" height="300" src="https://www.youtube.com/embed/'+this.id.videoId+'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
                    + '</div><div class="review-text"><p>' + this.snippet.description + '</p></div></div>');
            }).promise().done(function(){
                if(jdata.prevPageToken){
                    $("#btn_page").append('<a  class="site-btn btn-sm" href="javascript:fnGetList(\''+jdata.prevPageToken+'\');"><이전페이지></a>');
                }
                if(jdata.nextPageToken){
                    $("#btn_page").append('<a  class="site-btn btn-sm" href="javascript:fnGetList(\''+jdata.nextPageToken+'\');"><다음페이지></a>');
                }
            });
        },
        error:function(xhr, textStatus) {
            console.log(xhr.responseText);
            alert("에러");
            return;
        }
    });
}
