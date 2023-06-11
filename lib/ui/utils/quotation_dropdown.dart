  import 'package:flutter/material.dart';

  class QuotationDropDownButton extends StatelessWidget {
    final String title;
    final String hintText;
    final List<String>? dropdownItems;
    final ValueChanged<String?> onChange;
    final double space; // separación personalizada

    const QuotationDropDownButton({
      Key? key,
      required this.title,
      required this.hintText,
      this.dropdownItems,
      required this.onChange,
      this.space = 50, // Valor predeterminado para la separación
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton<String>(
              padding: const EdgeInsets.all(10),
              hint: Text(hintText),
              items: dropdownItems?.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.toUpperCase()),
                );
              }).toList(),
              onChanged: onChange,
              underline: Container(),
            ),
          ),
          SizedBox(
            height: space,
          ),
        ],
      );
    }
  }
