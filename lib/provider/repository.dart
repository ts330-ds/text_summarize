
import 'package:flutter/material.dart';
import 'package:text_summarization/provider/api_service.dart';
import 'package:text_summarization/provider/model.dart';
import 'package:flutter/foundation.dart';

class TextSummarizeRepository extends ApiService{

  final RegExp regExp = RegExp(r"[\w-._]+");


  Future<SummaryModel> getSummarizedText(String text) async{
    final Iterable matches = regExp.allMatches(text);
    final int count = matches.length;
    print("the words length is "+count.toString());
    SummaryModel? model;
    var data = {
      "text":text
    };
    print("The data is "+data.toString());
    final response = await dio.post('/summarize',data: data);
    if(response.statusCode == 200){
      model = SummaryModel.fromJson(response.data);
      return model;
    }

    return SummaryModel(summary: "Not found",tokensLength: 0);
  }

}