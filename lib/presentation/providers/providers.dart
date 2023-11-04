
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injector/injector.dart';
import 'package:zero_manga_plus_view/data/datastore/model/response_detail.dart';
import 'package:zero_manga_plus_view/domain/usecases/remote/UserGetMangas.dart';
import 'package:zero_manga_plus_view/domain/usecases/remote/user_get_detail_manga.dart';

final mangasProvider = FutureProvider.autoDispose((ref)async {
  final userGetMangas = Injector.appInstance.get<UserGetMangas>();

  return userGetMangas.call(params: null);
});

final mangaDetailProvider = FutureProvider.family<ResponseDatail,String>((ref,mangaUrl) async {
  final userGetDetailManga = Injector.appInstance.get<UserGetDetailManga>();
  
  return await userGetDetailManga.call(params: mangaUrl);
});