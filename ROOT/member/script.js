function inputCheck(){
	if(document.regFrm.id.value==""){
		alert("ID를 입력하지 않았습니다.");
		document.regFrm.id.focus();
		return;
	}
	if(document.regFrm.pass.value==""){
		alert("비밀번호를 입력하지 않았습니다.");
		document.regFrm.pass.focus();
		return;
	}
	if(document.regFrm.repass.value==""){
		alert("비밀번호 재확인을 입력하지 않았습니다.");
		document.regFrm.repass.focus();
		return;
	}
	if(document.regFrm.pass.value != document.regFrm.repass.value){
		alert("입력한 비밀번호와 비밀번호 재확인이 일치하지 않습니다.");
		document.regFrm.repass.value="";
		document.regFrm.repass.focus();
		return;
	}
	
	document.regFrm.submit();
}

function win_close(){
	self.close();
}
