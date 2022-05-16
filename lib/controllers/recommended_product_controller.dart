import 'package:food_delivery/data/api/repository/popular_product_repo.dart';
import 'package:food_delivery/data/api/repository/recommended_product_repo.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList=[];
  List<dynamic> get recommendedProductList=>_recommendedProductList;


  bool _isLoaded = false;
  bool get isloaded=> _isLoaded;

  Future<void> getRecommendedProductList() async{
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      print("Got products");
      _recommendedProductList=[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      print("Value");
      print(response.body);
      _isLoaded=true;
      update();
    }else{

    }
  }
}