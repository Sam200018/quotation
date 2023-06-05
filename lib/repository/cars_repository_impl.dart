import 'package:CotizApp/domain/data/cars_datasource.dart';
import 'package:CotizApp/domain/repository/CarsRepository.dart';
import 'package:CotizApp/model/car.dart';

class CarsRepositoryImpl implements CarsRepository {
  final CarsDataSource carsDataSource;

  CarsRepositoryImpl(this.carsDataSource);

  @override
  Future<List<CarModel>> getCarDataByModelAndMake(String make, String model) =>
      getCarDataByModelAndMake(make, model);

  @override
  Future<CarModel> getCarDataByModelAndMakeAndYear(
          String make, String model, int year) =>
      getCarDataByModelAndMakeAndYear(make, model, year);

  @override
  Future<List<CarModel>> getCarsDataByMake(String make) =>
      getCarsDataByMake(make);
}
