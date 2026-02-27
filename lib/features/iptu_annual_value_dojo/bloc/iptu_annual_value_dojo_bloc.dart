import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../iptu_annual_value/data/iptu_validate_api_service.dart';

part 'iptu_annual_value_dojo_event.dart';
part 'iptu_annual_value_dojo_state.dart';

/// DOJO - Implemente junto em ~1h!
///
/// Este BLoC deve validar o valor anual do IPTU via API.
/// Use o IptuAnnualValueBloc (tela "Exemplo com API") como referência.
///
/// Fluxo esperado:
/// 1. _onValueChanged: armazenar o valor em IptuAnnualValueDojoEditing
/// 2. _onValidateRequested:
///    - Se valor null ou <= 0: emitir IptuAnnualValueDojoInvalid
///    - Emitir IptuAnnualValueDojoLoading
///    - Chamar _apiService.validate(value)
///    - Se result.valid: emitir IptuAnnualValueDojoValid
///    - Senão: emitir IptuAnnualValueDojoInvalid
///    - Em catch: emitir IptuAnnualValueDojoInvalid com mensagem de erro
class IptuAnnualValueDojoBloc
    extends Bloc<IptuAnnualValueDojoEvent, IptuAnnualValueDojoState> {
  IptuAnnualValueDojoBloc({required IptuValidateApiService apiService})
      : _apiService = apiService,
        super(IptuAnnualValueDojoInitial()) {
    on<IptuAnnualValueDojoChanged>(_onValueChanged);
    on<IptuAnnualValueDojoValidateRequested>(_onValidateRequested);
  }

  // ignore: unused_field - usado ao implementar _onValidateRequested
  final IptuValidateApiService _apiService;

  void _onValueChanged(
    IptuAnnualValueDojoChanged event,
    Emitter<IptuAnnualValueDojoState> emit,
  ) {
    // TODO: Emitir IptuAnnualValueDojoEditing(value: event.value)
    emit(IptuAnnualValueDojoInitial());
  }

  Future<void> _onValidateRequested(
    IptuAnnualValueDojoValidateRequested event,
    Emitter<IptuAnnualValueDojoState> emit,
  ) async {
    // TODO: Implementar
    // 1. Obter o valor: event.value ?? (state as IptuAnnualValueDojoEditing?)?.value
    // 2. Se null ou <= 0: emit(IptuAnnualValueDojoInvalid(message: '...'))
    // 3. emit(IptuAnnualValueDojoLoading(value: value))
    // 4. try { final result = await _apiService.validate(value); ... }
    // 5. catch { emit(IptuAnnualValueDojoInvalid(message: 'Erro ao conectar...')) }
    emit(IptuAnnualValueDojoInitial());
  }
}
