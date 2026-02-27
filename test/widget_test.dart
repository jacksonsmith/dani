import 'package:flutter_test/flutter_test.dart';

import 'package:iptu_bloc_dojo/main.dart';

void main() {
  testWidgets('App loads and shows dojo home', (WidgetTester tester) async {
    await tester.pumpWidget(const IptuDojoApp());

    expect(find.text('IPTU BLoC Dojo'), findsOneWidget);
    expect(find.text('Escolha uma tela para explorar'), findsOneWidget);
    expect(find.text('Exemplo 1: Status do IPTU'), findsOneWidget);
    expect(find.text('Exemplo 2: Valor com API'), findsOneWidget);
    expect(find.text('Dojo - Implementar juntos'), findsOneWidget);
  });
}
