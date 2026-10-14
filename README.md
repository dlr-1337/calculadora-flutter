# Calculadora Flutter

**As quatro operações em uma interface simples — um estudo prático de entrada de dados e gerenciamento de estado.**

Aplicativo acadêmico em Flutter e Dart. O usuário informa dois números, escolhe uma operação e recebe o resultado na mesma tela. A implementação usa os recursos básicos do Flutter, sem biblioteca externa de gerenciamento de estado.

**[Abrir a demonstração web](https://dlr-1337.github.io/calculadora-flutter/)** · [Ler a implementação](lib/main.dart)

## Funcionalidades

| Recurso | Comportamento |
| --- | --- |
| Operações | Soma, subtração, multiplicação e divisão entre dois números. |
| Entrada | Números negativos e decimais com vírgula ou ponto; espaços nas extremidades são ignorados. |
| Validação | Mensagem para campos vazios ou valores que não podem ser convertidos em número. |
| Divisão por zero | Mensagem específica, sem realizar a operação. |
| Resultado | Atualização imediata na própria tela por `setState`. |
| Interface | Widgets Material e área com rolagem para manter os controles acessíveis. |

O objetivo é didático. Não há histórico de operações, armazenamento em banco, autenticação ou avaliação de expressões completas.

## Como usar

Preencha **Primeiro número** e **Segundo número**. Depois, pressione **Somar**, **Subtrair**, **Multiplicar** ou **Dividir**.

| Primeiro número | Segundo número | Operação | Saída esperada |
| --- | --- | --- | --- |
| `3,5` | `1.5` | Somar | `Resultado: 5.0` |
| `-4` | `3` | Multiplicar | `Resultado: -12.0` |
| `10` | `2` | Dividir | `Resultado: 5.0` |
| `10` | `0` | Dividir | `Não é possível dividir por zero.` |
| Campo vazio | `2` | Somar | `Digite dois números válidos.` |

Os resultados usam a representação padrão de `double` do Dart, como `5.0`; o projeto não implementa aritmética decimal financeira.

## Como o código funciona

```text
TextField → TextEditingController → normalização de vírgula/ponto
                                          ↓
                                   double.tryParse
                                          ↓
                              validação → switch da operação
                                          ↓
                                   setState → resultado
```

A implementação está concentrada em [`lib/main.dart`](lib/main.dart):

- `CalculadoraApp` configura o `MaterialApp`.
- `Calculadora` é um `StatefulWidget`, pois o resultado muda durante o uso.
- `_CalculadoraState.calcular` valida a entrada, seleciona a operação e atualiza a mensagem.
- `dispose` libera os dois controladores quando a tela é encerrada.

## Executar localmente

Use uma instalação do Flutter que forneça um Dart compatível com `^3.13.0`, conforme [`pubspec.yaml`](pubspec.yaml). Para a versão web, é necessário um navegador compatível com o alvo escolhido.

```bash
git clone https://github.com/dlr-1337/calculadora-flutter.git
cd calculadora-flutter
flutter pub get
flutter run -d chrome
```

Para Android, conecte um dispositivo com depuração habilitada ou inicie um emulador:

```bash
flutter devices
flutter run
```

Para executar a análise estática configurada no projeto:

```bash
flutter analyze
```

## Publicação web

O fluxo documentado utiliza GitHub Pages com a branch `gh-pages`:

```bash
flutter build web --release --base-href /calculadora-flutter/
```

Os arquivos gerados em `build/web` devem ficar na raiz de `gh-pages`, junto de um arquivo vazio `.nojekyll`. O `base-href` precisa corresponder ao caminho em que a aplicação será hospedada.

## Conceitos trabalhados

| Aula | Aplicação no projeto |
| --- | --- |
| 02 | Números, operações e seleção com `switch`. |
| 03 | Composição e organização de widgets. |
| 04 | `StatefulWidget` e atualização com `setState`. |
| 11 | `TextField`, `TextEditingController`, conversão com `double.tryParse` e ciclo de vida com `dispose`. |

O código mantém comentários curtos em português para facilitar a leitura de quem está começando com Flutter.
