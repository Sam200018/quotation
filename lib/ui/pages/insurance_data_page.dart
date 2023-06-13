import 'package:CotizApp/domain/forms/forms_bloc.dart';
import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/utils/quotation_selection.dart';
import 'package:CotizApp/ui/utils/quotation_stepper.dart';
import 'package:CotizApp/ui/utils/quotation_text.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InsuranceDataPage extends StatelessWidget {
  const InsuranceDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsBloc, FormsState>(builder: (context, state) {
      return QuotationSample(
        title: insuDataTitle,
        homeAction: () {
          context.go(AppRouter.home);
        },
        floatingAction: () {
          //usar go router para ir a la siguiente pagina
          context.read<FormsBloc>().add(Next());
          context.go(AppRouter.result);
        },
        floatingActionButtonLabel: quoteButtonLabel,
        backAction: () {
          //usar go router para ir a la siguiente anterior
          context.go(AppRouter.persData);
          context.read<FormsBloc>().add(Previous());
        },
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuotationStepper(
              step: state.screen,
            ),
            const QuotationText(text: insuTitle),
            const QuotationSelection(
                value: 1, title: insuranceTitleType1, info: insuranceType1),
            const QuotationSelection(
                value: 2, title: insuranceTitleType2, info: insuranceType2),
            const QuotationSelection(
                value: 3, title: insuranceTitleType3, info: insuranceType3),
          ],
        ),
      );
    });
  }
}
