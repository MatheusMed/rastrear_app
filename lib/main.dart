import 'package:flutter/material.dart';
import 'package:rastrear_app/app/di/inject.dart';
import 'package:rastrear_app/app/views/rastreamento_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Inject.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RastreamentoPage(),
    );
  }
}



//TODO TOKEN sr_live_0GeGE362-XkYHw48QivA9ramme_4RPR9TR3CMW5JJ_0