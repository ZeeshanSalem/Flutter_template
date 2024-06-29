import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:template/core/di/injection_container_common.dart';
import 'package:template/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:template/features/dashboard/presentation/ui/product_list_screen.dart';


final GoRouter routeConfig = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(
        name: '/',
        path: '/',
        builder: (context, state) {
          return BlocProvider<DashboardCubit>(
            create: (context) => serviceLocator<DashboardCubit>(),
            child: const DashboardMainScreen(),
          );
        }
    )
  ],
);