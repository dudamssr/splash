import 'package:flutter/material.dart';
import 'splash.dart';

class Home extends StatelessWidget {
  final String nome;
  final String idade;

  const Home({super.key, required this.nome, required this.idade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: const Color.fromARGB(255, 252, 230, 246),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nome: $nome", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text("Idade: $idade", style: const TextStyle(fontSize: 20)),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              },
              child: const Text("Voltar"),
            ),
          ],
        ),
      ),
    );
  }
}