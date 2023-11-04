import 'detail_manga.dart';

class ResponseDatail {
  int? statusCode;
  DetailManga? data;
  String? errorMessage;

  ResponseDatail({this.statusCode, this.data, this.errorMessage});

  ResponseDatail.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? DetailManga.fromJson(json['data']) : null;
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errorMessage'] = errorMessage;
    return data;
  }
}
