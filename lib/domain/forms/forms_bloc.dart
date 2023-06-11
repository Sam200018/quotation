import 'dart:async';

import 'package:CotizApp/domain/repository/CarsRepository.dart';
import 'package:CotizApp/model/car.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'forms_event.dart';

part 'forms_state.dart';

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  final CarsRepository carsRepository;

  final name = TextEditingController();
  final lastName = TextEditingController();
  final birthday = TextEditingController();
  final cover = TextEditingController();
  final paymentType = TextEditingController();
  final marital = TextEditingController();
  final city = TextEditingController();
  final insuranceType = TextEditingController();
  final insuranceType2 = TextEditingController();
  final insuranceType3 = TextEditingController();
  final carState = TextEditingController();
  CarModel car = CarModel.empty();

  FormsBloc(this.carsRepository) : super(FormsState.initial()) {
    on<ChangedMake>(changedMakeToState);
    on<ChangedYear>(changedYearToState);
    on<ChangedModel>(changedModelToState);
    on<ChangedInsuranceType>(changedInsuranceTypeToState);
    on<ChangedInsuranceType2>(changedInsuranceType2ToState);
    on<ChangedInsuranceType3>(changedInsuranceType3ToState);
  }

  Future<void> changedMakeToState(
      ChangedMake event, Emitter<FormsState> emit) async {
    final yearCarsData = await carsRepository.getCarsDataByMake(event.make);
    final data = yearCarsData.map((e) => e.year.toString()).toSet().toList();
    emit(state.update(make: event.make, yearCars: data));
  }

  Future<void> changedYearToState(
      ChangedYear event, Emitter<FormsState> emit) async {
    final modelCarsData =
        await carsRepository.getCarDataByMakeAndYear(state.make, event.year);
    final data = modelCarsData.map((e) => e.model).toSet().toList();

    emit(state.update(year: event.year, modelCars: data));
  }

  void changedModelToState(ChangedModel event, Emitter<FormsState> emit) {
    emit(state.update(model: event.model));
  }
  void changedInsuranceTypeToState(
      ChangedInsuranceType event, Emitter<FormsState> emit) {
    final updatedState = state.update(insuranceType: event.insuranceType);
    emit(updatedState);
  }

  void changedInsuranceType2ToState(
      ChangedInsuranceType2 event, Emitter<FormsState> emit) {
    final updatedState = state.update(insuranceType2: event.insuranceType2);
    emit(updatedState);
  }

  void changedInsuranceType3ToState(
      ChangedInsuranceType3 event, Emitter<FormsState> emit) {
    final updatedState = state.update(insuranceType3: event.insuranceType3);
    emit(updatedState);
  }

}
