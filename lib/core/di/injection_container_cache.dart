import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/core/di/injection_container_common.dart';
import 'package:template/core/utils/preferences_utils.dart';

Future<void> initCacheDI() async {
  final sharedPref = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton<SharedPreferences>(() => sharedPref);
  serviceLocator.registerLazySingleton<PreferencesUtil>(
      () => PreferencesUtil(preferences: sharedPref, logger: serviceLocator()));
}
