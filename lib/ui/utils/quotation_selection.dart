import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/forms/forms_bloc.dart';
import '../values/colors.dart';

class QuotationSelection extends StatelessWidget {
  final int value;
  final String title;
  final String info;

  const QuotationSelection(
      {super.key,
      required this.value,
      required this.title,
      required this.info});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsBloc, FormsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), border: Border.all(style: BorderStyle.solid,color: Colors.grey)),
            child: ListTile(
              title: Text(title),
              subtitle: Text(info),
              leading: Radio<int>(
                activeColor: appBarColor,
                value: value,
                groupValue: state.insurance,
                onChanged: (value) {
                  if (value != null) {
                    context.read<FormsBloc>().add(ChangedInsurance(value));
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
