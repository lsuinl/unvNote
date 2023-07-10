bool CheckEmail(String email){
  return RegExp(
      r"^[0-9a-zA-Z-_]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i")
      .hasMatch(email);
}

bool CheckNumber(){
  return true;
}
bool CheckPassword(){

  return true;
}
bool CheckMajor(){

  return true;
}
bool CheckName(){

  return true;
}
bool CheckExpectedGraduationDate(){

  return true;
}