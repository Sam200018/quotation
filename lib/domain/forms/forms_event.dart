part of 'forms_bloc.dart';

abstract class FormsEvent extends Equatable {
  const FormsEvent();

  @override
  List<Object?> get props => [];
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

class ChangedInsuranceType extends FormsEvent {
  final String insuranceType;

  const ChangedInsuranceType(this.insuranceType);

  @override
  List<Object?> get props => [insuranceType];
}

class ChangedInsuranceType2 extends FormsEvent {
  final String insuranceType2;

  const ChangedInsuranceType2(this.insuranceType2);

  @override
  List<Object?> get props => [insuranceType2];
}

class ChangedInsuranceType3 extends FormsEvent {
  final String insuranceType3;

  const ChangedInsuranceType3(this.insuranceType3);

  @override
  List<Object?> get props => [insuranceType3];
}
