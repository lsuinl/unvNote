//규격확인함수

//이메일체크
bool CheckEmail(String email){
  return RegExp(
      r"^[0-9a-zA-Z-_]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i")
      .hasMatch(email);
}

//인증번호체크
bool CheckNumber(){
  return true;
}
//비밀번호체크
bool CheckPassword(String password){
  return true;
}
//학과체크
bool CheckMajor(String major){

  return true;
}
//이름체크
bool CheckName(String name){

  return true;
}
//졸업-입학학년체크
bool CheckExpectedGraduationDate(){

  return true;
}