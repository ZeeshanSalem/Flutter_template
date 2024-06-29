import 'package:dio/dio.dart';
import 'package:template/core/error/exception.dart';
import 'package:template/core/network/network_client.dart';
import 'package:template/core/network/network_constant.dart';

abstract class DashboardRemoteDataSource {
  Future<dynamic> getAllProducts();
}

class DashboardRemoteDataSourceImpl extends DashboardRemoteDataSource {
  final NetworkClient networkClient;

  DashboardRemoteDataSourceImpl({required this.networkClient});

  @override
  Future<dynamic> getAllProducts() async {
    final response = await networkClient.invoke(allProducts, RequestType.get);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
        dioException: DioException(
          requestOptions: response.requestOptions,
          error: response,
          type: DioExceptionType.badResponse,
        ),
      );
    }
  }
}
