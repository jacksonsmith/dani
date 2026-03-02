# IPTU BLoC Dojo

POC para dojo de BLoC com tema de IPTU. Projeto Flutter (desktop + web) com API mockada em Node.js.

## Como rodar

**1. Inicie o backend (obrigatório para a 2ª tela):**
```bash
cd backend
npm install
npm start
```

**2. Rode o Flutter:**
```bash
cd iptu_bloc_dojo   # ou na raiz do projeto
flutter pub get
flutter run -d chrome   # ou macos, windows, linux
```

**3. Rodar testes:**
```bash
flutter test
# ou só o dojo de testes:
flutter test test/iptu_status_dojo/
```

## Estrutura

### Exemplos prontos

| Tela | Onde | O que faz |
|------|------|-----------|
| **Exemplo 1: Status do IPTU** | `lib/features/iptu_status/` | Usuário escolhe como paga IPTU (Sim / Isento / Incluso no condomínio). Referência para eventos, estados e handlers. |
| **Exemplo 2: Valor com API** | `lib/features/iptu_annual_value/` | Valida o valor anual do IPTU via API mockada (Node.js). Loading, POST `/api/validate-iptu`, resultado Valid/Invalid. Backend em `backend/`. |

### Dojos (implementar juntos)

| Tela | Onde | O que fazer |
|------|------|-------------|
| **Dojo - Implementar juntos** | `lib/features/iptu_annual_value_dojo/` | Implementar handlers com TODOs no bloc. Referência: Exemplo 2. |
| **Dojo de Testes** | `lib/features/iptu_status_test_dojo/` | Implementar testes com `bloc_test` e `mocktail`. Ver `test/iptu_status_dojo/`. |

### Treinos (BlocListener / BlocConsumer)

| Tela | O que mostra |
|------|--------------|
| **Treino: BlocListener** | Efeitos colaterais (SnackBar) sem rebuild. Uso correto de `listenWhen`. |
| **Treino: BlocConsumer (correto)** | Builder para UI + listener para side effects. `listenWhen` e `buildWhen`. |
| **Treino: BlocConsumer (errado)** | Anti-pattern: `setState` no listener, builder ignorando o state. |

## Roteiro do Dojo BLoC (1h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 | Mostrar o exemplo pronto (IptuStatusBloc) - eventos, estados, handlers |
| 0:15 | Abrir IptuAnnualValueBloc - explicar os TODOs |
| 0:20 | Implementar `_onValueChanged` - emitir `IptuAnnualValueEditing(value)` |
| 0:35 | Implementar `_onValidateRequested` - ler valor do state, validar, emitir Valid ou Invalid |
| 0:50 | Rodar o app e testar os cenários |
| 1:00 | Retro rápida |

## Roteiro do Dojo de Testes

| Tipo | Arquivo | Ferramentas |
|------|---------|-------------|
| Unit tests | `test/iptu_status_dojo/iptu_status_bloc_dojo_test.dart` | `bloc_test` (blocTest) |
| Widget tests | `test/iptu_status_dojo/iptu_status_result_card_dojo_test.dart` | `whenListen`, `BlocProvider.value`, `verify` |
| Widget + semantics | `test/iptu_status_dojo/iptu_status_result_card_semantics_dojo_test.dart` | `simulatedAccessibilityTraversal`, `containsSemantics` |

Ver `docs/tipos_de_teste.md` para nomes oficiais (Unit, Widget, Accessibility testing).

## Regras de negócio (IptuAnnualValueBloc)

- `IptuAnnualValueChanged` → armazena o valor, emite `IptuAnnualValueEditing(value)`
- `IptuAnnualValueValidateRequested`:
  - Se state não tem valor (Initial) ou value é null/≤0 → `IptuAnnualValueInvalid('Informe um valor válido')`
  - Se value ≤ 5000 → `IptuAnnualValueValid(value: value)`
  - Se value > 5000 → `IptuAnnualValueInvalid('Valor acima do limite de R$ 5.000 para reembolso')`
