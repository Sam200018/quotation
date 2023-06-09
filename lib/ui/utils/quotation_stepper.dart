import 'package:CotizApp/ui/values/colors.dart';
import 'package:flutter/material.dart';

class QuotationStepper extends StatelessWidget {
  final int step;

  const QuotationStepper({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          switch (index) {
            case 0:
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.directions_car_filled_outlined,
                    color: index - 1 >= step ? null : appBarColor,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Icon(
                    step - 1 < index
                        ? Icons.label_important_outline_sharp
                        : Icons.label_important,
                    color: appBarColor,
                  )
                ],
              );
            case 1:
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.build,
                    color: index - 1 >= step ? null : appBarColor,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Icon(
                    step - 1 < index
                        ? Icons.label_important_outline_sharp
                        : Icons.label_important,
                    color: appBarColor,
                  )
                ],
              );
            case 2:
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.person,
                    color: index - 1 >= step ? null : appBarColor,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Icon(
                    step - 1 < index
                        ? Icons.label_important_outline_sharp
                        : Icons.label_important,
                    color: appBarColor,
                  )
                ],
              );
            case 3:
              return Row(
                children: [
                  Icon(
                    Icons.health_and_safety,
                    color: index - 1 >= step ? null : appBarColor,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Icon(
                    step - 1 < index
                        ? Icons.label_important_outline_sharp
                        : Icons.label_important,
                    color: appBarColor,
                  )
                ],
              );
            case 4:
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.list_alt,
                    color: index - 1 >= step ? null : appBarColor,
                  ),
                ],
              );
            default:
              return Text(index.toString());
          }
        }),
      ),
    );
  }
}
