import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
//Aikhan a app ar main page ta thakbay
//slider of the top r nicher list of food items
class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }
  @override
  Widget build(BuildContext context) {
    //we will take column and in that we will give side wise contents as row
    //column has a default property of center things in top corner of the screen
    //row has default property of center in the y axis center
    // to make above both as header we'll put all container in a column to give the top corner default property
    //We've wrapped the container with scaffold to prevent the black screen
    print("current height "+MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(child: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
            padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Bangladesh",color: AppColors.mainColor),
                    Row(
                      children: [
                        SmallText(text: "Narayonganj",color: Colors.black54,),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(
          child: FoodPageBody(),
        )),
      ],
    ), onRefresh: _loadResource);
  }
}
