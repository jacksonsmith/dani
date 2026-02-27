import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/iptu_validate_api_service.dart';

part 'iptu_annual_value_event.dart';
part 'iptu_annual_value_state.dart';

/// BLoC que valida o valor anual do IPTU via API.
///
/// Fluxo:
/// 1. Usuário digita -> IptuAnnualValueEditing
/// 2. Usuário clica Validar -> IptuAnnualValueLoading -> chama API
/// 3. API responde -> IptuAnnualValueValid ou IptuAnnualValueInvalid
class IptuAnnualValueBloc
    extends Bloc<IptuAnnualValueEvent, IptuAnnualValueState> {
  IptuAnnualValueBloc({required IptuValidateApiService apiService})
      : _apiService = apiService,
        super(IptuAnnualValueInitial()) {
    on<IptuAnnualValueChanged>(_onValueChanged);
    on<IptuAnnualValueValidateRequested>(_onValidateRequested);
  }

  final IptuValidateApiService _apiService;

  void _onValueChanged(
    IptuAnnualValueChanged event,
    Emitter<IptuAnnualValueState> emit,
  ) {
    emit(IptuAnnualValueEditing(value: event.value));
  }

  Future<void> _onValidateRequested(
    IptuAnnualValueValidateRequested event,
    Emitter<IptuAnnualValueState> emit,
  ) async {
    final value = event.value ??
        (state is IptuAnnualValueEditing
            ? (state as IptuAnnualValueEditing).value
            : null);

    if (value == null || value <= 0) {
      emit(const IptuAnnualValueInvalid(
        message: 'Informe um valor válido maior que zero.',
      ));
      return;
    }

    emit(IptuAnnualValueLoading(value: value));

    try {
      final result = await _apiService.validate(value);

      if (result.valid && result.value != null) {
        emit(IptuAnnualValueValid(value: result.value!));
      } else {
        emit(IptuAnnualValueInvalid(message: result.message));
      }
    } catch (_) {
      emit(const IptuAnnualValueInvalid(
        message: 'Erro ao conectar com o servidor. '
            'Verifique se o backend está rodando (npm start na pasta backend).',
      ));
    }
  }
}
