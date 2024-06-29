import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/common_widgets/common_widget.dart';
import 'package:template/core/common_widgets/no_data_found.dart';
import 'package:template/core/utils/typography.dart';
import 'package:template/features/dashboard/data/model/response/product_list_data.dart';
import 'package:template/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:template/features/dashboard/presentation/cubit/dashboard_state.dart';

import 'widgets/widget.dart';

class DashboardMainScreen extends StatelessWidget {
  const DashboardMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: AppTypography.lightTheme.titleLarge,
        ),
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state.status == DashboardStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.status == DashboardStatus.failure) {
            return FailureWidget(onPressed: () {
              cubit.getAllProducts();
            });
          }
          return ((state.productList ?? []).isEmpty)
              ? NoDataFound(onFresh: () {
                  cubit.getAllProducts();
                })
              : ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  itemBuilder: (context, index) => ProductTile(
                    productListData: state.productList?[index],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 4,
                  ),
                  itemCount: state.productList?.length ?? 0,
                );
        },
      ),
    );
  }
}
