import 'package:flutter/material.dart';

class IptuAnnualValueFormHeader extends StatelessWidget {
  const IptuAnnualValueFormHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Valor total anual do IPTU (sem desconto)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        const Text(
          'Limite para reembolso: R\$ 5.000,00',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
