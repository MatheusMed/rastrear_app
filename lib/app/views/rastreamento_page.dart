import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rastrear_app/app/controllers/restreamento_controller.dart';
import 'package:rastrear_app/app/models/rastreamento_model.dart';
import 'package:rastrear_app/app/views/components/resultado_component.dart';

class RastreamentoPage extends StatefulWidget {
  const RastreamentoPage({super.key});

  @override
  State<RastreamentoPage> createState() => _RastreamentoPageState();
}

class _RastreamentoPageState extends State<RastreamentoPage> {
  final controller = GetIt.I<RestreamentoController>();
  final codigoController = TextEditingController();

  bool loading = false;
  String? erro;

  Future<void> buscar() async {
    FocusScope.of(context).unfocus();

    if (codigoController.text.isEmpty) {
      setState(() => erro = 'Digite um código válido');
      return;
    }

    setState(() {
      loading = true;
      erro = null;
    });

    try {
      await controller.buscarRastreamento(codigoController.text);
    } catch (e) {
      erro = e.toString();
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text("Rastreamento"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _campoBusca(),
            const SizedBox(height: 20),

            if (erro != null)
              Text(erro!, style: const TextStyle(color: Colors.red)),

            Expanded(
              child: ValueListenableBuilder<RastreamentoModel?>(
                valueListenable: controller.restreio,
                builder: (_, data, __) {
                  if (data == null) {
                    return const Center(child: Text("Nenhum resultado"));
                  }

                  if (!data.success) {
                    return Center(child: Text(data.message));
                  }

                  return ResultadoComponent(data: data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _campoBusca() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TextField(
            controller: codigoController,
            decoration: InputDecoration(
              hintText: 'BR123456789BR',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: const Color(0xFFF1F3F7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: loading ? null : buscar,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Buscar", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
