import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InsuranceDataPage extends StatelessWidget {
  const InsuranceDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuotationSample(
        title: insuDataTitle,
        homeAction: () {
          context.go(AppRouter.home);
        },
        floatingAction: () {
          //usar go router para ir a la siguiente pagina
        },
        backAction: (){
          //usar go router para ir a la siguiente anterior
          context.go(AppRouter.persData);
        },
        content: InsuranceDataForm(),
    );
  }
}

class InsuranceDataForm extends StatelessWidget {
  const InsuranceDataForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Form(
            child: Column(
              children: [
                Expanded( // Envuelve solo las partes necesarias en un Expanded para permitir hacer scroll
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildDropdown("", [
                          DropdownMenuItem(value: "limitada", child: Text("Limitada")),
                          DropdownMenuItem(value: "sin limite", child: Text("Sin Limite")),
                        ], insDataName),
                        SizedBox(height: 10),
                        _buildDropdown("", [
                          DropdownMenuItem(value: "amplia", child: Text("Amplia")),
                          DropdownMenuItem(value: "no amplia", child: Text("no Amplia")),
                        ], ""),
                        _buildDropdown("", [
                          DropdownMenuItem(value: "amplia plus", child: Text("Amplia Plus")),
                          DropdownMenuItem(value: "no amplia plus", child: Text("no Amplia plus")),
                        ], ""),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildDropdown(String hintText, List<DropdownMenuItem<String>> items,
    String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      SizedBox(height: 4),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: DropdownButtonFormField<String>(
          style: TextStyle(fontSize: 12, color: Colors.black),
          decoration: InputDecoration.collapsed(hintText: ''),
          items: items,
          onChanged: (value) {},
          hint: Text(hintText),
          isDense: true,
        ),
      ),
    ],
  );
}
