import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/iptu_annual_value_dojo_bloc.dart';
import '../../iptu_annual_value/data/iptu_validate_api_service.dart';
import '../../iptu_annual_value/screens/widgets/iptu_annual_value_form_header.dart';
import '../../iptu_annual_value/screens/widgets/iptu_annual_value_result_card.dart';
import '../../iptu_annual_value/screens/widgets/iptu_annual_value_validate_button.dart';

/// DOJO - Implemente o IptuAnnualValueDojoBloc junto!
///
/// A UI está pronta. Implemente os handlers no bloc para:
/// - Armazenar o valor digitado
/// - Chamar a API ao validar
/// - Exibir Loading, Valid ou Invalid
///
/// Backend: cd backend && npm start
class IptuAnnualValueDojoScreen extends StatelessWidget {
  IptuAnnualValueDojoScreen({
    super.key,
    IptuValidateApiService? apiService,
  }) : _apiService = apiService ?? IptuValidateApiService();

  final IptuValidateApiService _apiService;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IptuAnnualValueDojoBloc(apiService: _apiService),
      child: const _IptuAnnualValueDojoView(),
    );
  }
}

class _IptuAnnualValueDojoView extends StatefulWidget {
  const _IptuAnnualValueDojoView();

  @override
  State<_IptuAnnualValueDojoView> createState() =>
      _IptuAnnualValueDojoViewState();
}

class _IptuAnnualValueDojoViewState extends State<_IptuAnnualValueDojoView> {
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
        title: const Text('Dojo: Valor Anual do IPTU'),
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
                context.read<IptuAnnualValueDojoBloc>().add(
                      IptuAnnualValueDojoChanged(value: value),
                    );
              },
            ),
            const SizedBox(height: 24),
            BlocBuilder<IptuAnnualValueDojoBloc, IptuAnnualValueDojoState>(
              buildWhen: (prev, curr) =>
                  prev is IptuAnnualValueDojoLoading !=
                  curr is IptuAnnualValueDojoLoading,
              builder: (context, state) {
                final isLoading = state is IptuAnnualValueDojoLoading;
                return IptuAnnualValueValidateButton(
                  isLoading: isLoading,
                  onPressed: () {
                    final value = double.tryParse(
                      _controller.text.replaceAll(',', '.'),
                    );
                    context.read<IptuAnnualValueDojoBloc>().add(
                          IptuAnnualValueDojoValidateRequested(value: value),
                        );
                  },
                );
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<IptuAnnualValueDojoBloc, IptuAnnualValueDojoState>(
              builder: (context, state) {
                if (state is IptuAnnualValueDojoLoading) {
                  return const IptuAnnualValueLoadingCard();
                }
                if (state is IptuAnnualValueDojoInitial ||
                    state is IptuAnnualValueDojoEditing) {
                  return const IptuAnnualValuePlaceholderCard();
                }
                if (state is IptuAnnualValueDojoValid) {
                  return IptuAnnualValueValidCard(value: state.value);
                }
                if (state is IptuAnnualValueDojoInvalid) {
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
