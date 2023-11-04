import 'package:zero_manga_plus_view/core/usecases/use_case.dart';
import 'package:zero_manga_plus_view/domain/repository/ApiService.dart';

import '../../../data/datastore/remote/ApiService.dart';


class UserGetDetailManga extends UseCase {
  final ApiService apiService;

  UserGetDetailManga({required this.apiService});

  @override
  Future call({required params}) async {
     return await apiService.GetMangaInfo(params.toString());
  }

}