import 'dart:developer';

import 'package:dio/dio.dart';
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
          baseUrl: 'https://seurastreio.com.br/api/public',
          headers: {
            'Authorization':
                'Bearer sr_live_0GeGE362-XkYHw48QivA9ramme_4RPR9TR3CMW5JJ_0',
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
