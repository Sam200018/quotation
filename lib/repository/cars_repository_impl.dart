import 'package:CotizApp/domain/data/cars_datasource.dart';
import 'package:CotizApp/domain/repository/CarsRepository.dart';
import 'package:CotizApp/model/car.dart';

class CarsRepositoryImpl implements CarsRepository {
  final CarsDataSource carsDataSource;

  CarsRepositoryImpl(this.carsDataSource);

  @override
  Future<List<CarModel>> getCarDataByModelAndYear(String make, int year) =>
      carsDataSource.getCarDataByModelAndYear(make, year);

  @override
  Future<CarModel> getCarDataByModelAndMakeAndYear(
          String make, String model, int year) =>
      carsDataSource.getCarDataByModelAndMakeAndYear(make, model, year);

  @override
  Future<List<CarModel>> getCarsDataByMake(String make) =>
      carsDataSource.getCarsDataByMake(make);
}
