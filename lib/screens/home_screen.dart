import 'package:flutter/material.dart';

import 'widgets/nav_card.dart';
import '../features/example_consumer_certo/example_consumer_certo_screen.dart';
import '../features/example_consumer_errado/example_consumer_errado_screen.dart';
import '../features/example_listener/example_listener_screen.dart';
import '../features/iptu_annual_value/screens/iptu_annual_value_screen.dart';
import '../features/iptu_annual_value_dojo/screens/iptu_annual_value_dojo_screen.dart';
import '../features/iptu_status/screens/iptu_status_screen.dart';
import '../features/iptu_status_test_dojo/iptu_status_test_dojo_screen.dart';

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
                const SizedBox(height: 16),
                NavCard(
                  title: 'Dojo de Testes',
                  subtitle: 'IptuStatusBloc - bloc_test + mocktail',
                  icon: Icons.bug_report,
                  color: Colors.indigo,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const IptuStatusTestDojoScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                NavCard(
                  title: 'Treino: BlocListener',
                  subtitle: 'Efeitos colaterais (SnackBar) sem rebuild',
                  icon: Icons.hearing,
                  color: Colors.purple,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ExampleListenerScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                NavCard(
                  title: 'Treino: BlocConsumer (correto)',
                  subtitle: 'Builder para UI + listener para side effects',
                  icon: Icons.check_circle_outline,
                  color: Colors.green,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ExampleConsumerCertoScreen(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                NavCard(
                  title: 'Treino: BlocConsumer (errado)',
                  subtitle: 'Anti-pattern: setState no listener',
                  icon: Icons.warning_amber,
                  color: Colors.red,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ExampleConsumerErradoScreen(),
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
