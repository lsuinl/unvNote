class ResponseErrorModel {
  final int statusCode;
  final dynamic message;
  final String? error;

  ResponseErrorModel({
    required this.statusCode,
    required this.message,
    required this.error,
  });

  factory ResponseErrorModel.fromJson(Map<String, dynamic> json) {
    return ResponseErrorModel(
      statusCode: json["statusCode"],
      message: json["message"],
      error: json["error"]
    );
  }
}