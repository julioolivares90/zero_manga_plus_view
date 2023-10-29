import 'package:zero_manga_plus_view/data/datastore/util/constants.dart';

import '../../data/datastore/model/response.dart';

abstract class ApiService {
  Future<Response?> GetMangas();
}