import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(icon: Icons.person,
            backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height45+Dimensions.height30,
              size: Dimensions.height15*10,
            ),
            SizedBox(height: Dimensions.height30,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,
                        ),
                        bigText: BigText(text: "Mohammed Plabon",)),
                    SizedBox(height: Dimensions.height20,),
                    //phone
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.phone,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,
                        ),
                        bigText: BigText(text: "01521215950",)),
                    SizedBox(height: Dimensions.height20,),
                    //email
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.email,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,
                        ),
                        bigText: BigText(text: "abid15@cse.pstu.ac.bd",)),
                    SizedBox(height: Dimensions.height20,),
                    //address
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,
                        ),
                        bigText: BigText(text: "Fill in your Address",)),
                    SizedBox(height: Dimensions.height20,),
                    //messages
                    AccountWidget(
                        appIcon: AppIcon(icon: Icons.message_outlined,
                          backgroundColor: Colors.redAccent,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2,
                          size: Dimensions.height10*5,
                        ),
                        bigText: BigText(text: "Enter Your Text",)),
                    SizedBox(height: Dimensions.height20,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
