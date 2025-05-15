class LoginSuccessResponse {
  LoginSuccessResponse({
    required this.status,
    required this.success,
    required this.token,
    required this.data,
    required this.message,
  });

  final int status;
  final int success;
  final String token;
  final Data? data;
  final String message;

  factory LoginSuccessResponse.fromJson(Map<String, dynamic> json) {
    return LoginSuccessResponse(
      status: json["status"] ?? 0,
      success: json["success"] ?? 0,
      token: json["token"] ?? "",
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "token": token,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.userId,
    required this.name,
    required this.paymentStatus,
    required this.paymentExpired,
  });

  final int userId;
  final String name;
  final bool paymentStatus;
  final bool paymentExpired;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json["user_id"] ?? 0,
      name: json["name"] ?? "",
      paymentStatus: json["payment_status"] ?? false,
      paymentExpired: json["payment_expired"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "payment_status": paymentStatus,
    "payment_expired": paymentExpired,
  };
}
