class Exist {
  bool exist;

  Exist({required this.exist});

  factory Exist.fromJson(Map<String, dynamic> json) {
    return Exist(exist: json['exist']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['exist'] = this.exist;
    return data;
  }
}
