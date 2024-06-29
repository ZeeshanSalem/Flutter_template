import 'package:template/core/di/injection_container_common.dart';
import 'package:template/features/dashboard/data/data_source/dashboard_remote_data_source.dart';

Future<void> initRemoteDI() async {
  serviceLocator.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(
      networkClient: serviceLocator(),
    ),
  );
}
