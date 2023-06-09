import 'package:flutter/material.dart';

class QuotationDropDownButton extends StatelessWidget {
  final String title;
  final String hintText;
  final List<String>? dropdownItems;
  final ValueChanged<String?> onChange;

  const QuotationDropDownButton(
      {super.key,
      required this.title,
      required this.hintText,
      this.dropdownItems,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(style: BorderStyle.solid, color: Colors.grey)),
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
        const SizedBox(
          height: 60,
        )
      ],
    );
  }
}
