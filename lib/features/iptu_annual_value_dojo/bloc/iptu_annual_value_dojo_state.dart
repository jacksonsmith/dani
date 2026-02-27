part of 'iptu_annual_value_dojo_bloc.dart';

sealed class IptuAnnualValueDojoState extends Equatable {
  const IptuAnnualValueDojoState();

  @override
  List<Object?> get props => [];
}

class IptuAnnualValueDojoInitial extends IptuAnnualValueDojoState {}

class IptuAnnualValueDojoLoading extends IptuAnnualValueDojoState {
  final double? value;

  const IptuAnnualValueDojoLoading({this.value});

  @override
  List<Object?> get props => [value];
}

class IptuAnnualValueDojoEditing extends IptuAnnualValueDojoState {
  final double? value;

  const IptuAnnualValueDojoEditing({this.value});

  @override
  List<Object?> get props => [value];
}

class IptuAnnualValueDojoValid extends IptuAnnualValueDojoState {
  final double value;

  const IptuAnnualValueDojoValid({required this.value});

  @override
  List<Object?> get props => [value];
}

class IptuAnnualValueDojoInvalid extends IptuAnnualValueDojoState {
  final String message;

  const IptuAnnualValueDojoInvalid({required this.message});

  @override
  List<Object?> get props => [message];
}
