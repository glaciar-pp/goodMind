$(function(){
    // 웰컴메시지를 받기 위해 message 입력 받기 전 빈 값으로 서버에 전송해서 웰컴메세지 받음
    callAjax();
    // 질문하고 응답 받기(텍스트)
    $('#chatForm').on('submit', function(event){
        event.preventDefault();
        if($('#message').val() == "") { // 질문을 입력하지 않고 전송 버튼 누를 때 웰컴 메세지 뜨지 않게
            alert("질문을 입력하세요");
            return false;
        }
        if($('#message').val() != ""){
            $('#chatBox').append('<div class="msgBox send"><span id="in"><span>' +
                $('#message').val() + '</span></span></div><br>');
        }
        callAjax();
        /* 입력란 비우기*/
        $('#message').val('');
    }); // submit 끝
     // 별도의 ajax 생성
    function callAjax() {
        $.ajax({
            url:"/goodM/chat/gibuni",
            type:"post",
            dataType :'json',
            data:{message: $('#message').val()},
 success:function (result){
                //JSON 형식 그대로 반환 받음
                var bubbles = result.bubbles;
                for(var b in bubbles){
                    if(bubbles[b].type == 'text'){ // 기본 답변인 경우
                        /* chatBox에 받은 메시지 추가 */
                        $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>기부니</span><br><span>' +
                            bubbles[b].data.description +'</span></span></div><br><br>');
                    }    else if(bubbles[b].type == 'template'){//이미지 답변 또는 멀티링크 답변 시작
                            if(bubbles[b].data.cover.type=="text"){//멀티링크 답변이면
                                console.log(bubbles[b].type)
                                console.log(bubbles[b].data.cover.type)
                            $("#chatBox").append("<div class='msgBox receive'><span id='in'><span>기부니</span><br><span>" + bubbles[b].data.cover.data.description+ "</p>");
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
                                $("#chatBox").append("<div class='msgBox receive'><span id='in'><span>기부니</span><br><span><img src=" + bubbles[b].data.cover.data.imageUrl +
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
                    }//bubbles for문 종료
                    // 스크롤해서 올리기
                    $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));
                }//function문 종료
            , error:function(){
                alert("오류가 발생했습니다.");
            }
        })
    }
});
//let {data:a.default.shape({cover:a.default.shape({type:a.default.string,title:a.default.string,data:a.default.object}),contentTable:a.default.arrayOf(a.default.arrayOf(a.default.shape({rowSpan:a.default.number,colSpan:a.default.number,data:a.default.shape({type:a.default.string,title:a.default.string,data:a.default.shape({type:a.default.string,action:a.default.shape({type:a.default.string,data:a.default.shape({url:a.default.string})})})})})))
