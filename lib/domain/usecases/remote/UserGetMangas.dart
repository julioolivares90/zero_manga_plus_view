import 'package:zero_manga_plus_view/core/usecases/use_case.dart';
import 'package:zero_manga_plus_view/data/datastore/model/response.dart';

import '../../repository/ApiService.dart';

class UserGetMangas extends UseCase{
  final ApiService apiService;

  UserGetMangas({required this.apiService});

  @override
  Future<Response?> call({required params}) async {
    return await apiService.GetMangas();
  }

}