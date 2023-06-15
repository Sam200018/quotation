import 'package:CotizApp/ui/values/colors.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../domain/forms/forms_bloc.dart';
import '../routes.dart';

class QuotationSample extends StatelessWidget {
  final String title;
  final String floatingActionButtonLabel;
  final VoidCallback? floatingAction;
  final VoidCallback? backAction;
  final Widget content;

  // final

  const QuotationSample(
      {Key? key,
        required this.title,
        this.backAction,
        required this.floatingAction,
        required this.content,
        this.floatingActionButtonLabel = nextButtonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        onPressed: floatingAction,
        label: Text(floatingActionButtonLabel),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: backAction,
        ),
        title: Text(title),
        centerTitle: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.home),
              onPressed: (){
                context.go(AppRouter.home);
                context.read<FormsBloc>().add(Reset());
              }
          )
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Container(
              height: kToolbarHeight + 80,
              decoration: const BoxDecoration(
                color: appBarColor,
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
              height: 90.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                child: content,
              ),
            ),
          )
        ],
      ),
    );
  }
}
