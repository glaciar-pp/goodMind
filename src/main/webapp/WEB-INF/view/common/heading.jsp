<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <title>기분어때? 심리건강 서비스</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="/css/bootstrap.min.css" rel="stylesheet">
	<link href="/css/goodMind.css" rel="stylesheet">
    <script src="/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>

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
    				url: '/aside/address',
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
                url: '/aside/weather',
                data: {'addr': $('#addr').text()},
                success: function(result) {
                    console.log('success');
                    $('#weatherInfo').html(result);
                },
    		});
    	}
    </script>
    	