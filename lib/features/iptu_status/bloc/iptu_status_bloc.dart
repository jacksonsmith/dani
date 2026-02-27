import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'iptu_status_event.dart';
part 'iptu_status_state.dart';

/// Exemplo PRONTO - Use como referência no dojo!
///
/// Este BLoC gerencia a escolha de como o proprietário paga IPTU:
/// - Sim (paga diretamente)
/// - Isento
/// - Incluso no condomínio
class IptuStatusBloc extends Bloc<IptuStatusEvent, IptuStatusState> {
  IptuStatusBloc() : super(IptuStatusInitial()) {
    on<IptuStatusOptionSelected>(_onOptionSelected);
    on<IptuStatusResetRequested>(_onResetRequested);
  }

  void _onOptionSelected(
    IptuStatusOptionSelected event,
    Emitter<IptuStatusState> emit,
  ) {
    emit(IptuStatusSelected(option: event.option));
  }

  void _onResetRequested(
    IptuStatusResetRequested event,
    Emitter<IptuStatusState> emit,
  ) {
    emit(IptuStatusInitial());
  }
}
