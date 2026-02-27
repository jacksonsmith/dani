part of 'iptu_status_bloc.dart';

sealed class IptuStatusEvent extends Equatable {
  const IptuStatusEvent();

  @override
  List<Object?> get props => [];
}

class IptuStatusOptionSelected extends IptuStatusEvent {
  final IptuPaymentOption option;

  const IptuStatusOptionSelected({required this.option});

  @override
  List<Object?> get props => [option];
}

class IptuStatusResetRequested extends IptuStatusEvent {}

enum IptuPaymentOption {
  pays('Sim, pago IPTU'),
  exempt('Imóvel isento'),
  includedInCondo('Incluso no condomínio');

  const IptuPaymentOption(this.label);
  final String label;
}
