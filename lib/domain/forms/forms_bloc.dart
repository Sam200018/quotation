import 'dart:async';
import 'package:CotizApp/domain/repository/CarsRepository.dart';
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
  final marital = TextEditingController();

  FormsBloc(this.carsRepository) : super(FormsState.initial()) {
    on<ChangedMake>(changedMakeToState);
    on<ChangedYear>(changedYearToState);
    on<ChangedModel>(changedModelToState);
    on<ChangedVersion>(changedVersionToState);
    on<ChangedCarState>(changedCarStateToState);
    on<ChangedMaritalStatus>(changedMaritalStatusToState);
    on<ChangedCity>(changedCityToState);
    on<ChangedInsurance>(changedInsuranceToState);
    on<ChangedPaymentType>(changedPaymentTypeToState);
    on<Next>(nextToState);
    on<Previous>(previousToState);
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

  Future<void> changedVersionToState(
      ChangedVersion event, Emitter<FormsState> emit) async {
    emit(state.update(version: event.version));
  }

  Future<void> changedCarStateToState(
      ChangedCarState event, Emitter<FormsState> emit) async {
    emit(state.update(carState: event.carState));
  }

  void nextToState(Next event, Emitter<FormsState> emit) {
    emit(state.update(screen: state.screen + 1));
  }

  void previousToState(Previous event, Emitter<FormsState> emit) {
    emit(state.update(screen: state.screen - 1));
  }

  void changedMaritalStatusToState(
      ChangedMaritalStatus event, Emitter<FormsState> emit) {
    emit(state.update(maritalStatus: event.maritalStatus));
  }

  void changedCityToState(ChangedCity event, Emitter<FormsState> emit) {
    emit(state.update(city: event.city));
  }

  void changedInsuranceToState(
      ChangedInsurance event, Emitter<FormsState> emit) {
    emit(state.update(insurance: event.insurance));
  }

  void changedPaymentTypeToState(
      ChangedPaymentType event, Emitter<FormsState> emit) {
    emit(state.update(paymentType: event.paymentType));
    // TODO: hacer todo el calculo aca
  }
}
