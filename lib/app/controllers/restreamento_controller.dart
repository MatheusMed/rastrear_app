import 'package:flutter/material.dart';
import 'package:rastrear_app/app/models/rastreamento_model.dart';
import 'package:rastrear_app/app/repositories/i_rastreamento_repo.dart';

class RestreamentoController {
  final IRastreamentoRepo _rastreamentoRepo;

  RestreamentoController(this._rastreamentoRepo);

  final restreio = ValueNotifier<RastreamentoModel?>(null);

  Future<void> buscarRastreamento(String codigo) async {
    try {
      final resultado = await _rastreamentoRepo.getRastreamento(codigo);
      restreio.value = resultado;
    } catch (e) {
      throw Exception('Erro ao buscar rastreamento: $e');
    }
  }
}
