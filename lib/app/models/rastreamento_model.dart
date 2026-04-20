import 'dart:convert';

RastreamentoModel rastreamentoModelFromJson(String str) =>
    RastreamentoModel.fromJson(json.decode(str));

String rastreamentoModelToJson(RastreamentoModel data) =>
    json.encode(data.toJson());

class RastreamentoModel {
  final String codigo;
  final String status;
  final bool success;
  final EventoMaisRecente eventoMaisRecente;
  final String linkDetalhesCompletos;
  final String message;

  RastreamentoModel({
    required this.codigo,
    required this.status,
    required this.success,
    required this.eventoMaisRecente,
    required this.linkDetalhesCompletos,
    required this.message,
  });

  factory RastreamentoModel.fromJson(Map<String, dynamic> json) =>
      RastreamentoModel(
        codigo: json["codigo"] ?? '',
        status: json["status"] ?? '',
        success: json["success"] ?? false,

        eventoMaisRecente: json["eventoMaisRecente"] != null
            ? EventoMaisRecente.fromJson(json["eventoMaisRecente"])
            : EventoMaisRecente.empty(),

        linkDetalhesCompletos: json["linkDetalhesCompletos"] ?? '',
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
    "codigo": codigo,
    "status": status,
    "success": success,
    "eventoMaisRecente": eventoMaisRecente.toJson(),
    "linkDetalhesCompletos": linkDetalhesCompletos,
    "message": message,
  };
}

class EventoMaisRecente {
  final String codigo;
  final String descricao;
  final String detalhe;
  final DateTime data;
  final String local;
  final dynamic destino;

  EventoMaisRecente({
    required this.codigo,
    required this.descricao,
    required this.detalhe,
    required this.data,
    required this.local,
    required this.destino,
  });

  factory EventoMaisRecente.fromJson(Map<String, dynamic> json) =>
      EventoMaisRecente(
        codigo: json["codigo"],
        descricao: json["descricao"],
        detalhe: json["detalhe"],
        data: DateTime.parse(json["data"]),
        local: json["local"],
        destino: json["destino"],
      );

  Map<String, dynamic> toJson() => {
    "codigo": codigo,
    "descricao": descricao,
    "detalhe": detalhe,
    "data": data.toIso8601String(),
    "local": local,
    "destino": destino,
  };

  factory EventoMaisRecente.empty() => EventoMaisRecente(
    codigo: '',
    descricao: 'Sem eventos',
    detalhe: '',
    data: DateTime.now(),
    local: '',
    destino: null,
  );
}
