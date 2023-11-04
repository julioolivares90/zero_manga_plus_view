import 'package:zero_manga_plus_view/data/datastore/model/response.dart';
import 'package:zero_manga_plus_view/domain/repository/ApiService.dart';

import '../model/response_detail.dart';
import '../remote/ApiService.dart';
import '../util/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiServiceImplementation extends ApiService {

  @override
  Future<Response?> GetMangas() async {
    //var url = Uri.https(BASE_URL,MANGAS);

    var url = BASE_URL + MANGAS;
    var urlFinal = Uri.parse(BASE_URL + MANGAS);
    var response = await http.get(urlFinal);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var responseData = Response.fromJson(jsonResponse);
      if (responseData.statusCode == 200) {
        return responseData;
      } else {
        return responseData;
      }
    }
  }

 @override
 Future<ResponseDatail?> GetMangaInfo(String mangaUrl) async{
    var url = BASE_URL + MANGA_DETAIL + mangaUrl.trim();

    var urlFinal = Uri.parse(url);

    var response = await http.get(urlFinal);

    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body) as Map<String,dynamic>;
      var responseDetail = ResponseDatail.fromJson(jsonResponse);
      if(responseDetail != null){
        return responseDetail;
      }
      else {
        return ResponseDatail();
      }
    }
    return ResponseDatail();
 }
}
