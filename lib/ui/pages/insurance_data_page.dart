import 'package:CotizApp/domain/forms/forms_bloc.dart';
import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/utils/quotation_dropdown.dart';
import 'package:CotizApp/ui/utils/quotation_stepper.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InsuranceDataPage extends StatelessWidget {
  const InsuranceDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsBloc, FormsState>(
        builder: (context, state) {
          return QuotationSample(
            title: insuDataTitle,
            homeAction: () {
              context.go(AppRouter.home);
            },
            floatingAction: () {
              //usar go router para ir a la siguiente pagina
            },
            backAction: () {
              //usar go router para ir a la siguiente anterior
              context.go(AppRouter.persData);
            },
            content: Column(
              children: [
                QuotationStepper(
                  step: state.screen,
                ),
                QuotationDropDownButton(
                  title: 'Tipo de Cobertura',
                  hintText: state.insuranceType.isEmpty
                      ? 'Selecciona tu tipo de cobertura'
                      : state.insuranceType,
                  dropdownItems: ["Limitada", "No"],
                  onChange: (insuranceType) {
                    if (insuranceType != null) {
                      context.read<FormsBloc>().add(ChangedInsuranceType(insuranceType));
                    }
                  },
                ),

                QuotationDropDownButton(
                  title: '',
                  hintText: state.insuranceType2.isEmpty
                      ? 'Selecciona tu tipo de cobertura'
                      : state.insuranceType2,
                  dropdownItems: ["Amplia", "No"],
                  onChange: (insuranceType2) {
                    if (insuranceType2 != null) {
                      context.read<FormsBloc>().add(ChangedInsuranceType2(insuranceType2));
                    }
                  },
                ),

                QuotationDropDownButton(
                  title: '',
                  hintText: state.insuranceType3.isEmpty
                      ? 'Selecciona tu tipo de cobertura'
                      : state.insuranceType3,
                  dropdownItems: ["Amplia Plus", "No"],
                  onChange: (insuranceType3) {
                    if (insuranceType3 != null) {
                      context.read<FormsBloc>().add(ChangedInsuranceType3(insuranceType3));
                    }
                  },
                ),

              ],
            ),
          );
        }
    );
  }
}