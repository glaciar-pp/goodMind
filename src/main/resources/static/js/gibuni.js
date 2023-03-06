$(function(){
    // check if welcome message has been received before
    if (getCookie("welcome_message_received")) {
       
        $("#chatBox").show();
    } else {
        // 웰컴메시지를 받기 위해 message 입력 받기 전 빈 값으로 서버에 전송해서 웰컴메세지 받음
        callAjax();
    }

    // 질문하고 응답 받기(텍스트)
    $('#chatForm').on('submit', function(event){
        event.preventDefault();
        if($('#message').val() == "") {
            alert("질문을 입력하세요");
            return false;
        }
        if($('#message').val() != ""){
            $('#chatBox').append("<div class='msgBox send'><span id='in'><span>" +
                $('#message').val() + "</span></span></div><br>");
        }
        callAjax();
        $('#message').val('');
    });
     // ajax function
    function callAjax() {
        $.ajax({
            url:"/goodM/chat/gibuni",
            type:"post",
            dataType :'json',
            data:{message: $('#message').val()},
            success:function (result){
                // set cookie to indicate that welcome message has been received
                setCookie("welcome_message_received", "true", 1);
                //JSON 형식 그대로 반환 받음
                var bubbles = result.bubbles;
                for(var b in bubbles){
                    if(bubbles[b].type == 'text'){ // 기본 답변인 경우
                        /* chatBox에 받은 메시지 추가 */
                        $('#chatBox').append("<div class='msgBox receive'><span id='in'><img src='/img/gibuni.png' alt='기부니 아이콘' id='gibuni'><br><span>" +
                            bubbles[b].data.description +"</span></span></div><br><br>");
                    }    else if(bubbles[b].type == "template"){//이미지 답변 또는 멀티링크 답변 시작
                            if(bubbles[b].data.cover.type=="text"){//멀티링크 답변이면
                                console.log(bubbles[b].type)
                                console.log(bubbles[b].data.cover.type)
                            $("#chatBox").append("<div class='msgBox receive'><span id='in'><img src='/img/gibuni.png' alt='기부니 아이콘' id='gibuni'><br><span>" + bubbles[b].data.cover.data.description+ "</p>");
    }                       for(var ct in bubbles[b].data.contentTable){
                            console.log(bubbles[b].contentTable)
                            var ct_data = bubbles[b].data.contentTable[ct];
                            console.log(ct_data)
                            for(var ct_d in ct_data){
                                $("#chatBox").append
                                ("<a href='"+ct_data[ct_d].data.data.action.data.url+"' target='_blank'>" +
                                ct_data[ct_d].data.data.action.data.url+ "</a><br>");
                            }
                        }
                    }else if (bubbles[b].type == 'carousel') {
                        console.log(bubbles[b].type)
                        console.log(bubbles[b].type.data)
                        console.log(bubbles[b].data.cover.type)
                        if(bubbles[b].type.data =="image"){//이미지 이면
                            console.log(bubbles[b].type.data)
                                $("#chatBox").append("<div class='msgBox receive'><span id='in'><img src='/img/gibuni.png' alt='기부니 아이콘' id='gibuni'><br><span><img src=" + bubbles[b].data.cover.data.imageUrl +
                                    "' alt='이미지 없음'></p>");
                                //$("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl + "' alt='이미지 없음'></p>");
                                if(bubbles[b].data.contentTable != null){
                                    for(var ct in bubbles[b].data.contentTable){
                                        var ct_data = bubbles[b].data.contentTable[ct];
                                        console.log(ct_data)
                                        for(var ct_d in ct_data){
                                            $("#chatBox").append
                                            ("<a href='"+ct_data[ct_d].data.data.action.data.url+"' target='_blank'>" +
                                            ct_data[ct_d].data.data.action.data.url+ "</a><br>");
                                        }
                                    }
                                } else {
                                    $("#chatBox").append("<div class='msgBox receive'><span id='in'><span>챗봇2, 이미지</span><br><span>" + bubbles[b].data.cover.data.description+ "</p>");
                                }
                            }
                        }
                    }
                // 스크롤해서 올리기
                $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
                // show chat box after receiving welcome message
                $("#chatBox").show();
            },
            error:function(){
                alert("오류가 발생했습니다.");
            }
        });
    }

    // helper functions to set and get cookies
    function setCookie(name, value, days) {
        var expires = "";
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toUTCString();
        }
        document.cookie = name + "=" + (value || "")  + expires + "; path=/";
    }

    function getCookie(name) {
        var nameEQ = name + "=";
        var ca = document.cookie.split(';');
        for(var i=0;i < ca.length;i++) {
            var c = ca[i];
            while (c.charAt(0)==' ') c = c.substring(1,c.length);
            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
        }
        return null;
    }
});