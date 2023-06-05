import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'forms_event.dart';
part 'forms_state.dart';

class FormsBloc extends Bloc<FormsEvent, FormsState> {
  FormsBloc() : super(FormsInitial()) {
    on<FormsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
