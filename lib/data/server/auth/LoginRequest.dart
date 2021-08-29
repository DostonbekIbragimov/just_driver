class LoginRequest {
  String phone;

  LoginRequest({required this.phone});

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(phone: json['phone']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    return data;
  }
}
