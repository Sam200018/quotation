import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/utils/quotation_dropdown.dart';
import 'package:CotizApp/ui/utils/quotation_stepper.dart';
import 'package:CotizApp/ui/utils/quotation_text.dart';
import 'package:CotizApp/ui/values/colors.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../domain/forms/forms_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsBloc, FormsState>(
      builder: (context, state) {
        final name = context.read<FormsBloc>().name;
        String insurance = "";
        switch (state.insurance) {
          case 1:
            {
              insurance = "Limitada";
            }
            break;
          case 2:
            {
              insurance = "Amplia";
            }
            break;
          case 3:
            {
              insurance = "Amplia Plus";
            }
            break;
        }

        return QuotationSample(
          title: quotationTitle,
          floatingAction: () {
            context.go(AppRouter.insuData);
            context.read<FormsBloc>().add(Previous());
          },
          floatingActionButtonLabel: editButtonLabel,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QuotationStepper(step: state.screen),
              QuotationText(text: "$resultLabel${name.text}!"),
              SizedBox(height: 3.h),
              QuotationText(text: "${state.model} ${state.year}"),
              QuotationText(text: descriptionLabel, size: 12.sp),
              QuotationText(
                  text: "${state.version}, ${state.carState}", size: 12.sp),
              SizedBox(height: 1.h),
              const Align(
                  alignment: Alignment.center,
                  child: QuotationText(text: insuranceLabel)),
              Align(
                  alignment: Alignment.center,
                  child: QuotationText(
                    text: insurance,
                    colorText: appBarColor,
                  )),
              SizedBox(height: 3.h),
              if (state.paymentType.isEmpty)
                 QuotationText(
                  text: selectFrequencyLabel,
                  colorText: Colors.redAccent,
                  size: 10.sp,
                ),
              QuotationDropDownButton(
                  title: frequencyLabel,
                  hintText: state.paymentType.isEmpty
                      ? frequencyButtonLabel
                      : state.paymentType,
                  dropdownItems: ["mensual", "semestral", "anual"],
                  onChange: (frequency) {
                    if (frequency != null) {
                      print(frequency);
                      context
                          .read<FormsBloc>()
                          .add(ChangedPaymentType(frequency));
                    }
                  }),
              Align(
                alignment: Alignment.center,
                child: QuotationText(
                  text: costLabel,
                  size: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.center,
                child: QuotationText(
                  text: "\$${state.price.toString()}",
                  size: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
