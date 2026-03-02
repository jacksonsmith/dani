import 'package:flutter/material.dart';

/// Tela do Dojo de Testes - IptuStatusBloc
///
/// Implemente os testes em:
/// - test/iptu_status_dojo/iptu_status_bloc_dojo_test.dart
/// - test/iptu_status_dojo/iptu_status_result_card_dojo_test.dart
///
/// Rode: flutter test test/iptu_status_dojo/
class IptuStatusTestDojoScreen extends StatelessWidget {
  const IptuStatusTestDojoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dojo de Testes: IptuStatus'),
        backgroundColor: Colors.indigo.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Objetivo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Implementar testes para IptuStatusBloc e IptuStatusResultCard '
              'usando bloc_test e mocktail.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Text(
              'Arquivos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _FileCard(
              path: 'test/iptu_status_dojo/iptu_status_bloc_dojo_test.dart',
              description: 'blocTest para IptuStatusOptionSelected, '
                  'IptuStatusResetRequested e fluxo completo',
            ),
            const SizedBox(height: 12),
            _FileCard(
              path: 'test/iptu_status_dojo/iptu_status_result_card_dojo_test.dart',
              description: 'Widget tests com whenListen, BlocProvider.value '
                  'e verify para eventos',
            ),
            const SizedBox(height: 12),
            _FileCard(
              path: 'test/iptu_status_dojo/iptu_status_result_card_semantics_dojo_test.dart',
              description: 'Widget tests com simulatedAccessibilityTraversal '
                  '(Accessibility testing)',
            ),
            const SizedBox(height: 24),
            const Text(
              'Comandos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const SelectableText(
                'flutter test test/iptu_status_dojo/',
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Referência',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '• bloc_and_widget_tests.mdc\n'
              '• bloc_test: blocTest, whenListen\n'
              '• mocktail: Mock, verify, registerFallbackValue\n'
              '• docs/tipos_de_teste.md — nomes oficiais (Unit, Widget, Semantics)',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class _FileCard extends StatelessWidget {
  const _FileCard({
    required this.path,
    required this.description,
  });

  final String path;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              path,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
                color: Colors.indigo.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
