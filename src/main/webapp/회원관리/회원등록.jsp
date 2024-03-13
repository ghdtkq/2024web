<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
<style>
body {
	background-color: whitesmoke;
	margin: 0;
	padding: 0;
}

.wrap {
	width: 500px;
	margin: 50px auto;
	background-color: white;
	border: 1px solid whitesmoke;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.line {
	margin-bottom: 10px;
	text-align: center;
	margin: 3%;
}

.line1, .line5 {
	text-align: center;
}

input[type="text"] {
	width: 80%;
	padding: 10px;
	border: 1px solid silver;
	font-size: 15px;
}

#in1 {
	width: 55%;
}

button {
	width: 70px;
	height: 40px;
	background-color: #333;
	color: white;
	cursor: pointer;
	border-radius: 5px;
	text-align: center;
}

button:hover {
	background-color: #555;
}
</style>
<script>
	function check() {
		let frm = document.frm;
		let mGender = frm.mGender;
		let flag = false;

		for (let i = 0; i < mGender.length; i++) {
			if (mGender[i].checked) {
				flag = true;
				break;
			}
		}
		if (!flag) {
			alert("성별을 선택해 주세요");
			return false;
		} else {
			frm.submit();
		}
	}
</script>
</head>
<body>

	<form name="frm" action="regAction.jsp" method="post"
		onsubmit="return check()">
		<div class="wrap">
			<div class="line1">
				<h2>회원등록</h2>
			</div>

			<div class="line">
				<input type="text" name="mId" placeholder="아이디 (전화번호 뒷자리)" id="in1">
				<label><input type="radio" value='남성' name="mGender">남성</label>
				<label><input type="radio" value='여성' name="mGender">여성</label>
			</div>

			<div class="line">
				<input type="text" name="mName" placeholder="이름">
			</div>

			<div class="line">
				<input type="text" name="mAge" placeholder="나이">
			</div>

			<div class="line">
				<input type="text" name="mTel" placeholder="전화번호 (010-ㅁㅁㅁㅁ-ㅁㅁㅁㅁ)">
			</div>

			<div class="line5">
				<button>등록</button>
				<button>취소</button>
			</div>
		</div>
	</form>

</body>
</html>