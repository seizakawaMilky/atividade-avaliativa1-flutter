import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Lista com estado (lido ou não)
  final List<Map<String, dynamic>> livros = [
    {'titulo': 'Orgulho e Preconceito', 'autor': 'Jane Austen', 'lido': false},
    {'titulo': 'Alice no País das Maravilhas', 'autor': 'Lewis Carroll', 'lido': false},
    {'titulo': 'Corte de Espinhos e Rosas', 'autor': 'Sarah J. Maas', 'lido': false},
    {'titulo': 'A Culpa é das Estrelas', 'autor': 'John Green', 'lido': false},
    {'titulo': 'A Cabana', 'autor': 'William P. Young', 'lido': false},
  ];

  void _toggleLido(int index) {
    setState(() {
      livros[index]['lido'] = !livros[index]['lido'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final String nome =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Usuário';

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Controle de Leitura'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Seja bem-vindo, $nome!',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                '5 últimos livros: ',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 12),

              Expanded(
                child: ListView.builder(
                  itemCount: livros.length,
                  itemBuilder: (context, index) {
                    final livro = livros[index];
                    final bool lido = livro['lido'];

                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      color: lido ? Colors.green[100] : null, // 🎨 fundo verde
                      child: ListTile(
                        leading: Icon(
                          lido ? Icons.menu_book : Icons.book_outlined,
                          color: lido ? Colors.green : null,
                        ),

                        title: Text(
                          livro['titulo'],
                          style: TextStyle(
                            decoration:
                                lido ? TextDecoration.lineThrough : null,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Text(
                          livro['autor'],
                          style: TextStyle(
                            decoration:
                                lido ? TextDecoration.lineThrough : null,
                          ),
                        ),

                        trailing: IconButton(
                          icon: Icon(
                            lido
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: lido ? Colors.green : Colors.grey,
                          ),
                          onPressed: () => _toggleLido(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}