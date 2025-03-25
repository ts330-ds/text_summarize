import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_summarization/provider/summarize_provider.dart';

class TextSummarizer extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Summarizer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Enter Text to Summarize',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Consumer<SummarizerProvider>(
              builder: (context, summarizer, child) {
                return ElevatedButton(
                  onPressed: summarizer.isLoading
                      ? null
                      : () {
                    summarizer.summarizeText(textController.text);
                  },
                  child: summarizer.isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Summarize'),
                );
              },
            ),
            SizedBox(height: 20),
            Consumer<SummarizerProvider>(
              builder: (context, summarizer, child) {
                return Text(
                  summarizer.summary.isNotEmpty ? summarizer.summary : 'Your summary will appear here.',
                  style: TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
