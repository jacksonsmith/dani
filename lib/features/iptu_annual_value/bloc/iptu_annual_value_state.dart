part of 'iptu_annual_value_bloc.dart';

sealed class IptuAnnualValueState extends Equatable {
  const IptuAnnualValueState();

  @override
  List<Object?> get props => [];
}

class IptuAnnualValueInitial extends IptuAnnualValueState {}

/// Estado durante a requisição à API
class IptuAnnualValueLoading extends IptuAnnualValueState {
  final double? value;

  const IptuAnnualValueLoading({this.value});

  @override
  List<Object?> get props => [value];
}

/// Estado quando o usuário está digitando (valor ainda não validado)
class IptuAnnualValueEditing extends IptuAnnualValueState {
  final double? value;

  const IptuAnnualValueEditing({this.value});

  @override
  List<Object?> get props => [value];
}

/// Estado quando o valor foi validado e está dentro do limite (<= 5000)
class IptuAnnualValueValid extends IptuAnnualValueState {
  final double value;

  const IptuAnnualValueValid({required this.value});

  @override
  List<Object?> get props => [value];
}

/// Estado quando o valor foi validado e está fora do limite ou inválido
class IptuAnnualValueInvalid extends IptuAnnualValueState {
  final String message;

  const IptuAnnualValueInvalid({required this.message});

  @override
  List<Object?> get props => [message];
}
