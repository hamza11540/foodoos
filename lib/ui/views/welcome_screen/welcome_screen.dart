import 'package:flutter/material.dart';
import 'package:foodoos/application/core/routes/route_path.dart';
import 'package:foodoos/mixin/base_mixin.dart';
import 'package:foodoos/presentation/utilis/appconstant.dart';

import '../../../presentation/utilis/app_colors.dart';
import '../../widgets/main_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with BaseMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppConstant.welcome, width: MediaQuery.of(context).size.width, fit: BoxFit.contain,),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                const Text(
                  "FOOD DELIVERY",
                  style: TextStyle(fontSize: 10, color: Color(0xff4A4B4D)),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "Discover the best foods from over 1,000\n restaurants and fast delivery to your \ndoorstep.",
                    style: TextStyle(fontSize: 14, color: Color(0xff4A4B4D)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                MainButton(
                  callback: () {
                    routeNavigator.pushNamedAndRemoveUntil(RoutePath.signInScreen);
                  },
                  width: double.infinity,
                  height: 60,
                  buttonText: "Login",
                  color: AppColors.mainOrange,
                  textColor: AppColors.white,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    routeNavigator.pushNamedAndRemoveUntil(RoutePath.signUpScreen);
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: AppColors.mainOrange)),
                    child: const Center(
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.mainOrange,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
