import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, -1), // vem de cima
      end: const Offset(0, 0), // para no centro
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  void irParaHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Home(
          nome: nomeController.text,
          idade: idadeController.text,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _animation,
                child: Image.asset(
                  'assets/memoji.png',
                  width: 200,
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    labelText: "Digite seu nome",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: idadeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Digite sua idade",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: irParaHome,
                child: const Text("Entrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}