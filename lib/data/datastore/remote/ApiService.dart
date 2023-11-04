
import '../model/response.dart';
import 'package:http/http.dart' as http;

import '../model/response_detail.dart';

abstract class ApiService {

  Future<Response?> GetMangas();

  Future<ResponseDatail?> GetMangaInfo(String mangaUrl);
}