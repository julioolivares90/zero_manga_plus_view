
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injector/injector.dart';
import 'package:zero_manga_plus_view/domain/repository/ApiService.dart';
import 'package:zero_manga_plus_view/domain/usecases/remote/UserGetMangas.dart';

final mangasProvider = FutureProvider.autoDispose((ref)async {
  final userGetMangas = Injector.appInstance.get<UserGetMangas>();

  return userGetMangas.call(params: null);
});