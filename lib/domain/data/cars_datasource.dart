import 'package:CotizApp/model/car.dart';

abstract class CarsDataSource{
  Future<List<CarModel>> getCarsDataByMake(String make);
  Future<List<CarModel>> getCarDataByMakeAndYear(String make, String year);
  Future<CarModel> getCarDataByModelAndMakeAndYear(String make, String model, int year);
}