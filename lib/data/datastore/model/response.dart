
import 'mangas_populares.dart';
import 'mangas_seinen.dart';

class Response {
  int? statusCode;
  List<Mangas>? mangasPopulares;
  List<Mangas>? mangasSeinen;
  String? errorMessage;

  Response(
      {this.statusCode,
        this.mangasPopulares,
        this.mangasSeinen,
        this.errorMessage});

  Response.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['mangasPopulares'] != null) {
      mangasPopulares = <Mangas>[];
      json['mangasPopulares'].forEach((v) {
        mangasPopulares!.add(new Mangas.fromJson(v));
      });
    }
    if (json['mangasSeinen'] != null) {
      mangasSeinen = <Mangas>[];
      json['mangasSeinen'].forEach((v) {
        mangasSeinen!.add(new Mangas.fromJson(v));
      });
    }
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.mangasPopulares != null) {
      data['mangasPopulares'] =
          this.mangasPopulares!.map((v) => v.toJson()).toList();
    }
    if (this.mangasSeinen != null) {
      data['mangasSeinen'] = this.mangasSeinen!.map((v) => v.toJson()).toList();
    }
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}
