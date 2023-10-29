
import '../model/response.dart';
import 'package:http/http.dart' as http;

abstract class ApiService {

  Future<Response> GetMangas ();
}