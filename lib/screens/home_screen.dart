import 'package:flutter/material.dart';

import 'widgets/nav_card.dart';
import '../features/iptu_annual_value/screens/iptu_annual_value_screen.dart';
import '../features/iptu_annual_value_dojo/screens/iptu_annual_value_dojo_screen.dart';
import '../features/iptu_status/screens/iptu_status_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IPTU BLoC Dojo'),
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Escolha uma tela para explorar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 32),
                NavCard(
                  title: 'Exemplo 1: Status do IPTU',
                  subtitle: 'IptuStatusBloc - eventos e estados simples',
                  icon: Icons.check_circle,
                  color: Colors.teal,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const IptuStatusScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                NavCard(
                  title: 'Exemplo 2: Valor com API',
                  subtitle: 'IptuAnnualValueBloc - requisição HTTP completa',
                  icon: Icons.api,
                  color: Colors.blue,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => IptuAnnualValueScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                NavCard(
                  title: 'Dojo - Implementar juntos',
                  subtitle: 'IptuAnnualValueDojoBloc - ~1h com TODOs',
                  icon: Icons.build,
                  color: Colors.orange,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => IptuAnnualValueDojoScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
