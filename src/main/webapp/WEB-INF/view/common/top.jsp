<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/goodMind.css" rel="stylesheet">
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>

    <div>
        <nav>
            <div class="container-fluid" id="airLogo"> 
            <img src="/img/logo.svg" alt="Logo" style="height:60px;" class="rounded-3 mx-2">
            </div>
            <div class="navbar-text me-3" id="projectName" >기분일기
            </div>
            <div class="navbar-text me-3" id="welcome">${uname}님 환영합니다.
            </div>
        </nav>
    </div>    
    <div>
        <script>
            $(document).ready(function() {
                $('#weather').click(getWeatherInfo);
                $('#addrChange').click(function(e) {
                    $('#addrInputDisp').attr({'class': 'mt-2'});
                });
                $('#addrSubmit').click(function(e) {
                    $('#addrInputDisp').attr({'class': 'mt-2 d-none'});
                    let addrInputVal = $('#addrInput').val();
                    $.ajax({
                        type: 'GET',
                        url: '/top/address',
                        data: {addr: addrInputVal},
                        success: function(e) {
                            console.log('address:', addrInputVal);
                            $('#addr').html(addrInputVal);
                        }
                    });
                });
            });
            function getWeatherInfo() {
                $.ajax({
                    type: 'GET',
                    url: '/top/weather',
                    data: {'addr': $('#addr').text()},
                    success: function(result) {
                        console.log('success');
                        $('#weatherInfo').html(result);
                    },
                });
            }
        </script>
    </div>