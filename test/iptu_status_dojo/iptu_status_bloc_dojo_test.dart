import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iptu_bloc_dojo/features/iptu_status/bloc/iptu_status_bloc.dart';

/// DOJO DE TESTES - IptuStatusBloc
///
/// Implemente os testes abaixo usando bloc_test.
/// Use o IptuStatusBloc (sem dependências) e blocTest.
///
/// Referência: bloc_and_widget_tests.mdc
void main() {
  group('IptuStatusBloc', () {
    blocTest<IptuStatusBloc, IptuStatusState>(
      'emits [IptuStatusSelected] when IptuStatusOptionSelected is added',
      build: () => IptuStatusBloc(),
      act: (bloc) => bloc.add(
        const IptuStatusOptionSelected(option: IptuPaymentOption.pays),
      ),
      expect: () => <IptuStatusState>[
        const IptuStatusSelected(option: IptuPaymentOption.pays),
      ],
    );

    // TODO: Implementar teste para IptuStatusResetRequested
    // Quando o evento IptuStatusResetRequested é adicionado,
    // o bloc deve emitir IptuStatusInitial.
    // Dica: use seed para começar com IptuStatusSelected.
    blocTest<IptuStatusBloc, IptuStatusState>(
      'emits [IptuStatusInitial] when IptuStatusResetRequested is added',
      build: () => IptuStatusBloc(),
      seed: () => const IptuStatusSelected(option: IptuPaymentOption.exempt),
      act: (bloc) => bloc.add(IptuStatusResetRequested()),
      expect: () => <IptuStatusState>[
        IptuStatusInitial(),
      ],
    );

    // TODO: Implementar teste para fluxo completo
    // Quando o usuário seleciona "Incluso no condomínio" e depois
    // escolhe "Sim, pago IPTU", o bloc deve emitir os dois estados
    // em sequência.
    blocTest<IptuStatusBloc, IptuStatusState>(
      'emits [IptuStatusSelected(includedInCondo), IptuStatusSelected(pays)] '
      'when user selects includedInCondo then pays',
      build: () => IptuStatusBloc(),
      act: (bloc) {
        bloc.add(
          const IptuStatusOptionSelected(
            option: IptuPaymentOption.includedInCondo,
          ),
        );
        bloc.add(
          const IptuStatusOptionSelected(option: IptuPaymentOption.pays),
        );
      },
      expect: () => <IptuStatusState>[
        const IptuStatusSelected(option: IptuPaymentOption.includedInCondo),
        const IptuStatusSelected(option: IptuPaymentOption.pays),
      ],
    );
  });
}
