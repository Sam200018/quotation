part of 'forms_bloc.dart';

abstract class FormsEvent extends Equatable {
  const FormsEvent();
}

class ChangedMake extends FormsEvent {
  final String make;

  const ChangedMake(this.make);

  @override
  List<Object?> get props => [make];
}

class ChangedModel extends FormsEvent {
  final String model;

  const ChangedModel(this.model);

  @override
  List<Object?> get props => [model];
}

class ChangedYear extends FormsEvent {
  final String year;

  const ChangedYear(this.year);

  @override
  List<Object?> get props => [year];
}

class ChangedVersion extends FormsEvent {
  final String version;

  const ChangedVersion(this.version);

  @override
  List<Object?> get props => [version];
}

class ChangedCarState extends FormsEvent {
  final String carState;

  const ChangedCarState(this.carState);

  @override
  List<Object?> get props => [carState];
}

class Next extends FormsEvent {
  @override
  List<Object?> get props => [];
}

class Previous extends FormsEvent {
  @override
  List<Object?> get props => [];
}
