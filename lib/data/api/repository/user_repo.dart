import 'package:food_delivery/data/api/api_client.dart';
import 'package:get/get.dart';
import '../../../utils/app_constants.dart';

class UserRepo{
  final ApiClient apiClient;
  UserRepo({required this.apiClient});
  Future<Response> getUserInfo() async{
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}