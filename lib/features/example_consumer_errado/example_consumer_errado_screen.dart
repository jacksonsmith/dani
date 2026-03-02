import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../iptu_status/bloc/iptu_status_bloc.dart';
import '../iptu_status/screens/widgets/iptu_status_option_chips.dart';

/// Exemplo de treino: BlocConsumer usado ERRADO (anti-pattern)
///
/// ERRO: Usar o listener para "atualizar UI" via setState.
/// O listener é para efeitos colaterais (SnackBar, navegação).
/// A UI deve vir do **builder** lendo o state diretamente.
///
/// Neste exemplo, o builder ignora o state e usa uma variável
/// atualizada no listener — isso quebra a reatividade do BLoC.
class ExampleConsumerErradoScreen extends StatefulWidget {
  const ExampleConsumerErradoScreen({super.key});

  @override
  State<ExampleConsumerErradoScreen> createState() =>
      _ExampleConsumerErradoScreenState();
}

class _ExampleConsumerErradoScreenState extends State<ExampleConsumerErradoScreen> {
  /// Anti-pattern: variável local que deveria vir do state
  IptuPaymentOption? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IptuStatusBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exemplo: BlocConsumer (errado)'),
          backgroundColor: Colors.red.shade700,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Anti-pattern: listener atualiza setState, builder ignora o state',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.red.shade800,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Você paga IPTU desse imóvel?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const IptuStatusOptionChips(),
              const SizedBox(height: 32),
              BlocConsumer<IptuStatusBloc, IptuStatusState>(
                listener: (context, state) {
                  // ERRADO: Atualizar UI via setState no listener
                  // O listener deve ser para side effects (SnackBar, etc.)
                  if (state is IptuStatusSelected) {
                    setState(() => _selectedOption = state.option);
                  } else if (state is IptuStatusInitial) {
                    setState(() => _selectedOption = null);
                  }
                },
                builder: (context, state) {
                  // ERRADO: Builder ignora o state e usa variável do listener
                  // O builder deveria ler state diretamente
                  return Card(
                    color: Colors.red.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _selectedOption?.label ?? 'Selecione uma opção',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          if (_selectedOption != null) ...[
                            const SizedBox(height: 16),
                            OutlinedButton(
                              onPressed: () {
                                context.read<IptuStatusBloc>().add(
                                      IptuStatusResetRequested(),
                                    );
                              },
                              child: const Text('Limpar'),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
