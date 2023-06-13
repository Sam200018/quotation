import 'package:flutter/material.dart';

class QuotationDateBirth extends StatefulWidget {
  final ValueChanged<DateTime?>? onPressed;
  final String buttonText;
  final String title;

  const QuotationDateBirth({
    Key? key,
    this.onPressed,
    this.buttonText = 'Selecciona tu Fecha de Nacimiento',
    required this.title,
  }) : super(key: key);

  @override
  _QuotationDateBirthState createState() => _QuotationDateBirthState();
}

class _QuotationDateBirthState extends State<QuotationDateBirth> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate;
                });
                if (widget.onPressed != null) {
                  widget.onPressed!(pickedDate);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(
              selectedDate != null
                  ? selectedDate.toString().split(' ')[0]
                  : widget.buttonText,
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
