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

## Estrutura

### 1. Exemplo 1: `IptuStatusBloc`

- **Onde:** `lib/features/iptu_status/`
- **O que faz:** Usuário escolhe como paga IPTU (Sim / Isento / Incluso no condomínio)
- **Use como referência** para entender eventos, estados e handlers

### 2. Exemplo 2: `IptuAnnualValueBloc` (com API)

- **Onde:** `lib/features/iptu_annual_value/`
- **O que faz:** Valida o valor anual do IPTU via API mockada (Node.js)
  - Chama `POST /api/validate-iptu` com o valor
  - Mostra Loading durante a requisição
  - Exibe resultado (Valid/Invalid) conforme resposta da API
- **Backend:** `backend/` - Express com endpoint de validação

### 3. Dojo: `IptuAnnualValueDojoBloc` (implementar juntos)

- **Onde:** `lib/features/iptu_annual_value_dojo/`
- **O que fazer:** Implementar os handlers com TODOs no bloc
- **Referência:** Use o Exemplo 2 como solução completa

## Roteiro do Dojo (1h)

| Tempo | Atividade |
|-------|-----------|
| 0:00 | Mostrar o exemplo pronto (IptuStatusBloc) - eventos, estados, handlers |
| 0:15 | Abrir IptuAnnualValueBloc - explicar os TODOs |
| 0:20 | Implementar `_onValueChanged` - emitir `IptuAnnualValueEditing(value)` |
| 0:35 | Implementar `_onValidateRequested` - ler valor do state, validar, emitir Valid ou Invalid |
| 0:50 | Rodar o app e testar os cenários |
| 1:00 | Retro rápida |

## Regras de negócio (IptuAnnualValueBloc)

- `IptuAnnualValueChanged` → armazena o valor, emite `IptuAnnualValueEditing(value)`
- `IptuAnnualValueValidateRequested`:
  - Se state não tem valor (Initial) ou value é null/≤0 → `IptuAnnualValueInvalid('Informe um valor válido')`
  - Se value ≤ 5000 → `IptuAnnualValueValid(value: value)`
  - Se value > 5000 → `IptuAnnualValueInvalid('Valor acima do limite de R\$ 5.000 para reembolso')`
