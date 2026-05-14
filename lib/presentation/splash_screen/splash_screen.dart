import 'package:flutter/material.dart';
import 'package:anubrat_s_application2/core/app_export.dart';
import 'package:anubrat_s_application2/services/Shared_Preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateFromSplash();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary.withOpacity(1),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 5.v),
              CustomImageView(
                imagePath: ImageConstant.imgLogo,
                height: 72.adaptSize,
                width: 72.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateFromSplash() async {
    await Future.delayed(Duration(seconds: 1));

    final isLoggedIn = await SharedPref.getLoginStatus();
    final nextRoute = isLoggedIn
        ? AppRoutes.dashboardContainerScreen
        : AppRoutes.loginScreen;

    if (!mounted) {
      return;
    }

    Navigator.pushReplacementNamed(context, nextRoute);
  }
}
