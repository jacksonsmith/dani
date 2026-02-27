import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/iptu_status_bloc.dart';
import 'widgets/iptu_status_option_chips.dart';
import 'widgets/iptu_status_result_card.dart';

/// Tela do exemplo PRONTO - IptuStatusBloc
class IptuStatusScreen extends StatelessWidget {
  const IptuStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IptuStatusBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exemplo: Status do IPTU'),
          backgroundColor: Colors.teal.shade700,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
    );
  }
}
