import 'package:rastrear_app/app/models/rastreamento_model.dart';

abstract class IRastreamentoRepo {
  Future<RastreamentoModel> getRastreamento(String codigo);
}
