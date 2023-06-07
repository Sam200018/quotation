import 'dart:convert';
import 'dart:io';

import 'package:CotizApp/domain/data/cars_datasource.dart';
import 'package:CotizApp/model/car.dart';
import 'package:dio/dio.dart';

const String URL = "https://api.api-ninjas.com/v1/cars";

const String API_KEY = "1CN5GZN/7NhHv3I5zgBsuw==c1W18mKOF1wjp4sk";

class CarsDataSourceImpl implements CarsDataSource {
  final Dio dio = Dio(BaseOptions(
    baseUrl: URL,
  ));

  @override
  Future<List<CarModel>> getCarDataByModelAndYear(
      String make, int year) async {
    try {
      final response = await dio.get("/",
          options: Options(headers: {"X-Api-Key": API_KEY}),
          queryParameters: {"make": make, "year": year, "limit": 50});
      final cars =
          List.from(response.data).map((e) => CarModel.fromJson(e)).toList();
      return cars;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CarModel>> getCarsDataByMake(String make) async {
    try {
      final response = await dio.get(
        "/",
        options: Options(headers: {"X-Api-Key": API_KEY}),
        queryParameters: {"make": make, "limit": 50},
      );
      var cars =
          List.from(response.data).map((e) => CarModel.fromJson(e)).toList();
      return cars;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CarModel> getCarDataByModelAndMakeAndYear(
      String make, String model, int year) async {
    try {
      final response = await dio.get("/",
          options: Options(headers: {"X-Api-Key": API_KEY}),
          queryParameters: {
            "make": make,
            "model": model,
            "year": year,
            "limit": 50
          });
      final car = CarModel.fromJson(response.data);
      return car;
    } catch (e) {
      rethrow;
    }
  }
}
