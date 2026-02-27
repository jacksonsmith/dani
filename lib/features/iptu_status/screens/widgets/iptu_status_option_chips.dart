import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/iptu_status_bloc.dart';

class IptuStatusOptionChips extends StatelessWidget {
  const IptuStatusOptionChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IptuStatusBloc, IptuStatusState>(
      builder: (context, state) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: IptuPaymentOption.values.map((option) {
            final isSelected =
                state is IptuStatusSelected && state.option == option;
            return ChoiceChip(
              label: Text(option.label),
              selected: isSelected,
              onSelected: (_) {
                context.read<IptuStatusBloc>().add(
                      IptuStatusOptionSelected(option: option),
                    );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
