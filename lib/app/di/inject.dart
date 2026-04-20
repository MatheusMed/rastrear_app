import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rastrear_app/app/controllers/restreamento_controller.dart';
import 'package:rastrear_app/app/repositories/i_rastreamento_repo.dart';
import 'package:rastrear_app/app/repositories/rastreamento_repo_imp.dart';

class Inject {
  static Future<void> init() async {
    log(" Iniciando injeção de dependências...");
    final inject = GetIt.instance;

    inject.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: dotenv.env['API_BASE_URL']!,
          headers: {
            'Authorization': 'Bearer ${dotenv.env['API_TOKEN']}',
            'Content-Type': 'application/json',
          },
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        ),
      ),
    );

    inject.registerLazySingleton<IRastreamentoRepo>(
      () => RastreamentoRepoImp(inject()),
    );

    inject.registerLazySingleton(() => RestreamentoController(inject()));
  }
}
