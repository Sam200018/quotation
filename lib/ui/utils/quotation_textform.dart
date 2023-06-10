import 'package:flutter/material.dart';

class QuotationTextForm extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool enabled;

  const QuotationTextForm({
    Key? key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0), // Espacio inferior entre los campos
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              controller: controller,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                filled: true,
                fillColor: Colors.grey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
              enabled: enabled,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Este campo es requerido';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
