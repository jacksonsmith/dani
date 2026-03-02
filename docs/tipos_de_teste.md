# Tipos de Teste no Flutter

Nomes oficiais conforme [Flutter Testing docs](https://docs.flutter.dev/testing/overview).

---

## 1. Unit tests (Testes unitários)

**Nome oficial:** Unit tests

**O que é:** Testa uma única função, método ou classe em isolamento. Dependências externas são mockadas.

**Características:**
- Não renderiza UI
- Não usa `testWidgets`
- Rápido, poucas dependências

**Exemplo no projeto:**
```
test/iptu_status_dojo/iptu_status_bloc_dojo_test.dart
```

**Ferramentas:** `bloc_test` (blocTest), `mocktail` (mocks)

---

## 2. Widget tests (Testes de widget)

**Nome oficial:** Widget tests (em outros frameworks: component tests)

**O que é:** Testa um widget individual. Verifica que a UI renderiza corretamente e responde a interações.

**Características:**
- Usa `testWidgets`, `pumpWidget`
- Ambiente simplificado (não é dispositivo real)
- Usa `find.byText`, `find.byType`, `find.byWidgetPredicate` para asserções

**Exemplo no projeto:**
```
test/iptu_status_dojo/iptu_status_result_card_dojo_test.dart
```

**Ferramentas:** `flutter_test`, `bloc_test` (whenListen), `mocktail` (MockBloc)

---

## 3. Widget tests com semantics (Testes de widget com semântica)

**Nome oficial:** Não há nome separado — ainda são widget tests. A técnica é chamada de **Accessibility testing** ou **semantics-based testing** na [documentação de acessibilidade](https://docs.flutter.dev/ui/accessibility/accessibility-testing).

**O que é:** Widget test que valida o conteúdo via árvore de semântica (`tester.semantics.simulatedAccessibilityTraversal()`). Garante que o conteúdo está acessível para leitores de tela.

**Características:**
- Usa `tester.semantics.simulatedAccessibilityTraversal()`
- Asserções com `containsSemantics`, `orderedEquals`, `containsAllInOrder`
- Valida conteúdo e a11y ao mesmo tempo

**Exemplo no projeto:**
```
test/iptu_status_dojo/iptu_status_result_card_semantics_dojo_test.dart
```

**API:** `SemanticsController.simulatedAccessibilityTraversal()` — simula o percurso que tecnologias assistivas fazem na árvore.

---

## 4. Integration tests (Testes de integração)

**Nome oficial:** Integration tests

**O que é:** Testa o app completo ou grande parte dele em dispositivo/emulador real.

**Características:**
- Pasta `integration_test/`
- Roda em dispositivo ou emulador
- Maior confiança, maior custo de manutenção

**Exemplo externo:** Maestro (framework E2E em YAML) — para depois.

---

## Resumo

| Tipo              | Nome oficial   | Arquivo de exemplo                          |
|-------------------|----------------|---------------------------------------------|
| Unit              | Unit tests     | `iptu_status_bloc_dojo_test.dart`           |
| Widget            | Widget tests   | `iptu_status_result_card_dojo_test.dart`    |
| Widget + semantics| Widget tests (Accessibility testing) | `iptu_status_result_card_semantics_dojo_test.dart` |
| Integration       | Integration tests | (Maestro — para depois)                   |
