import 'package:CotizApp/domain/forms/forms_bloc.dart';
import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/utils/quotation_dropdown.dart';
import 'package:CotizApp/ui/utils/quotation_stepper.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CarDataPage extends StatelessWidget {
  const CarDataPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormsBloc, FormsState>(
      listener: (context, state) {
        if (state.isError) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(snackBarErrorLabel),
            backgroundColor: Colors.red,
          ));
        }
        if (state.isLoading) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
                content: Text(snackBarLoadingLabel),
              ));
        }
      },
      child: BlocBuilder<FormsBloc, FormsState>(
        builder: (context, state) {
          return QuotationSample(
            title: carDataTitle,
            floatingAction: nextButtonIsEnable(state)
                ? () {
                    context.go(AppRouter.stateCar);
                    context.read<FormsBloc>().add(Next());
                  }
                : null,
            backAction: () {
              //usar go router para ir a la siguiente anterior
              context.go(AppRouter.home);
            },
            content: Column(
              children: [
                QuotationStepper(
                  step: state.screen,
                ),
                QuotationDropDownButton(
                  title: 'Marca',
                  hintText: state.make.isEmpty
                      ? 'Seleccione la marca de su auto'
                      : state.make,
                  dropdownItems: [
                    "mercedes",
                    "toyota",
                    "nissan",
                    "Toyota",
                    "volkswagen",
                    "mazda"
                  ],
                  onChange: (make) {
                    if (make != null) {
                      context.read<FormsBloc>().add(ChangedMake(make));
                    }
                  },
                ),
                QuotationDropDownButton(
                  title: 'Año',
                  hintText: state.year.isEmpty
                      ? 'Seleccione el año de su auto'
                      : state.year,
                  dropdownItems: state.yearCars,
                  onChange: (year) {
                    if (year != null) {
                      context.read<FormsBloc>().add(ChangedYear(year));
                    }
                  },
                ),
                QuotationDropDownButton(
                  title: 'Linea',
                  hintText: state.model.isEmpty
                      ? 'Seleccione la linea de su auto'
                      : state.model,
                  dropdownItems: state.modelCars,
                  onChange: (model) {
                    if (model != null) {
                      context.read<FormsBloc>().add(ChangedModel(model));
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  bool nextButtonIsEnable(FormsState state) {
    return state.make.isNotEmpty &&
        state.year.isNotEmpty &&
        state.model.isNotEmpty;
  }
}
