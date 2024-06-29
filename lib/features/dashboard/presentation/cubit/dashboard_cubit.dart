import 'package:flutter/cupertino.dart';
import 'package:template/core/cubit/base_cubit.dart';
import 'package:template/core/error/model/error_response_model.dart';
import 'package:template/features/dashboard/domain/respository/dashboard_repo.dart';
import 'package:template/features/dashboard/presentation/cubit/dashboard_state.dart';

class DashboardCubit extends BaseCubit<DashboardState> {
  final DashboardRepo dashboardRepo;

  DashboardCubit({required this.dashboardRepo})
      : super(const DashboardState(status: DashboardStatus.initial)){
    getAllProducts();
  }

  getAllProducts() async {
    try {
      emit(const DashboardState(
        status: DashboardStatus.loading,
      ));
      final response = await dashboardRepo.getALlProducts();

      response.fold((l) {
        emit(DashboardState(
          status: DashboardStatus.failure,
          errorModel: handleException(l),
        ));
      }, (r) {
        emit(DashboardState(
          status: DashboardStatus.success,
          productList: r,
        ));
      });
    } catch (e, s) {
      debugPrint('Exception: $e');
      debugPrint('Strace: $s');
      emit(DashboardState(
        status: DashboardStatus.failure,
        errorModel: ErrorModel(
          message: 'Exception $e',
        ),
      ));
    }
  }
}
