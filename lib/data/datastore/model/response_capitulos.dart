class ResponseCapitulos {
  int? statusCode;
  List<String>? data;
  String? errorMessage;

  ResponseCapitulos({this.statusCode, this.data, this.errorMessage});

  ResponseCapitulos.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'].cast<String>();
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['data'] = this.data;
    data['errorMessage'] = errorMessage;
    return data;
  }
}