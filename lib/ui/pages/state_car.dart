import 'package:CotizApp/domain/forms/forms_bloc.dart';
import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/utils/quotation_dropdown.dart';
import 'package:CotizApp/ui/utils/quotation_stepper.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StateCarPage extends StatelessWidget {
  const StateCarPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsBloc, FormsState>(
      builder: (context, state) {
        return QuotationSample(
          title: stateCarTitle,
          homeAction: () {
            context.go(AppRouter.home);
          },
          floatingAction: nextButtonIsEnable(state)
              ? () {
            //usar go router para ir a la siguiente pagina
          }
              : null,
          backAction: () {
            //usar go router para ir a la siguiente anterior
            context.go(AppRouter.carData);
          },
          content: Column(
            children: [
              QuotationStepper(
                step: state.screen,
              ),
              QuotationDropDownButton(
                title: 'Versión',
                hintText: state.version.isEmpty
                    ? 'Seleccione la version de su auto'
                    : state.version,
                dropdownItems: const ["Basica", "Equipada", "Super Equipada"],
                onChange: (version) {
                  if (version != null) {
                    context.read<FormsBloc>().add(ChangedVersion(version));
                  }
                },
              ),
              QuotationDropDownButton(
                title: 'Estado',
                hintText: state.carState.isEmpty
                    ? 'Seleccione la version de su auto'
                    : state.carState,
                dropdownItems: const ["Nuevo", "Semi-Nuevo", "Usado"],
                onChange: (carState) {
                  if (carState != null) {
                    context.read<FormsBloc>().add(ChangedCarState(carState));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  bool nextButtonIsEnable(FormsState state) {
    return state.version.isNotEmpty &&
        state.carState.isNotEmpty;
  }
}
