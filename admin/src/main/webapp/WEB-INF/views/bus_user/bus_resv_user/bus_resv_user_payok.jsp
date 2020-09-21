<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 

<!-- 결제 api -->
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script> 
<script>
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
            amount: ${price-use_point},
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
            
                msg += '결제 금액 : ' + rsp.paid_amount;
                document.location.href="bus_user_resv_paytable.do?one_date=${one_date}&road_no=${road_no}&use_point=${use_point}&save_point=${save_point}&price=${price}&result_seat=${result_seat}";  
           
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                document.location.href="bus_main.do";  
            }
            alert(msg);
            //alert창 확인 후 이동할 url 설정
        });
    });
</script>
