class UserInformation {
  final String email;
  final String password;
  final String name;
  final String univ;
  final String department;
  final String admissionDate;
  final String expectedGraduationDate;
  final String accessToken;

  UserInformation({
    required this.email,
    required this.password,
    required this.name,
    required this.univ,
    required this.department,
    required this.admissionDate,
    required this.expectedGraduationDate,
    required this.accessToken
  });
}