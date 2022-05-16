import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/pages/home/food/popular_food_detail.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() { //event listener will listen to the page update
      setState((){  //SetState will update the value in the declared variable
        _currPageValue=pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();//destroyed all the pagecontroller stuff
    super.dispose();
  }

  List _foodList =[
    'https://as2.ftcdn.net/v2/jpg/02/71/12/71/1000_F_271127144_mk7C8CTH39aHOmsGJVzQlfV0yML2N4a0.jpg',
    'https://t3.ftcdn.net/jpg/02/17/93/02/240_F_217930257_biorSQZao9P7vr1EGwGIke5TA8OIZCU1.jpg',
    'https://t3.ftcdn.net/jpg/02/17/93/02/240_F_217930257_biorSQZao9P7vr1EGwGIke5TA8OIZCU1.jpg',
    'https://t3.ftcdn.net/jpg/02/17/93/02/240_F_217930257_biorSQZao9P7vr1EGwGIke5TA8OIZCU1.jpg',
    'https://t3.ftcdn.net/jpg/02/17/93/02/240_F_217930257_biorSQZao9P7vr1EGwGIke5TA8OIZCU1.jpg',
    'https://t3.ftcdn.net/jpg/02/17/93/02/240_F_217930257_biorSQZao9P7vr1EGwGIke5TA8OIZCU1.jpg',
    'https://t3.ftcdn.net/jpg/02/17/93/02/240_F_217930257_biorSQZao9P7vr1EGwGIke5TA8OIZCU1.jpg',
    'https://t3.ftcdn.net/jpg/02/17/93/02/240_F_217930257_biorSQZao9P7vr1EGwGIke5TA8OIZCU1.jpg',
    'https://t3.ftcdn.net/jpg/02/17/93/02/240_F_217930257_biorSQZao9P7vr1EGwGIke5TA8OIZCU1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    //Container doesn't have a default height
    //Child container always takes height of parent so 320 only working not 220 so we need to take stack widget to get it into the shape provided
    //page value in the scroller will increase or decrease with decimal point slowly and index value case is completely opposite
    return Column(
      children: [
        //Slider Sections
        GetBuilder<PopularProductController>(builder:(popularProducts){
          return popularProducts.isLoaded?Container(
            height: Dimensions.pageView,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context,position){
                    return _buildPageItem(position,popularProducts.popularProductList[position]);
                  }),
          ):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              shape: const Border(),
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".",color: Colors.black26,),
              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing",),
              )
            ],
          ),
        ),
          //Parent container should have a certain height
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isloaded?ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedProduct.recommendedProductList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RouteHelper.getRecommendedFood(index,"home"));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
                    child: Row(
                      children: [
                        Container(
                          width:Dimensions.listViewImgSize,
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white38,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      //_foodList[index];
                                    //"https://as2.ftcdn.net/v2/jpg/02/71/12/71/1000_F_271127144_mk7C8CTH39aHOmsGJVzQlfV0yML2N4a0.jpg"
                                       AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
                                  )
                              )
                          ),
                        ),
                        //Expanded widget wil force the container to take all the space in the place available
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, "/food_details");
                            },
                            child: Container(
                              height: Dimensions.listViewTextContSize,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(Dimensions.radius20),
                                      bottomRight: Radius.circular(Dimensions.radius20)
                                  ),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                    SizedBox(height: Dimensions.height10,),
                                    SmallText(text: "With chinese characteristics"),
                                    SizedBox(height: Dimensions.height10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: AppColors.iconColor1),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: "1.7km",
                                            iconColor: AppColors.mainColor),
                                        IconAndTextWidget(
                                            icon: Icons.access_time_rounded,
                                            text: "32min",
                                            iconColor: AppColors.iconColor2),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }):CircularProgressIndicator(
            color: AppColors.mainColor,
          );
        }),
      ],
    );
  }
  Widget _buildPageItem(int index,ProductModel popularProduct){
    Matrix4 matrix = new Matrix4.identity(); //x,y,z axis values to set it into the position
    if(index==_currPageValue.floor()){
        var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
        var currTrans = _height*(1-currScale)/2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index==_currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0 , _height*(1-_scaleFactor)/2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){

              Get.toNamed(RouteHelper.getPopularFood(index,"home"));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: Color(0xFF69c5df),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!
                      )
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0)
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0)
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15,left: Dimensions.height15,right: Dimensions.height15),
                child: AppColumn(text: popularProduct.name!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
