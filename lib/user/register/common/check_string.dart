//규격확인함수

//이메일체크
bool CheckEmail(String email){
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

//인증번호체크
bool CheckNumber(String number) {
  try {
    int.parse(number);
    return true;
  } on FormatException {
    return false;
  }
}
//비밀번호체크
bool CheckPassword(String password){
  return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$').hasMatch(password);
}
//학과체크
bool CheckMajor(String major){
  return RegExp(r"^[가-힣a-zA-Z]{3,15}$").hasMatch(major);
}
//이름체크
bool CheckName(String name){
  return RegExp(r"^[가-힣a-zA-Z]{1,5}$").hasMatch(name);
}
//졸업-입학학년체크
bool CheckExpectedGraduationDate(){

  return true;
}