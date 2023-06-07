import 'dart:convert';

class CarModel {
  final int cityMpg;
  final String carModelClass;
  final int combinationMpg;
  final int cylinders;
  final double displacement;
  final String drive;
  final String fuelType;
  final int highwayMpg;
  final String make;
  final String model;
  final String transmission;
  final int year;

  CarModel({
    required this.cityMpg,
    required this.carModelClass,
    required this.combinationMpg,
    required this.cylinders,
    required this.displacement,
    required this.drive,
    required this.fuelType,
    required this.highwayMpg,
    required this.make,
    required this.model,
    required this.transmission,
    required this.year,
  });

  static empty() => CarModel(
      cityMpg: 0,
      carModelClass: "",
      combinationMpg: 0,
      cylinders: 0,
      displacement: 0.0,
      drive: "",
      fuelType: "",
      highwayMpg: 0,
      make: "",
      model: "",
      transmission: "",
      year: 0);

  factory CarModel.fromRawJson(String str) =>
      CarModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        cityMpg: json["city_mpg"],
        carModelClass: json["class"],
        combinationMpg: json["combination_mpg"],
        cylinders: json["cylinders"],
        displacement: json["displacement"]?.toDouble(),
        drive: json["drive"],
        fuelType: json["fuel_type"],
        highwayMpg: json["highway_mpg"],
        make: json["make"],
        model: json["model"],
        transmission: json["transmission"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "city_mpg": cityMpg,
        "class": carModelClass,
        "combination_mpg": combinationMpg,
        "cylinders": cylinders,
        "displacement": displacement,
        "drive": drive,
        "fuel_type": fuelType,
        "highway_mpg": highwayMpg,
        "make": make,
        "model": model,
        "transmission": transmission,
        "year": year,
      };
}
