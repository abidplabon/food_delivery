import 'package:food_delivery/data/api/repository/auth_repo.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({
    required this.authRepo
});
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel>registration(SignUpBody signUpBody) async {
    _isLoading = true;
    //update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
        authRepo.saveUserToken(response.body["token"]);
        responseModel = ResponseModel(true,response.body['token']);
    }else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading=false;
    update();
    return responseModel;
  }
  Future<ResponseModel>login(String email,String password) async {
    print("Getting Token");
    print(authRepo.getUserToken().toString());
    _isLoading = true;
    update();
    Response response = await authRepo.login(email,password);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      print("Backend tokens");
      authRepo.saveUserToken(response.body["token"]);

      print("My token is "+ response.body["token"].toString());
      responseModel = ResponseModel(true,response.body['token']);
    }else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading=false;
    update();
    return responseModel;
  }
  void saveUserNumberAndPassword(String number,String password){
    authRepo.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }
  bool clearSharedData(){
    return authRepo.clearSharedData();
  }
}