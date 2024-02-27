import 'package:zero_manga_plus_view/core/usecases/use_case.dart';
import 'package:zero_manga_plus_view/data/datastore/remote/ApiService.dart';
import 'package:zero_manga_plus_view/data/datastore/remote/SendCapituloData.dart';

class UserGetCapitulos extends UseCase {
  final ApiService apiService;

  UserGetCapitulos({required this.apiService});

  @override
  Future call({required params}) async {
    var parameters = params as SendCapituloData;
    print("url refer => ${parameters.urlRefer}");
    print("url capitulo => ${parameters.urlCapitulo}");
    return await apiService.GetCapitulos(parameters.urlRefer, parameters.urlCapitulo);
  }
}
