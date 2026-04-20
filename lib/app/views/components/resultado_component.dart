import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rastrear_app/app/models/rastreamento_model.dart';
import 'package:rastrear_app/app/views/components/info_component.dart';

class ResultadoComponent extends StatelessWidget {
  final RastreamentoModel data;
  const ResultadoComponent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.codigo,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            data.status,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),

          const Divider(height: 30),

          InfoComponent(
            titulo: "Descrição",
            valor: data.eventoMaisRecente.descricao,
          ),
          InfoComponent(
            titulo: "Detalhe",
            valor: data.eventoMaisRecente.detalhe,
          ),
          InfoComponent(titulo: "Local", valor: data.eventoMaisRecente.local),
          InfoComponent(
            titulo: "Data",
            valor: DateFormat(
              'dd/MM/yyyy HH:mm',
            ).format(data.eventoMaisRecente.data),
          ),

          const Spacer(),

          if (data.linkDetalhesCompletos.isNotEmpty)
            TextButton(
              onPressed: () {},
              child: const Text("Ver detalhes completos"),
            ),
        ],
      ),
    );
  }
}
