import 'package:CotizApp/ui/pages/quotation_sample.dart';
import 'package:CotizApp/ui/routes.dart';
import 'package:CotizApp/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuotationSample(
      title: persDataTitle,
      homeAction: () {
        context.go(AppRouter.home);
      },
      floatingAction: () {
        //usar go router para ir a la siguiente pagina
      },
      backAction: () {
        //usar go router para ir a la siguiente anterior
      },
      content: PersonalDataForm(),
    );
  }
}

class PersonalDataForm extends StatelessWidget {
  const PersonalDataForm({Key? key}) : super(key: key);

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
                        _buildTextFormField(persDataNameField, persDataName),
                        SizedBox(height: 10),
                        _buildTextFormField(persDataLastNameField, persDataLastName),
                        SizedBox(height: 10),
                        _buildTextFormField(persDataBirthField, persDataBirth),
                        SizedBox(height: 10),
                        _buildDropdown(persDataCivilField, [
                          DropdownMenuItem(value: "soltero", child: Text("Soltero(a)")),
                          DropdownMenuItem(value: "casado", child: Text("Casado(a)")),
                          DropdownMenuItem(value: "divorciado", child: Text("Divorciado(a)")),
                        ], persDataCivil),
                        SizedBox(height: 10),
                        _buildDropdown(persDataDeleField, [
                          DropdownMenuItem(value: "delegacion1", child: Text("G.A.M")),
                          DropdownMenuItem(value: "delegacion2", child: Text("Azcapotzalco")),
                          DropdownMenuItem(value: "delegacion3", child: Text("Benito Juárez")),
                          DropdownMenuItem(value: "delegacion4", child: Text("Coyoacán")),
                          DropdownMenuItem(value: "delegacion5", child: Text("Cuajimalpa de Morelos")),
                          DropdownMenuItem(value: "delegacion6", child: Text("Cuauhtémoc")),
                          DropdownMenuItem(value: "delegacion7", child: Text("Iztacalco")),
                          DropdownMenuItem(value: "delegacion8", child: Text("Iztapalapa")),
                          DropdownMenuItem(value: "delegacion9", child: Text("Magdalena Contreras")),
                          DropdownMenuItem(value: "delegacion10", child: Text("Miguel Hidalgo")),
                          DropdownMenuItem(value: "delegacion11", child: Text("Milpa Alta")),
                          DropdownMenuItem(value: "delegacion12", child: Text("Tláhuac")),
                          DropdownMenuItem(value: "delegacion13", child: Text("Tlalpan")),
                          DropdownMenuItem(value: "delegacion14", child: Text("Venustiano Carranza")),
                          DropdownMenuItem(value: "delegacion15", child: Text("Xochimilco")),
                          DropdownMenuItem(value: "delegacion16", child: Text("Álvaro Obregón")),
                        ], persDataDele),
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

  Widget _buildTextFormField(String hintText, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)), // Ajusta el tamaño de fuente a 10
        SizedBox(height: 4),
        TextFormField(
          style: TextStyle(fontSize: 10), // Ajusta el tamaño de fuente a 10
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.black38),
            filled: true,
            fillColor: Colors.black12,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Reduce el tamaño del borderRadius a 30
            ),
          ),
        ),
      ],
    );
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
            style: TextStyle(fontSize: 12),
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
