import 'capitulos.dart';

class DetailManga {
  String? title;
  String? imageUrl;
  String? demografia;
  String? tipo;
  double? score;
  String? description;
  List<String>? generos;
  String? estado;
  List<Capitulos>? capitulos;

  DetailManga(
      {this.title,
      this.imageUrl,
      this.demografia,
      this.tipo,
      this.score,
      this.description,
      this.generos,
      this.estado,
      this.capitulos});

  DetailManga.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
    demografia = json['demografia'];
    tipo = json['tipo'];
    score = json['score'];
    description = json['description'];
    generos = json['generos'].cast<String>();
    estado = json['estado'];
    if (json['capitulos'] != null) {
      capitulos = <Capitulos>[];
      json['capitulos'].forEach((v) {
        capitulos!.add(Capitulos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['imageUrl'] = imageUrl;
    data['demografia'] = demografia;
    data['tipo'] = tipo;
    data['score'] = score;
    data['description'] = description;
    data['generos'] = generos;
    data['estado'] = estado;
    if (capitulos != null) {
      data['capitulos'] = capitulos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
