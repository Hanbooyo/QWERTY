$(function(){

  var textarea = document.getElementById("messageWindow");
  var webSocket = new WebSocket('ws://localhost:8090//WorldCup/broadcasting');
  var inputMessage = document.getElementById('inputMessage');
  webSocket.onerror = function (event) {
    onError(event)
  };
  webSocket.onopen = function (event) {
    onOpen(event)
  };
  webSocket.onmessage = function (event) {
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
  //채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
  window.setInterval(function () {
    var elem = document.getElementById('messageWindow');
    elem.scrollTop = elem.scrollHeight;
  }, 0);
});
