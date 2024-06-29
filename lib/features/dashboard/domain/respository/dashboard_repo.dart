import 'package:template/features/dashboard/data/model/response/product_list_data.dart';
import 'package:dartz/dartz.dart';

abstract class DashboardRepo {
  Future<Either<Exception, List<ProductListData>>> getALlProducts();
}