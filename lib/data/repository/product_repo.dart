import 'package:trubuy/constants.dart';
import 'package:trubuy/data/models/product_model.dart';
import 'package:trubuy/data/models/response_model.dart';
import 'package:trubuy/data/network/http_service.dart';

abstract class ProductRepository {
  Future<ResponseModel> getProductList({required Map<String, dynamic> map});
}

class ProductRepositoryImp extends ProductRepository {
  @override
  Future<ResponseModel> getProductList(
      {required Map<String, dynamic> map}) async {
    var res = await HttpService().getRequest(
        fullUrl: "https://dummyjson.com/products/search?q=${map["type"]}");
    return res;
  }
}
