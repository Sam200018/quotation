import 'package:CotizApp/domain/forms/forms_bloc.dart';
import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/utils/quotation_dropdown.dart';
import 'package:CotizApp/ui/utils/quotation_stepper.dart';
import 'package:CotizApp/ui/utils/quotation_textform.dart';
import 'package:CotizApp/ui/utils/quotation_birthdate.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsBloc, FormsState>(
      builder: (context, state) {
        DateTime? selectedDate; // Variable para almacenar la fecha seleccionada

        return QuotationSample(
          title: persDataTitle,
          homeAction: () {
            context.go(AppRouter.home);
          },
          floatingAction: () {
            //usar go router para ir a la siguiente pagina
            context.go(AppRouter.insuData);
          },
          backAction: () {
            //usar go router para ir a la siguiente anterior
            context.go(AppRouter.carData);
          },
          content: Column(
            children: [
              QuotationStepper(
                step: state.screen,
              ),
              QuotationTextForm(
                title: 'Nombre(s)',
                hintText: 'Introduce tu(s) nombre(s)',
                controller: context.read<FormsBloc>().name,
              ),
              QuotationTextForm(
                title: 'Apellido(s)',
                hintText: 'Introduce tu(s) Apellido(s)',
                controller: context.read<FormsBloc>().lastName,
              ),
              QuotationDateBirth(
                title: 'Fecha de Nacimiento',
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    selectedDate = pickedDate;
                  }
                },
              ),
              QuotationDropDownButton(
                title: 'Estado Civil',
                hintText: state.maritalStatus.isEmpty
                    ? 'Selecciona tu Estado civil'
                    : state.maritalStatus,
                dropdownItems: [
                  "Soltero(a)",
                  "Casado(a)",
                  "Divorciado(a)",
                ],
                onChange: (maritalStatus) {
                  if (maritalStatus != null) {
                    context
                        .read<FormsBloc>()
                        .add(ChangedMake(maritalStatus));
                  }
                },
                space: 16, // Separación personalizada para esta página
              ),
              QuotationDropDownButton(
                title: 'Delegación',
                hintText: state.city.isEmpty
                    ? 'Selecciona tu delegación'
                    : state.city,
                dropdownItems: [
                  "Álvaro Obregón",
                  "Azcapotzalco",
                  "Benito Juárez",
                  "Coyoacán",
                  "Cuajimalpa de Morelos",
                  "Cuauhtémoc",
                  "G.A.M",
                  "Iztacalco",
                  "Iztapalapa",
                  "Magdalena Contreras",
                  "Miguel Hidalgo",
                  "Milpa Alta",
                  "Tláhuac",
                  "Tlalpan",
                  "Venustiano Carranza",
                  "Xochimilco",
                ],
                onChange: (city) {
                  if (city != null) {
                    context.read<FormsBloc>().add(ChangedMake(city));
                  }
                },
                space: 16, // Separación personalizada para esta página
              ),
            ],
          ),
        );
      },
    );
  }
}
