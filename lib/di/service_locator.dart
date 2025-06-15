import 'package:free_dictionary/core/core.dart';
import 'package:free_dictionary/data/data.dart';
import 'package:free_dictionary/domain/domain.dart';
import 'package:free_dictionary/screens/screens.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerSingletonAsync<HttpClient>(() async => DioHttpClient());
  getIt.registerSingletonAsync(() async => SharedPreferences.getInstance());
  getIt.registerSingletonAsync<Storage>(
    () async => SharedPreferencesStorage(
      prefs: await getIt.getAsync<SharedPreferences>(),
    ),
  );

  // Data Layer
  getIt.registerFactory<LoadWords>(() => LocalLoadWords());
  getIt.registerFactory<LoadDictionary>(
    () => RemoteLoadDictionary(
      client: getIt(),
    ),
  );

  // Storage Use Cases
  getIt.registerFactory<LoadCurrentLanguage>(
    () => LocalLoadCurrentLanguage(storage: getIt()),
  );
  getIt.registerFactory<SaveCurrentLanguage>(
    () => LocalSaveCurrentLanguage(storage: getIt()),
  );
  getIt.registerFactory<LoadFavorites>(
    () => LocalLoadFavorites(storage: getIt()),
  );
  getIt.registerFactory<LoadHistory>(
    () => LocalLoadHistory(storage: getIt()),
  );
  getIt.registerFactory<SaveFavorite>(
    () => LocalSaveFavorite(storage: getIt()),
  );
  getIt.registerFactory<IsFavorited>(
    () => LocalIsFavorited(storage: getIt()),
  );
  getIt.registerFactory<SaveHistory>(
    () => LocalSaveHistory(storage: getIt()),
  );

  // Stores
  getIt.registerFactory<MainStore>(() => MainStore());
  getIt.registerLazySingleton<HomeStore>(
    () => HomeStore(
      localLoadWords: getIt(),
    ),
  );
  getIt.registerFactory<HistoryStore>(
    () => HistoryStore(
      loadHistory: getIt(),
    ),
  );
  getIt.registerFactory<FavoritesStore>(
    () => FavoritesStore(
      isFavorited: getIt(),
      loadFavorites: getIt(),
      saveFavorite: getIt(),
    ),
  );
  getIt.registerFactory<DetailsStore>(
    () => DetailsStore(
      loadDictionary: getIt(),
      saveHistory: getIt(),
      isFavorited: getIt(),
      saveFavorite: getIt(),
    ),
  );
}
