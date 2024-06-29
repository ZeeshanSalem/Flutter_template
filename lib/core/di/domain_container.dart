import 'package:template/core/di/injection_container_common.dart';
import 'package:template/features/dashboard/domain/respository/dashboard_repo.dart';

import '../../features/dashboard/domain/dashboard_repo_impl.dart';

Future<void> initDomainDI() async {
  serviceLocator.registerLazySingleton<DashboardRepo>(() => DashboardRepoImpl(
        dashboardRemoteDataSource: serviceLocator(),
        networkInfo: serviceLocator(),
      ));
}
