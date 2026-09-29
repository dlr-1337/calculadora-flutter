# Calculadora Flutter

Calculadora simples feita como atividade de gerenciamento de estado.

**[Abrir a calculadora](https://dlr-1337.github.io/calculadora-flutter/)**

## Como usar

1. Digite o primeiro e o segundo número.
2. Clique em **Somar**, **Subtrair**, **Multiplicar** ou **Dividir**.
3. Veja o resultado na mesma tela.

Os campos aceitam números negativos e decimais com vírgula ou ponto.
Campos vazios, texto inválido e divisão por zero mostram uma mensagem.
Os resultados usam a exibição padrão de números do Dart, como `5.0`.

## Conceitos das aulas

- **Aula 02:** números, operações e `switch`.
- **Aula 03:** widgets e organização da interface.
- **Aula 04:** `StatefulWidget` e atualização da tela com `setState`.
- **Aula 11:** `TextField`, `TextEditingController`, `double.tryParse` e `dispose`.

O código da calculadora está em [`lib/main.dart`](lib/main.dart), com comentários
curtos em português. O aplicativo usa apenas os widgets e recursos básicos do
Flutter e do Dart.

## Executar no computador

Com o Flutter instalado:

```bash
git clone https://github.com/dlr-1337/calculadora-flutter.git
cd calculadora-flutter
flutter pub get
flutter run -d chrome
```

Para executar no Android, conecte um celular ou inicie um emulador e use
`flutter run`.

## Publicação web

A versão online é publicada no GitHub Pages pela branch `gh-pages`.
Para gerar os arquivos da versão web:

```bash
flutter build web --release --base-href /calculadora-flutter/
```

Os arquivos gerados em `build/web` são enviados à raiz da branch `gh-pages`,
junto de um arquivo vazio chamado `.nojekyll`.
