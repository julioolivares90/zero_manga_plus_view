class Capitulos {
  String? name;
  String? urlLeer;

  Capitulos({this.name, this.urlLeer});

  Capitulos.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    urlLeer = json['urlLeer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['urlLeer'] = this.urlLeer;
    return data;
  }
}