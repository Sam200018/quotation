import 'package:CotizApp/model/car.dart';

abstract class CarsDataSource{
  Future<List<CarModel>> getCarsDataByMake(String make);
  Future<List<CarModel>> getCarDataByModelAndMake(String make, String model);
  Future<CarModel> getCarDataByModelAndMakeAndYear(String make, String model, int year);
}