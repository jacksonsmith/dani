part of 'iptu_annual_value_bloc.dart';

sealed class IptuAnnualValueEvent extends Equatable {
  const IptuAnnualValueEvent();

  @override
  List<Object?> get props => [];
}

class IptuAnnualValueChanged extends IptuAnnualValueEvent {
  final double? value;

  const IptuAnnualValueChanged({this.value});

  @override
  List<Object?> get props => [value];
}

class IptuAnnualValueValidateRequested extends IptuAnnualValueEvent {
  final double? value;

  const IptuAnnualValueValidateRequested({this.value});

  @override
  List<Object?> get props => [value];
}
