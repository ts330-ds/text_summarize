import 'dart:convert';

SummaryModel summaryModelFromJson(String str) => SummaryModel.fromJson(json.decode(str));

String summaryModelToJson(SummaryModel data) => json.encode(data.toJson());

class SummaryModel {
  String? summary;
  int? tokensLength;

  SummaryModel({
    this.summary,
    this.tokensLength,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel(
    summary: json["summary"],
    tokensLength: json["tokens_length"],
  );

  Map<String, dynamic> toJson() => {
    "summary": summary,
    "tokens_length": tokensLength,
  };
}
