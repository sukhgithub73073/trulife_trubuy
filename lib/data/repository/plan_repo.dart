import 'package:trubuy/constants.dart';
import 'package:trubuy/data/models/plan_model.dart';
import 'package:trubuy/data/models/response_model.dart';
import 'package:trubuy/data/network/http_service.dart';

abstract class PlanRepository {
  Future<ResponseModel> getPlanList({required Map<String, dynamic> map});
}

class PlanRepositoryImp extends PlanRepository {
  @override
  Future<ResponseModel> getPlanList({required Map<String, dynamic> map}) async {
    var planList = [
      Datum(title: "Plan A", price: 100, duration: 102, features: [], isSelect: true),
      Datum(title: "Plan B", price: 150, duration: 202, features: [], isSelect: false),
    ];

    return ResponseModel(data: planList, message: "", errors: '', status: "");
  }
}
