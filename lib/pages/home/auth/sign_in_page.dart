import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/auth/sign_up_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_test_field.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05,),
            Container(
              child: Center(
                child: CircleAvatar(
                  backgroundColor:Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage(
                      "assets/image/logo part 1.png"
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                  style: TextStyle(
                    fontSize: Dimensions.font20*3+Dimensions.font20/2,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      //fontWeight: FontWeight.bold,
                      color: Colors.grey[500]
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            AppTestField(
                textController: emailController,
                hintText: "Email",
                icon: Icons.email),
            SizedBox(height: Dimensions.height20,),
            AppTestField(
                textController: passwordController,
                hintText: "Password",
                icon: Icons.password_sharp),
            SizedBox(height: Dimensions.height20,),
            RichText(text: TextSpan(
                text: "Sign into your account",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20
                )
            )
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor
              ),
              child: Center(
                child: BigText(
                  text: "Sign in",
                  size: Dimensions.font20+Dimensions.font20/2,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            RichText(text: TextSpan(
                text: "Don\'t have an account?",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20
                ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                text: " Create",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font20
                ))
              ]
            )
            ),
          ],
        ),
      ),
    );
  }
}
