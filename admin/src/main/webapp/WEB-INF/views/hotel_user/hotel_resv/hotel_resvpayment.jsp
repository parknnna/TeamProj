<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 결제 api  -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function successfail(){
	document.location.href='hotel_resv';
}
function success() {
	document.f.submit()
}
    $(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp23515175');
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);
        IMP.request_pay({
            pg: 'kakao',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '주문명 : 주문명 설정',
            amount: ${total},
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
            
                msg += '결제 금액 : ' + rsp.paid_amount + '\n확인 버튼을 누르면 결제 내역 확인 페이지로 이동합니다.';
                success();
           
            } else {
            	var msg = '결제에 실패하였습니다.\n검색 초기로 돌아갑니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                successfail();
            }
            
            alert(msg);
          	
        });
    });
</script>
<form name="f" action="hotel_paymentok">
	<input type="hidden" name="member_no" value="${member_no}"/>
	<input type="hidden" name="hotel_no" value="${hotel_no}"/>
	<input type="hidden" name="start_resv_date" value="${start_resv_date}"/>
	<input type="hidden" name="end_resv_date" value="${end_resv_date}"/>
	<input type="hidden" name="total" value="${total}"/>
	<input type="hidden" name="user_point" value="${user_point}"/>
	<input type="hidden" name="use_point" value="${use_point}"/>
	<input type="hidden" name="save_point" value="${save_point}"/>
	<input type="hidden" name="droom_no" value="${dr}"/>
	<input type="hidden" name="sroom_no" value="${sr}"/>
	<input type="hidden" name="froom_no" value="${fr}"/>
</form>
</body>
</html>