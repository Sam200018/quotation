import 'package:flutter/material.dart';

class QuotationDateBirth extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final String title;

  const QuotationDateBirth({
    Key? key,
    this.onPressed,
    this.buttonText = 'Selecciona tu Fecha de Nacimiento',
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
