import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../application/network/client/api_service.dart';
import '../application/network/client/iApService.dart';
import '../application/network/external_values/ExternalValues.dart';
import '../data/local_data_source/preference/PrefHelper.dart';
import '../data/local_data_source/preference/iPrefHelper.dart';
import '../services/navService/INavigationService.dart';
import '../services/navService/navService.dart';

final inject = GetIt.instance;
Future<void> setup() async {
  inject.registerSingletonAsync(() => SharedPreferences.getInstance());
  inject.registerLazySingleton<INavigationService>(() => NavigationService());
  inject.registerLazySingleton<IPrefHelper>(() => PrefHelper(inject()));
  inject.registerLazySingleton<IApiService>(
      () => ApiService.create(externalValues: ExternalValues()));
}
