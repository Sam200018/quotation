part of 'forms_bloc.dart';

class FormsState extends Equatable {
  final bool isMakeSelected,
      isYearSelected,
      isModelSelected,
      isVersionSelected,
      isCarStateSelected,
      isNameValid,
      isLastNameValid,
      isBirthdaySelected,
      isMaritalStatusSelected,
      isCitySelected,
      isSecureSelected,
      isPaymentTypeSelected;
  final int price;
  final int screen;

  const FormsState(
      {this.isMakeSelected = true,
      this.isYearSelected = true,
      this.isModelSelected = true,
      this.isVersionSelected = true,
      this.isCarStateSelected = true,
      this.isNameValid = true,
      this.isLastNameValid = true,
      this.isBirthdaySelected = true,
      this.isMaritalStatusSelected = true,
      this.isCitySelected = true,
      this.isSecureSelected = true,
      this.isPaymentTypeSelected = true,
      this.price = 0,
      this.screen = 0});

  @override
  List<Object?> get props => [
        isMakeSelected,
        isYearSelected,
        isModelSelected,
        isVersionSelected,
        isCarStateSelected,
        isNameValid,
        isLastNameValid,
        isBirthdaySelected,
        isMaritalStatusSelected,
        isCitySelected,
        isSecureSelected,
        isPaymentTypeSelected,
        price,
        screen
      ];

  factory FormsState.initial() => const FormsState();

  FormsState copyWith({
    bool? isMakeSelected,
    bool? isYearSelected,
    bool? isModelSelected,
    bool? isVersionSelected,
    bool? isCarStateSelected,
    bool? isNameValid,
    bool? isLastNameValid,
    bool? isBirthdaySelected,
    bool? isMaritalStatusSelected,
    bool? isCitySelected,
    bool? isSecureSelected,
    bool? isPaymentTypeSelected,
    int? price,
    int? screen,
  }) {
    return FormsState(
      isMakeSelected: isMakeSelected ?? this.isMakeSelected,
      isYearSelected: isYearSelected ?? this.isYearSelected,
      isModelSelected: isModelSelected ?? this.isModelSelected,
      isVersionSelected: isVersionSelected ?? this.isVersionSelected,
      isCarStateSelected: isCarStateSelected ?? this.isCarStateSelected,
      isNameValid: isNameValid ?? this.isNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isBirthdaySelected: isBirthdaySelected ?? this.isBirthdaySelected,
      isMaritalStatusSelected:
          isMaritalStatusSelected ?? this.isMaritalStatusSelected,
      isCitySelected: isCitySelected ?? this.isCitySelected,
      isSecureSelected: isSecureSelected ?? this.isSecureSelected,
      isPaymentTypeSelected:
          isPaymentTypeSelected ?? this.isPaymentTypeSelected,
      price: price ?? this.price,
      screen: screen ?? this.screen,
    );
  }
}
