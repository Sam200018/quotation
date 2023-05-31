import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/background.png",width: 150.w,height: 100.h,),
          const HomeScreen()
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const LogoMessage(),
          Image.asset(
            "assets/inicio.png",
            width: double.infinity,
          ),
          const BeginButton()
        ],
      ),
    );
  }
}

class LogoMessage extends StatelessWidget {
  const LogoMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/logo.png"),
        SizedBox(
            width: 30.w,
            child: Text(protectMessage, style: TextStyle(fontSize: 12.sp),)),
      ],
    );
  }
}

class BeginButton extends StatelessWidget {
  const BeginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return OutlinedButton(
      onPressed: () {
        context.go(AppRouter.carData);
      },
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 2.0,
          minimumSize: Size(80.w, 10.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          )
      ),
      child: Text(
        beginButtonLabel,
        style: TextStyle(fontSize: 25.sp),
      ),
    );
  }
}