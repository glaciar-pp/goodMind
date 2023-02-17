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
                        $('#chatBox').append('<div class="msgBox receive"><span id="in"><span>챗봇1</span><br><span>' +
                            bubbles[b].data.description +'</span></span></div><br><br>');
                    }    else if(bubbles[b].type == 'template'){//이미지 답변 또는 멀티링크 답변 시작
                        if(bubbles[b].data.cover.type=="image"){//이미지 이면
                            $("#chatBox").append("<img src='" + bubbles[b].data.cover.data.imageUrl +
                                "' alt='이미지 없음'>");
                            if(bubbles[b].data.contentTable == null){
                                $("#chatBox").append
                                ("<a href='"+bubbles[b].data.cover.data.action.data.url+"' target='_blank'>" +
                                    bubbles[b].data.cover.data.action.data.url+ "</a><br>");
                            } else {
                                $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>챗봇2</span><br><span>" + bubbles[b].data.cover.data.description+ "</p>");
                             
                            }
                        }     else if(bubbles[b].data.cover.type=="text"){//멀티링크 답변이면
                            $("#chatBox").append("<div class=\"msgBox receive\"><span id=\"in\"><span>챗봇3</span><br><span>" + bubbles[b].data.cover.data.description+ "</p>");
                        }
                        // 이미지 / 멀티링크 답변 공통 (contentTable 포함)
                        for(var ct in bubbles[b].data.contentTable){
							console.log(ct)
                            var ct_data = bubbles[ct].data.contentTable[ct];
                            console.log(ct_data)
                            for(var ct_d in ct_data){
                                $("#chatBox").append
                                 ("<a href='"+ct_data[ct_d].data.data.action.data.url+"' target='_blank'>" +
                                    ct_data[ct_d].data.data.action.data.url+ "</a><br>");
                            }
                        }// contentTable for문 끝
                    }//template 끝
                }//bubbles for문 종료

                // 스크롤해서 올리기
                $("#chatBox").scrollTop($("#chatBox").prop("scrollHeight"));

            },
            error:function(){
                alert("오류가 발생했습니다.");
            }
        });
    }

});