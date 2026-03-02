import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iptu_bloc_dojo/features/iptu_status/bloc/iptu_status_bloc.dart';
import 'package:iptu_bloc_dojo/features/iptu_status/screens/widgets/iptu_status_result_card.dart';
import 'package:mocktail/mocktail.dart';

class _MockIptuStatusBloc extends MockBloc<IptuStatusEvent, IptuStatusState>
    implements IptuStatusBloc {}

/// DOJO DE TESTES - IptuStatusResultCard (Widget)
///
/// Implemente os testes abaixo usando whenListen e BlocProvider.value.
/// O mock do bloc deve ser configurado com whenListen para simular estados.
///
/// Referência: bloc_and_widget_tests.mdc
void main() {
  group('IptuStatusResultCard', () {
    late _MockIptuStatusBloc mockBloc;

    setUp(() {
      mockBloc = _MockIptuStatusBloc();
    });

    tearDown(() {
      mockBloc.close();
    });

    testWidgets(
      'displays "Selecione uma opção acima" when state is IptuStatusInitial',
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

        expect(find.text('Selecione uma opção acima'), findsOneWidget);
      },
    );

    // TODO: Implementar teste para IptuStatusSelected
    // Quando o state é IptuStatusSelected(option: IptuPaymentOption.pays),
    // o card deve exibir "Opção selecionada: Sim, pago IPTU"
    // e o botão "Limpar seleção".
    testWidgets(
      'displays selected option and "Limpar seleção" button when state is '
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

        expect(find.text('Opção selecionada: Sim, pago IPTU'), findsOneWidget);
        expect(find.text('Limpar seleção'), findsOneWidget);
      },
    );

    // TODO: Implementar teste que verifica o evento disparado
    // Ao tocar no botão "Limpar seleção", o bloc deve receber
    // IptuStatusResetRequested. Use verify(() => mockBloc.add(any())).called(1)
    // Dica: será necessário registerFallbackValue para IptuStatusResetRequested
    testWidgets(
      'dispatches IptuStatusResetRequested when "Limpar seleção" is tapped',
      (tester) async {
        registerFallbackValue(IptuStatusResetRequested());

        whenListen(
          mockBloc,
          Stream.value(
            const IptuStatusSelected(option: IptuPaymentOption.exempt),
          ),
          initialState: const IptuStatusSelected(option: IptuPaymentOption.exempt),
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

        await tester.tap(find.text('Limpar seleção'));
        await tester.pump();

        verify(() => mockBloc.add(any())).called(1);
      },
    );
  });
}
