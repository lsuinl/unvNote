class ResponseModel {
  final int statusCode;
  final List<dynamic> message;
  final String error;

  ResponseModel({
    required this.statusCode,
    required this.message,
    required this.error,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      statusCode: json["statusCode"],
      message: json["message"],
      error: json["error"]
    );
  }
}