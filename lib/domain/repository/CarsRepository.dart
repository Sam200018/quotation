import 'package:CotizApp/model/car.dart';

abstract class CarsRepository{
  Future<List<CarModel>> getCarsDataByMake(String make);
  Future<List<CarModel>> getCarDataByMakeAndYear(String make, String year);
  Future<CarModel>  getCarDataByModelAndMakeAndYear(String make, String model, int year);
}