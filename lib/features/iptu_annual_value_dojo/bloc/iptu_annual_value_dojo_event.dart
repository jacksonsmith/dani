part of 'iptu_annual_value_dojo_bloc.dart';

sealed class IptuAnnualValueDojoEvent extends Equatable {
  const IptuAnnualValueDojoEvent();

  @override
  List<Object?> get props => [];
}

class IptuAnnualValueDojoChanged extends IptuAnnualValueDojoEvent {
  final double? value;

  const IptuAnnualValueDojoChanged({this.value});

  @override
  List<Object?> get props => [value];
}

class IptuAnnualValueDojoValidateRequested extends IptuAnnualValueDojoEvent {
  final double? value;

  const IptuAnnualValueDojoValidateRequested({this.value});

  @override
  List<Object?> get props => [value];
}
