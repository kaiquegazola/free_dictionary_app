import 'package:free_dictionary/core/core.dart';
import 'package:free_dictionary/data/data.dart';
import 'package:free_dictionary/domain/domain.dart';
import 'package:free_dictionary/screens/screens.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerLazySingleton<HttpClient>(() => DioHttpClient());

  // Data Layer
  getIt.registerLazySingleton<LoadWords>(() => LocalLoadWords());
  getIt.registerLazySingleton<LoadDictionary>(
    () => RemoteLoadDictionary(
      client: getIt(),
    ),
  );

  // Stores
  getIt.registerFactory<MainStore>(() => MainStore());
  getIt.registerLazySingleton<HomeStore>(
    () => HomeStore(
      localLoadWords: getIt(),
    ),
  );
  getIt.registerFactory<HistoryStore>(() => HistoryStore());
  getIt.registerFactory<FavoritesStore>(() => FavoritesStore());
  getIt.registerFactory<DetailsStore>(
    () => DetailsStore(
      loadDictionary: getIt(),
    ),
  );
}
