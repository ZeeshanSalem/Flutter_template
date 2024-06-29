// part of 'dashboard_cubit.dart';
//
// abstract class DashboardState extends Equatable {
//   const DashboardState();
// }
//
// class DashboardInitial extends DashboardState {
//   @override
//   List<Object> get props => [];
// }

import 'package:equatable/equatable.dart';
import 'package:template/core/error/model/error_response_model.dart';
import 'package:template/features/dashboard/data/model/response/product_list_data.dart';

enum DashboardStatus {
  initial,
  loading,
  success,
  failure,
}

class DashboardState extends Equatable {
  final DashboardStatus? status;
  final ErrorModel? errorModel;
  final List<ProductListData>? productList;

  const DashboardState({this.errorModel, this.status, this.productList});

  factory DashboardState.fromJson(json) {
    return DashboardState(
      status: DashboardStatus.values[json['status'] ?? 0],
      errorModel: json['errorModel'] != null
          ? ErrorModel.fromJson(json['errorModel'])
          : null,
      productList: json['productList'] != null
          ? List.from(json['productList']
              .map((prod) => ProductListData.fromJson(prod))
              .toList())
          : null,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'errorModel': errorModel?.toJson(),
        'productList': productList?.map((prod) => prod.toJson()).toList(),
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        errorModel,
        status,
        productList,
      ];
}
