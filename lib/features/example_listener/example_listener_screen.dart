import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../iptu_status/bloc/iptu_status_bloc.dart';
import '../iptu_status/screens/widgets/iptu_status_option_chips.dart';
import '../iptu_status/screens/widgets/iptu_status_result_card.dart';

/// Exemplo de treino: BlocListener
///
/// BlocListener reage a mudanças de estado para **efeitos colaterais**:
/// SnackBar, navegação, diálogos, etc.
/// NÃO reconstrói a árvore de widgets — use BlocBuilder para UI.
class ExampleListenerScreen extends StatelessWidget {
  const ExampleListenerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IptuStatusBloc(),
      child: BlocListener<IptuStatusBloc, IptuStatusState>(
        listenWhen: (previous, current) =>
            current is IptuStatusSelected || current is IptuStatusInitial,
        listener: (context, state) {
          if (state is IptuStatusSelected) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Opção selecionada: ${state.option.label}'),
                backgroundColor: Colors.teal.shade700,
              ),
            );
          }
          if (state is IptuStatusInitial) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Seleção limpa'),
                backgroundColor: Colors.grey,
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Exemplo: BlocListener'),
            backgroundColor: Colors.purple.shade700,
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'BlocListener: efeitos colaterais (SnackBar) ao mudar estado',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Você paga IPTU desse imóvel?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                const IptuStatusOptionChips(),
                const SizedBox(height: 32),
                const IptuStatusResultCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
