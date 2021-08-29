class Errors {
  String field;
  String message;

  Errors({required this.field, required this.message});

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(field: json['field'], message: json['message']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field'] = this.field;
    data['message'] = this.message;
    return data;
  }
}
