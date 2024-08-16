class ResponseModel {
  bool? error;
  int? code;
  dynamic data;
  String? message;

  ResponseModel({this.error, this.code, this.data, this.message});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    code = json['code'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> response = <String, dynamic>{};
    response['error'] = error;
    response['code'] = code;
    response['data'] = data;
    response['message'] = message;
    return response;
  }
}
