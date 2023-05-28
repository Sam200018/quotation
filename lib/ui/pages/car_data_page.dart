import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';

class CarDataPage extends StatelessWidget {
  const CarDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (){
            router.go(AppRouter.home);
          },
        ),
        title: const Text('Datos del automovil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: (){
              router.go(AppRouter.home);
            },
          )
        ],
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.yellowAccent,
        child: Stack(
          children: [
            Positioned(
              top: -20,
              left: 0,
              right: 0,
              child: Container(
                height: kToolbarHeight + 80,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Container(
                width: 200,
                height: 300,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  )
                ),
                alignment: Alignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}