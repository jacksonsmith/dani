import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/iptu_annual_value_bloc.dart';
import '../data/iptu_validate_api_service.dart';
import 'widgets/iptu_annual_value_form_header.dart';
import 'widgets/iptu_annual_value_result_card.dart';
import 'widgets/iptu_annual_value_validate_button.dart';

/// Tela do Exemplo 2 - IptuAnnualValueBloc
///
/// Valida o valor do IPTU via API mockada (backend Node.js).
/// Inicie o backend com: cd backend && npm start
class IptuAnnualValueScreen extends StatelessWidget {
  IptuAnnualValueScreen({
    super.key,
    IptuValidateApiService? apiService,
  }) : _apiService = apiService ?? IptuValidateApiService();

  final IptuValidateApiService _apiService;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IptuAnnualValueBloc(apiService: _apiService),
      child: const _IptuAnnualValueView(),
    );
  }
}

class _IptuAnnualValueView extends StatefulWidget {
  const _IptuAnnualValueView();

  @override
  State<_IptuAnnualValueView> createState() => _IptuAnnualValueViewState();
}

class _IptuAnnualValueViewState extends State<_IptuAnnualValueView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo: Valor Anual do IPTU (com API)'),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const IptuAnnualValueFormHeader(),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ex: 3500',
                prefixText: 'R\$ ',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                final value = double.tryParse(text.replaceAll(',', '.'));
                context.read<IptuAnnualValueBloc>().add(
                      IptuAnnualValueChanged(value: value),
                    );
              },
            ),
            const SizedBox(height: 24),
            BlocBuilder<IptuAnnualValueBloc, IptuAnnualValueState>(
              buildWhen: (prev, curr) =>
                  prev is IptuAnnualValueLoading != curr is IptuAnnualValueLoading,
              builder: (context, state) {
                final isLoading = state is IptuAnnualValueLoading;
                return IptuAnnualValueValidateButton(
                  isLoading: isLoading,
                  onPressed: () {
                    final value = double.tryParse(
                      _controller.text.replaceAll(',', '.'),
                    );
                    context.read<IptuAnnualValueBloc>().add(
                          IptuAnnualValueValidateRequested(value: value),
                        );
                  },
                );
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<IptuAnnualValueBloc, IptuAnnualValueState>(
              builder: (context, state) {
                if (state is IptuAnnualValueLoading) {
                  return const IptuAnnualValueLoadingCard();
                }
                if (state is IptuAnnualValueInitial ||
                    state is IptuAnnualValueEditing) {
                  return const IptuAnnualValuePlaceholderCard();
                }
                if (state is IptuAnnualValueValid) {
                  return IptuAnnualValueValidCard(value: state.value);
                }
                if (state is IptuAnnualValueInvalid) {
                  return IptuAnnualValueInvalidCard(message: state.message);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
