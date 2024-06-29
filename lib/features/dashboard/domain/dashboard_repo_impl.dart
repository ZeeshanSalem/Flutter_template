import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:template/core/error/exception.dart';
import 'package:template/core/network/network_info.dart';
import 'package:template/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:template/features/dashboard/data/model/response/product_list_data.dart';
import 'package:template/features/dashboard/domain/respository/dashboard_repo.dart';

class DashboardRepoImpl extends DashboardRepo {
  final NetworkInfo networkInfo;
  final DashboardRemoteDataSource dashboardRemoteDataSource;

  DashboardRepoImpl(
      {required this.networkInfo, required this.dashboardRemoteDataSource});

  @override
  Future<Either<Exception, List<ProductListData>>> getALlProducts() async {
    if (networkInfo.isConnected) {
      try {
        List<ProductListData> fetchedData = [];
        final response = await dashboardRemoteDataSource.getAllProducts();

        final List jsonList = response;

        fetchedData =
            jsonList.map((json) => ProductListData.fromJson(json)).toList();
        return Right(fetchedData);
      } on ServerException catch (exception) {
        return Left(ServerException(
          dioException: DioException(
            error: exception.dioException,
            requestOptions: RequestOptions(),
          ),
        ));
      }
    } else {
      return Left(NoInternetException(message: 'No Internet'));
    }
  }
}
