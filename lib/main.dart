
import 'package:flutter/material.dart';

import 'counter_display.dart';
import 'counter_buttons.dart';

void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter Minggu 7',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF7952B3),
      ),
      home: const HomePage(),
    );
  }
}

// Parent untuk mengatur halaman Counter
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showCounter = true;

  // Menutup halaman Counter
  void _closeCounter() {
    setState(() {
      _showCounter = false;
    });
  }

  // Membuka kembali halaman Counter
  void _openCounter() {
    setState(() {
      _showCounter = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showCounter
        ? CounterPage(
            key: const ValueKey('counter'),
            onClose: _closeCounter,
          )
        : Scaffold(
            backgroundColor: const Color(0xFFF8F5FF),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      size: 85,
                      color: Color(0xFF7952B3),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Counter Telah Ditutup',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7952B3),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Halaman Counter berhasil ditutup.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton.icon(
                      onPressed: _openCounter,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Buka Kembali Counter'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

// Halaman Counter
class CounterPage extends StatefulWidget {
  final VoidCallback onClose;

  const CounterPage({
    super.key,
    required this.onClose,
  });

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // State counter
  int _counter = 0;

  // Lifecycle: dijalankan saat State dibuat
  @override
  void initState() {
    super.initState();

    debugPrint('Counter dimulai');
  }

  // Fungsi menambah angka
  void _addCounter() {
    setState(() {
      _counter++;
    });
  }

  // Fungsi mengurangi angka
  void _subtractCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  // Fungsi reset angka
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),
      appBar: AppBar(
        title: const Text(
          'Counter Minggu 7',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE5D6FF),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 450,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calculate_rounded,
                    size: 65,
                    color: Color(0xFF7952B3),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Aplikasi Counter',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Silakan gunakan tombol di bawah',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 35),

                  // Passing data dari parent ke child
                  CounterDisplay(
                    counter: _counter,
                  ),

                  const SizedBox(height: 35),

                  // Callback dari child ke parent
                  CounterButtons(
                    onAdd: _addCounter,
                    onSubtract: _subtractCounter,
                    onReset: _resetCounter,
                  ),

                  const SizedBox(height: 25),

                  // Tombol untuk menghapus CounterPage
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: widget.onClose,
                      icon: const Icon(Icons.close),
                      label: const Text('Tutup Counter'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  const Text(
                    'Mobile Programming - Pertemuan 7',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Lifecycle: dijalankan saat State dihapus
  @override
  void dispose() {
    debugPrint('Counter ditutup');

    super.dispose();
  }
}
