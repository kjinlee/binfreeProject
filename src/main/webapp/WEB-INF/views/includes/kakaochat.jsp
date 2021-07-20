<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<!-- PC 카카오톡 상담 버튼 -->
	<a href="javascript:void kakaoChatStart()"
		class="kakaoChatPc hidden-md hidden-sm hidden-xs"> 
		<img src="https://cdn.imweb.me/upload/S201612155852553de8738/636646a526ac3.png">
	</a>
	
	
<!-- 카카오톡 채널 스크립트 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
    Kakao.init('2a351a8d6b54e936968fb3673fae2a42'); // 사용할 앱의 JavaScript키를 입력해 주세요.
    function kakaoChatStart() {
        Kakao.Channel.chat({
            channelPublicId: '_Kwfxls' // 카카오톡 채널 홈 URL에 명시된 ID를 입력합니다.
        });
    }
</script>