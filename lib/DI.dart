import 'package:injector/injector.dart';
import 'package:zero_manga_plus_view/data/datastore/repository/api_service.dart';
import 'package:zero_manga_plus_view/domain/repository/ApiService.dart';
import 'package:zero_manga_plus_view/domain/usecases/remote/UserGetMangas.dart';
import 'package:zero_manga_plus_view/domain/usecases/remote/user_get_capitulos.dart';
import 'package:zero_manga_plus_view/domain/usecases/remote/user_get_detail_manga.dart';

import 'data/datastore/remote/ApiService.dart';

class Di{
  void regist() {
    final injector = Injector.appInstance;

    injector.registerDependency<ApiService>(() => ApiServiceImplementation());

    injector.registerDependency<UserGetMangas>(() => UserGetMangas(apiService: injector.get<ApiService>()));

    injector.registerDependency<UserGetDetailManga>(() => UserGetDetailManga(apiService: injector.get<ApiService>()));

    injector.registerDependency<UserGetCapitulos>(() => UserGetCapitulos(apiService: injector.get<ApiService>()));
  }
}