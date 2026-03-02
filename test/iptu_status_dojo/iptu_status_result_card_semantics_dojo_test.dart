import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iptu_bloc_dojo/features/iptu_status/bloc/iptu_status_bloc.dart';
import 'package:iptu_bloc_dojo/features/iptu_status/screens/widgets/iptu_status_result_card.dart';

class _MockIptuStatusBloc extends MockBloc<IptuStatusEvent, IptuStatusState>
    implements IptuStatusBloc {}

/// DOJO DE TESTES - IptuStatusResultCard (Widget + Semantics)
///
/// Widget tests usando simulatedAccessibilityTraversal.
/// Valida conteúdo E acessibilidade via árvore de semântica.
/// Ref: bloc_and_widget_tests.mdc, Flutter Accessibility testing
void main() {
  group('IptuStatusResultCard (semantics)', () {
    late _MockIptuStatusBloc mockBloc;

    setUp(() {
      mockBloc = _MockIptuStatusBloc();
    });

    tearDown(() {
      mockBloc.close();
    });

    testWidgets(
      'semantics: displays "Selecione uma opção acima" when IptuStatusInitial',
      (tester) async {
        whenListen(
          mockBloc,
          Stream.value(IptuStatusInitial()),
          initialState: IptuStatusInitial(),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<IptuStatusBloc>.value(
                value: mockBloc,
                child: const IptuStatusResultCard(),
              ),
            ),
          ),
        );

        final handle = tester.ensureSemantics();
        expect(
          tester.semantics.simulatedAccessibilityTraversal(),
          contains(containsSemantics(label: 'Selecione uma opção acima')),
        );
        handle.dispose();
      },
    );

    testWidgets(
      'semantics: displays option label and "Limpar seleção" when '
      'IptuStatusSelected',
      (tester) async {
        whenListen(
          mockBloc,
          Stream.value(
            const IptuStatusSelected(option: IptuPaymentOption.pays),
          ),
          initialState: const IptuStatusSelected(option: IptuPaymentOption.pays),
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider<IptuStatusBloc>.value(
                value: mockBloc,
                child: const IptuStatusResultCard(),
              ),
            ),
          ),
        );

        final handle = tester.ensureSemantics();
        // Flutter mergeia Text filhos em um único nó de semântica
        expect(
          tester.semantics.simulatedAccessibilityTraversal(),
          containsAll([
            containsSemantics(
              label:
                  'Opção selecionada: Sim, pago IPTU\n'
                  'Você precisará informar o valor anual e enviar os boletos.',
            ),
            containsSemantics(label: 'Limpar seleção', isButton: true),
          ]),
        );
        handle.dispose();
      },
    );
  });
}
