part of 'forms_bloc.dart';

class FormsState extends Equatable {
  final String make,
      year,
      model,
      version,
      carState,
      maritalStatus,
      city,
      insuranceType,
      insuranceType2,
      insuranceType3,
      paymentType;
  final List<String> yearCars;
  final List<String> modelCars;
  final int insurance, price, screen;

  const FormsState(
      {this.make = "",
        this.year = "",
        this.model = "",
        this.version = "",
        this.carState = "",
        this.maritalStatus = "",
        this.city = "",
        this.insuranceType = "",
        this.insuranceType2 = "",
        this.insuranceType3 = "",
        this.paymentType = "",
        this.yearCars = const [],
        this.modelCars = const [],
        this.insurance = 0,
        this.price = 0,
        this.screen = 0});

  @override
  List<Object?> get props => [
        make,
        year,
        model,
        version,
        carState,
        maritalStatus,
        city,
        insuranceType,
        insuranceType2,
        insuranceType3,
        paymentType,
        yearCars,
        modelCars,
        insurance,
        price,
        screen
  ];

  factory FormsState.initial() => const FormsState();

  FormsState update({
    String? make,
    String? year,
    String? model,
    String? version,
    String? carState,
    String? maritalStatus,
    String? city,
    String? insuranceType,
    String? insuranceType2,
    String? insuranceType3,
    String? paymentType,
    List<String>? yearCars,
    List<String>? modelCars,
    int? insurance,
    int? price,
    int? screen,
  }) {
    return FormsState(
      make: make ?? this.make,
      year: year ?? this.year,
      model: model ?? this.model,
      version: version ?? this.version,
      carState: carState ?? this.carState,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      city: city ?? this.city,
      insuranceType: insuranceType ?? this.insuranceType,
      insuranceType2: insuranceType2 ?? this.insuranceType2,
      insuranceType3: insuranceType3 ?? this.insuranceType3,
      paymentType: paymentType ?? this.paymentType,
      insurance: insurance ?? this.insurance,
      yearCars: yearCars ?? this.yearCars,
      modelCars: modelCars ?? this.modelCars,
      price: price ?? this.price,
      screen: screen ?? this.screen,
    );
  }
}
