import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _login(Map<String, String> usuario) {
    if (_formKey.currentState!.validate()) {
      final emailDigitado = _emailController.text;
      final senhaDigitada = _senhaController.text;

      if (emailDigitado == usuario['email'] &&
          senhaDigitada == usuario['senha']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login realizado com sucesso!')),
        );

        Navigator.pushReplacementNamed(
          context,
          AppRoutes.home,
          arguments: usuario['nome'],
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('E-mail ou senha inválidos'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> usuario =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>? ??
            {
              'nome': 'Usuário',
              'email': '',
              'senha': '',
            };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe seu e-mail';
                  }
                  if (!value.contains('@')) {
                    return 'E-mail inválido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe sua senha';
                  }
                  if (value.length < 6) {
                    return 'Mínimo 6 caracteres';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _login(usuario),
                  child: const Text('Entrar'),
                ),
              ),

              const SizedBox(height: 16),

              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.cadastro,
                  );
                },
                child: const Text('Criar uma conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}