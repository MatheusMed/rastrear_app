import 'package:dio/dio.dart';
import 'package:rastrear_app/app/models/rastreamento_model.dart';
import 'package:rastrear_app/app/repositories/i_rastreamento_repo.dart';

class RastreamentoRepoImp implements IRastreamentoRepo {
  final Dio _dio;

  RastreamentoRepoImp(this._dio);

  @override
  Future<RastreamentoModel> getRastreamento(String codigo) async {
    try {
      final response = await _dio.get('/rastreio/$codigo');

      return RastreamentoModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        'Erro ao buscar rastreamento: ${e.response?.data ?? e.message}',
      );
    } catch (e) {
      throw Exception('Erro inesperado ao buscar rastreamento: $e');
    }
  }
}
