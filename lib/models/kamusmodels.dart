// To parse this JSON data, do
//
//     final kamusModels = kamusModelsFromJson(jsonString);

import 'dart:convert';

KamusModels kamusModelsFromJson(String str) =>
    KamusModels.fromJson(json.decode(str));

String kamusModelsToJson(KamusModels data) => json.encode(data.toJson());

class KamusModels {
  KamusModels({
    required this.status,
    required this.data,
  });

  bool status;
  Data data;

  factory KamusModels.fromJson(Map<String, dynamic> json) => KamusModels(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.total,
    required this.resultLists,
  });

  int total;
  List<ResultList> resultLists;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        resultLists: List<ResultList>.from(
            json["resultLists"].map((x) => ResultList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "resultLists": List<dynamic>.from(resultLists.map((x) => x.toJson())),
      };
}

class ResultList {
  ResultList({
    required this.kata,
    required this.arti,
  });

  String kata;
  List<String> arti;

  factory ResultList.fromJson(Map<String, dynamic> json) => ResultList(
        kata: json["kata"],
        arti: List<String>.from(json["arti"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "kata": kata,
        "arti": List<dynamic>.from(arti.map((x) => x)),
      };
}
