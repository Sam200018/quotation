import 'dart:async';

import 'package:CotizApp/model/car.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'forms_event.dart';

part 'forms_state.dart';

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  final make = TextEditingController();
  final name = TextEditingController();
  final lastName = TextEditingController();
  final birthday = TextEditingController();
  final cover = TextEditingController();
  final paymentType = TextEditingController();
  final marital = TextEditingController();
  final city = TextEditingController();
  final carState = TextEditingController();
  CarModel car = CarModel.empty();

  FormsBloc() : super(FormsState.initial()) {
    on<ChangedMake>(changedMakeToState);
  }

  void changedMakeToState(ChangedMake event, Emitter<FormsState> emit) {
    make.text = event.make;
  }
}
