part of 'forms_bloc.dart';

class FormsState extends Equatable {
  final String make,
      year,
      model,
      version,
      carState,
      maritalStatus,
      city,
      paymentType;
  final List<String> yearCars;
  final List<String> modelCars;
  final int insurance, screen;
  final double price;
  final bool isLoading, isError;

  const FormsState(
      {this.make = "",
      this.year = "",
      this.model = "",
      this.version = "",
      this.carState = "",
      this.maritalStatus = "",
      this.city = "",
      this.paymentType = "",
      this.yearCars = const [],
      this.modelCars = const [],
      this.insurance = 0,
      this.price = 0,
      this.screen = 0,
      this.isLoading = false,
      this.isError = false});

  @override
  List<Object?> get props => [
        make,
        year,
        model,
        version,
        carState,
        maritalStatus,
        city,
        paymentType,
        yearCars,
        modelCars,
        insurance,
        price,
        screen,
        isLoading,
        isError,
      ];

  factory FormsState.initial() => const FormsState();

  FormsState update(
      {String? make,
      String? year,
      String? model,
      String? version,
      String? carState,
      String? maritalStatus,
      String? city,
      String? paymentType,
      List<String>? yearCars,
      List<String>? modelCars,
      int? insurance,
      double? price,
      int? screen,
      bool? isLoading,
      bool? isError}) {
    return FormsState(
        make: make ?? this.make,
        year: year ?? this.year,
        model: model ?? this.model,
        version: version ?? this.version,
        carState: carState ?? this.carState,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        city: city ?? this.city,
        paymentType: paymentType ?? this.paymentType,
        insurance: insurance ?? this.insurance,
        yearCars: yearCars ?? this.yearCars,
        modelCars: modelCars ?? this.modelCars,
        price: price ?? this.price,
        screen: screen ?? this.screen,
        isLoading: isLoading ?? false,
        isError: isError ?? false);
  }
}
