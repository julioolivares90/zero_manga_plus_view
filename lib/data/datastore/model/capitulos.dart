class Capitulos {
  String? name;
  String? urlLeer;

  Capitulos({this.name, this.urlLeer});

  Capitulos.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    urlLeer = json['urlLeer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['urlLeer'] = urlLeer;
    return data;
  }
}