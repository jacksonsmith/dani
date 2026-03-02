import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../iptu_status/bloc/iptu_status_bloc.dart';
import '../iptu_status/screens/widgets/iptu_status_option_chips.dart';

/// Exemplo de treino: BlocConsumer usado CORRETAMENTE
///
/// BlocConsumer = BlocBuilder + BlocListener em um widget.
/// - **builder**: reconstrói a UI com base no estado
/// - **listener**: efeitos colaterais (SnackBar, navegação, etc.)
/// Use listenWhen/buildWhen para evitar chamadas desnecessárias.
class ExampleConsumerCertoScreen extends StatelessWidget {
  const ExampleConsumerCertoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IptuStatusBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exemplo: BlocConsumer (correto)'),
          backgroundColor: Colors.green.shade700,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'BlocConsumer: builder para UI + listener para side effects',
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
              BlocConsumer<IptuStatusBloc, IptuStatusState>(
                listenWhen: (previous, current) =>
                    current is IptuStatusSelected || current is IptuStatusInitial,
                listener: (context, state) {
                  if (state is IptuStatusSelected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Salvo: ${state.option.label}'),
                        backgroundColor: Colors.green.shade700,
                      ),
                    );
                  }
                },
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  if (state is IptuStatusInitial) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Selecione uma opção acima',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    );
                  }
                  if (state is IptuStatusSelected) {
                    return Card(
                      color: Colors.green.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Opção: ${state.option.label}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
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
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
