import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodoos/application/core/routes/route_path.dart';
import 'package:foodoos/mixin/base_mixin.dart';

import '../../../presentation/utilis/app_colors.dart';
import '../../../presentation/utilis/appconstant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin, BaseMixin {
  AnimationController? animation;
  Animation<double>? _fadeInFadeOut;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      //navigator
      routeNavigator.pushNamedAndRemoveUntil(RoutePath.welcomeScreen);
    });
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.1).animate(animation!);

    animation?.addListener(() {
      if (animation!.isCompleted) {
        animation?.reverse();
      } else {
        animation?.forward();
      }
    });
    animation?.repeat();
  }
  @override
  dispose() {
    animation!.dispose(); // you need this
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      body: FadeTransition(
        opacity: animation!,
        child: Stack(
          children: [
            Image.asset(
              AppConstant.splashBackground,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppConstant.fullLogo,
                )),
          ],
        ),
      ),
    );
  }
}
