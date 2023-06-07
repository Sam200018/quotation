import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarDataPage extends StatelessWidget {
  const CarDataPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuotationSample(
        title: carDataTitle,
        homeAction: () {
          context.go(AppRouter.home);
        },
        floatingAction: () {
          //usar go router para ir a la siguiente pagina
        },
        backAction: (){
          //usar go router para ir a la siguiente anterior
          context.go(AppRouter.home);
        },
        content: Column(
          children: [
            buildDropdownSection('Marca', 'Seleccione la marca de su auto'),
            buildDropdownSection('Año', 'Seleccione el año de su auto'),
            buildDropdownSection('Linea', 'Seleccione la linea de su auto')
          ],
        ));
  }

  Widget buildDropdownSection(String title, String hintText){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: const TextStyle(fontSize: 18,  fontWeight: FontWeight.bold,),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20)
          ),
          child: DropdownButton<String>(
            //dropdownColor: Colors.grey,
            //borderRadius: BorderRadius.circular(50),
            hint: Text(hintText),
            items:<String>[
              'Opcion 1',
              'Opcion 2'
            ].map((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue){
              //Manejar el cambio de valor seleccionado
            },
            underline: Container(),
          ),

        ),
        SizedBox(height: 20,)
      ],
    );
  }
}
