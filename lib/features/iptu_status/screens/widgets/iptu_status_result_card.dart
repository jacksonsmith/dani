import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/iptu_status_bloc.dart';

class IptuStatusResultCard extends StatelessWidget {
  const IptuStatusResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IptuStatusBloc, IptuStatusState>(
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
            color: Colors.teal.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Opção selecionada: ${state.option.label}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getDescription(state.option),
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      context.read<IptuStatusBloc>().add(
                            IptuStatusResetRequested(),
                          );
                    },
                    child: const Text('Limpar seleção'),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  String _getDescription(IptuPaymentOption option) {
    return switch (option) {
      IptuPaymentOption.pays =>
        'Você precisará informar o valor anual e enviar os boletos.',
      IptuPaymentOption.exempt =>
        'Não será necessário enviar documentação de IPTU.',
      IptuPaymentOption.includedInCondo =>
        'O IPTU está incluso na taxa de condomínio.',
    };
  }
}
