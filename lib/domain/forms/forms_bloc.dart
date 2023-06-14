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
    emit(state.update(isLoading: true));
    try {
      final yearCarsData = await carsRepository.getCarsDataByMake(event.make);
      final data = yearCarsData.map((e) => e.year.toString()).toSet().toList();
      emit(state.update(make: event.make, yearCars: data));
    } catch (e) {
      emit(state.update(isError: true));
    }
  }

  Future<void> changedYearToState(
      ChangedYear event, Emitter<FormsState> emit) async {
    emit(state.update(isLoading: true));
    try {
      final modelCarsData =
          await carsRepository.getCarDataByMakeAndYear(state.make, event.year);
      final data = modelCarsData.map((e) => e.model).toSet().toList();

      emit(state.update(year: event.year, modelCars: data));
    } catch (e) {
      emit(state.update(isError: true));
    }
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
    emit(state.update(paymentType: event.paymentType, price: 0.0));
    const basePrice = 8000;
    var result = 0.0;
    if (DateTime.now().year - int.parse(state.year) < 5) {
      result = (basePrice + basePrice * .10);
    } else {
      result = (basePrice + basePrice * .20);
    }
    switch (state.version) {
      case "Basica":
        {
          result += basePrice * .10;
        }
        break;
      case "Equipada":
        {
          result += basePrice * .20;
        }
        break;
      case "Super equipada":
        {
          result += basePrice * .30;
        }
        break;
    }

    switch (state.carState) {
      case "Nuevo":
        {
          result += basePrice * .10;
        }
        break;
      case "Semi-Nuevo":
        {
          result += basePrice * .20;
        }
        break;
      case "Usado":
        {
          result += basePrice * .30;
        }
        break;
    }

    switch (state.maritalStatus) {
      case "Soltero(a)":
        {
          result += basePrice * .10;
        }
        break;
      case "Casado(a)":
        {
          result += basePrice * .30;
        }
        break;
      case "Divorciado(a)":
        {
          result += basePrice * .20;
        }
        break;
    }
    switch (state.paymentType) {
      case "mensual":
        {
          result += basePrice * .20;
        }
        break;
      case "semestral":
        {
          result += basePrice * .05;
        }
        break;
      case "anual":
        {
          result -= basePrice * .20;
        }
        break;
    }
    switch (state.insurance) {
      case 1:
        {
          result += basePrice * .10;
        }
        break;
      case 2:
        {
          result += basePrice * .30;
        }
        break;
      case 3:
        {
          result += basePrice * .20;
        }
        break;
    }

    emit(state.update(paymentType: event.paymentType, price: result));
    // TODO: hacer todo el calculo aca
  }
}
