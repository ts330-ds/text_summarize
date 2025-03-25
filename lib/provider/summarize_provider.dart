import 'package:flutter/material.dart';
import 'package:text_summarization/provider/model.dart';
import 'dart:convert';

import 'package:text_summarization/provider/repository.dart';

class SummarizerProvider with ChangeNotifier {
  String _summary = "";
  bool _isLoading = false;

  String get summary => _summary;
  bool get isLoading => _isLoading;

  TextSummarizeRepository textSummarizeRepository = TextSummarizeRepository();
  Future<void> summarizeText(String text) async {
    if (text.isEmpty) {
      _summary = "Please enter some text to summarize.";
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    SummaryModel model = await textSummarizeRepository.getSummarizedText(text);

    _summary = model.summary!;

    _isLoading = false;
    notifyListeners();
  }
}
