import 'package:injector/injector.dart';
import 'package:zero_manga_plus_view/data/datastore/repository/api_service.dart';
import 'package:zero_manga_plus_view/domain/repository/ApiService.dart';
import 'package:zero_manga_plus_view/domain/usecases/remote/UserGetMangas.dart';

class Di{
  void regist() {
    final injector = Injector.appInstance;

    injector.registerDependency<ApiService>(() => ApiServiceImplementation());

    injector.registerDependency<UserGetMangas>(() => UserGetMangas(apiService: injector.get<ApiService>()));
  }
}