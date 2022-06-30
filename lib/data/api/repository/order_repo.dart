import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/place_order_model.dart';
import 'package:get/get.dart';

import '../../../utils/app_constants.dart';

class OrderRepo{
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});

  Future<Response> placeOrder(PlaceOrderBody placeOrder) async{
    return await apiClient.postData(AppConstants.PLACE_ORDER_URI,placeOrder.toJson());
  }
}