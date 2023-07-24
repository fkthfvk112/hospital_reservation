<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 비밀번호 찾기 양식 -->
<div class="div">
    <form action="" id="findPasswordForm" method="post">
        <table>
            <tr class="centerTr">
                <th>이름</th>
                <td><input type="text" size="20" id="name" name="name" class="text" required></td>
            </tr>
            <tr class="centerTr">
                <th>아이디</th>
                <td><input type="text" size="20" id="id" name="id" class="text" required></td>
            </tr>
            <tr class="centerTr">
                <th>이메일</th>
                <td><input type="text" size="20" id="email" name="email" class="text" required></td>
            </tr>
            <tr class="centerTr">
                <td colspan="2">
                    <input type="button" value="비밀번호 찾기" class="findPasswordBtn" onclick="sendVerificationCode()">
                </td>
            </tr>
        </table>
    </form>
</div>

<!-- 인증번호 입력 양식 -->
<div class="div" id="verificationDiv" style="display: none;">
    <form action="" id="verificationForm" method="post">
        <table>
            <tr class="centerTr">
                <th>인증번호</th>
                <td><input type="text" size="20" id="verificationCode" name="verificationCode" class="text" required></td>
            </tr>
            <tr class="centerTr">
                <td colspan="2">
                    <input type="button" value="인증 완료" class="findPasswordBtn" onclick="verifyCodeAndRedirect()">
                </td>
            </tr>
        </table>
    </form>
</div>

<script>
function sendVerificationCode() {
    const name = $("#name").val().trim();
    const id = $("#id").val().trim();
    const email = $("#email").val().trim();

    $.ajax({
        url: "sendVerificationCode.do",
        type: "post",
        data: { "name": name, "id": id, "email": email },
        success: function (response) {
            if (response === "SUCCESS") {
                // 인증번호를 보낸 후 인증번호 입력 양식을 보여줍니다.
                $("#findPasswordForm").hide();
                $("#verificationDiv").show();
            } else {
                alert("입력한 정보와 일치하는 계정을 찾을 수 없습니다.");
            }
        },
        error: function () {
            alert("서버와 통신 중 오류가 발생했습니다.");
        }
    });
}


</script>

</body>
</html>