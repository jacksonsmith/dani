import 'package:flutter/material.dart';

class IptuAnnualValueLoadingCard extends StatelessWidget {
  const IptuAnnualValueLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.shade50,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 16),
            Text('Validando na API...'),
          ],
        ),
      ),
    );
  }
}

class IptuAnnualValuePlaceholderCard extends StatelessWidget {
  const IptuAnnualValuePlaceholderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Informe o valor e clique em Validar',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

class IptuAnnualValueValidCard extends StatelessWidget {
  const IptuAnnualValueValidCard({required this.value, super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green.shade700),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'R\$ ${value.toStringAsFixed(2)} - '
                'Dentro do limite para reembolso!',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IptuAnnualValueInvalidCard extends StatelessWidget {
  const IptuAnnualValueInvalidCard({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.error, color: Colors.red.shade700),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.red.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
