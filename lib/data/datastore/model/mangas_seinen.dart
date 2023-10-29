
class MangasSeinen {
  String? title;
  String? mangaUrl;
  String? type;
  String? demography;
  String? score;
  String? mangaImagen;

  MangasSeinen(
      {this.title,
        this.mangaUrl,
        this.type,
        this.demography,
        this.score,
        this.mangaImagen});

  MangasSeinen.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    mangaUrl = json['mangaUrl'];
    type = json['type'];
    demography = json['demography'];
    score = json['score'];
    mangaImagen = json['mangaImagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['mangaUrl'] = this.mangaUrl;
    data['type'] = this.type;
    data['demography'] = this.demography;
    data['score'] = this.score;
    data['mangaImagen'] = this.mangaImagen;
    return data;
  }
}