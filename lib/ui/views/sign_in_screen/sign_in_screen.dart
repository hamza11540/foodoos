import 'package:flutter/material.dart';
import 'package:foodoos/application/core/routes/route_path.dart';
import 'package:foodoos/mixin/base_mixin.dart';

import '../../../presentation/utilis/app_colors.dart';
import '../../../presentation/utilis/appconstant.dart';
import '../../widgets/main_button.dart';
import '../../widgets/textfield_decoration.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with BaseMixin {
  TextEditingController phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppConstant.splashBackground,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Positioned(
              left: 15,
              top: 50,
              child: InkWell(
                onTap: () {
                  routeNavigator.pop();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 16,
                  ),
                ),
              )),
          Positioned(
              left: 0, right: 0, child: Image.asset(AppConstant.fullLogo)),
          Positioned(
              bottom: 50,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Phone Verification",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Let's explore the food out there",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    controller: phoneNumber,
                    cursorColor: Colors.grey,
                    style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                    decoration: customInputDecoration(
                      prefixIcon: const Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      hintText: "Phone Number",
                      hintTextStyle:
                          const TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return "field is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                    callback: () {
                      routeNavigator
                          .pushNamedAndRemoveUntil(RoutePath.otpScreen);
                    },
                    width: double.infinity,
                    height: 60,
                    buttonText: "Login",
                    color: AppColors.mainOrange,
                    textColor: AppColors.white,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont't have an account?",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          routeNavigator.pushNamed(RoutePath.signUpScreen);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
