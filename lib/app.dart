import 'package:CotizApp/data/cars_datasource_impl.dart';
import 'package:CotizApp/domain/forms/forms_bloc.dart';
import 'package:CotizApp/repository/cars_repository_impl.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class QuotationApp extends StatelessWidget {
  const QuotationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CarsDataSourceImpl>(
          create: (context) => CarsDataSourceImpl(),
        ),
        RepositoryProvider<CarsRepositoryImpl>(
          create: (context) =>
              CarsRepositoryImpl(context.read<CarsDataSourceImpl>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FormsBloc>(create: (context) {
            return FormsBloc(context.read<CarsRepositoryImpl>());
          }),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              title: "CotizApp",
              routerConfig: AppRouter().router,
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
            );
          },
        ),
      ),
    );
  }
}
