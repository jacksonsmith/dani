part of 'iptu_status_bloc.dart';

sealed class IptuStatusState extends Equatable {
  const IptuStatusState();

  @override
  List<Object?> get props => [];
}

class IptuStatusInitial extends IptuStatusState {}

class IptuStatusSelected extends IptuStatusState {
  final IptuPaymentOption option;

  const IptuStatusSelected({required this.option});

  @override
  List<Object?> get props => [option];
}
