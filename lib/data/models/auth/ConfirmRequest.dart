class ConfirmRequest {
  String phone;
  String code;

  ConfirmRequest({required this.phone, required this.code});

  factory ConfirmRequest.fromJson(Map<String, dynamic> json) {
    return ConfirmRequest(phone: json['phone'], code: json['code']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['code'] = this.code;
    return data;
  }
}
