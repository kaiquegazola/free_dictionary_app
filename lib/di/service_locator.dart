import 'package:free_dictionary/core/core.dart';
import 'package:free_dictionary/data/data.dart';
import 'package:free_dictionary/screens/screens.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<HttpClient>(() => DioHttpClient());

  getIt.registerFactory<MainStore>(() => MainStore());
  getIt.registerFactory<HistoryStore>(() => HistoryStore());
  getIt.registerFactory<FavoritesStore>(() => FavoritesStore());
}
