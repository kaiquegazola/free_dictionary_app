import 'package:free_dictionary_app/core/core.dart';
import 'package:free_dictionary_app/data/data.dart';
import 'package:get_it/get_it.dart';


final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<HttpClient>(() => DioHttpClient());
}
