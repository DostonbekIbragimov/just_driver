class RegisterData {
  String id;
  String? number;
  String phone;
  String? phone_verified_at;
  String first_name;
  String last_name;
  String birth_date;
  String gender;
  String avatar_url;
  bool? license_verified;
  String role;
  String status;

  RegisterData(
      {required this.id,
      this.number,
      required this.phone,
      this.phone_verified_at,
      required this.first_name,
      required this.last_name,
      required this.birth_date,
      required this.gender,
      required this.avatar_url,
      this.license_verified,
      required this.role,
      required this.status});

  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      id: json['id'],
      number: json['number'],
      phone: json['phone'],
      phone_verified_at: json['phone_verified_at'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      birth_date: json['birth_date'],
      gender: json['gender'],
      avatar_url: json['avatar_url'],
      license_verified: json['license_verified'],
      role: json['role'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['phone'] = this.phone;
    data['phone_verified_at'] = this.phone_verified_at;
    data['first_name'] = this.first_name;
    data['last_name'] = this.last_name;
    data['birth_date'] = this.birth_date;
    data['gender'] = this.gender;
    data['avatar_url'] = this.avatar_url;
    data['license_verified'] = this.license_verified;
    data['role'] = this.role;
    data['status'] = this.status;
    return data;
  }
}
