import 'package:template/core/di/injection_container_common.dart';
import 'package:template/features/dashboard/presentation/cubit/dashboard_cubit.dart';

Future<void> initPresentationDI() async {
  serviceLocator.registerFactory<DashboardCubit>(
      () => DashboardCubit(dashboardRepo: serviceLocator()));


}
