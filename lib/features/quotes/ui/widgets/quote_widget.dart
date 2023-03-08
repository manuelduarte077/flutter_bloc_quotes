import 'package:flutter/material.dart';
import 'package:flutter_bloc_quotes/models/models.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({Key? key, required this.model, required this.onPressed})
      : super(key: key);

  final QuoteModel model;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Colors.deepPurple.shade800,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            'Author: ${model.author}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.deepPurple.shade200,
                ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Wrap(
              spacing: 10,
              children: [
                for (var tag in model.tags)
                  Chip(
                    label: Text(tag),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color(0xff262938),
                  ),
                ),
              ),
            ),
            child: const Text('Load a new quote'),
          )
        ],
      ),
    );
  }

  String tagsToString(List<String> tags) {
    String tagsString = '';
    for (String tag in tags) {
      tagsString += ' $tag -';
    }
    return tagsString.substring(0, tagsString.length - 1);
  }
}
