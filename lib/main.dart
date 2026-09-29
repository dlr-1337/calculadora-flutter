import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      home: Calculadora(),
    );
  }
}

// A tela tem estado porque o resultado muda quando um botão é pressionado.
class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  // Os controladores guardam o texto digitado nos campos.
  final primeiroNumero = TextEditingController();
  final segundoNumero = TextEditingController();
  String mensagem = 'Resultado: —';

  void calcular(String operacao) {
    // Aceita números com vírgula ou ponto e ignora espaços nas extremidades.
    final numero1 = double.tryParse(
      primeiroNumero.text.trim().replaceAll(',', '.'),
    );
    final numero2 = double.tryParse(
      segundoNumero.text.trim().replaceAll(',', '.'),
    );

    if (numero1 == null || numero2 == null) {
      setState(() {
        mensagem = 'Digite dois números válidos.';
      });
      return;
    }

    if (operacao == '/' && numero2 == 0) {
      setState(() {
        mensagem = 'Não é possível dividir por zero.';
      });
      return;
    }

    // Escolhe a conta de acordo com o botão pressionado.
    double resultado;
    switch (operacao) {
      case '+':
        resultado = numero1 + numero2;
        break;
      case '-':
        resultado = numero1 - numero2;
        break;
      case '*':
        resultado = numero1 * numero2;
        break;
      case '/':
        resultado = numero1 / numero2;
        break;
      default:
        return;
    }

    // O setState atualiza a mensagem e faz a tela mostrar o novo resultado.
    setState(() {
      mensagem = 'Resultado: $resultado';
    });
  }

  @override
  void dispose() {
    // Libera os controladores quando a tela é fechada.
    primeiroNumero.dispose();
    segundoNumero.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Calculadora', style: TextStyle(color: Colors.white)),
      ),
      // A rolagem mantém os campos e botões acessíveis em telas pequenas.
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Digite dois números e escolha uma operação.',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: primeiroNumero,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Primeiro número',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: segundoNumero,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Segundo número',
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    botao('Somar (+)', '+'),
                    const SizedBox(width: 12),
                    botao('Subtrair (−)', '-'),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    botao('Multiplicar (×)', '*'),
                    const SizedBox(width: 12),
                    botao('Dividir (÷)', '/'),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    mensagem,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reutiliza o mesmo visual nos quatro botões.
  Widget botao(String texto, String operacao) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: () => calcular(operacao),
        child: Text(texto),
      ),
    );
  }
}
