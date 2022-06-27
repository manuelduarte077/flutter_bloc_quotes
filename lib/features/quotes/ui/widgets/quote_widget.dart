import 'package:flutter/material.dart';
import 'package:flutter_bloc_quotes/models/models.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({Key? key, required this.model, required this.onPressed})
      : super(key: key);

  final QuoteModel model;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      model.content,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Wrap(
                      children: [
                        for (var tag in model.tags)
                        Chip(
                          label: Text(tag),
                          labelPadding: const EdgeInsets.symmetric(horizontal: 15),
                          backgroundColor: Colors.deepPurple.shade200,
                        ),
                      ],
                      // child: Text(
                      //   tagsToString(model.tags),
                      //   textAlign: TextAlign.center,
                      //   style: const TextStyle(fontSize: 18),
                      // ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Author: ${model.author}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: onPressed,
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
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
            ),
          ),
        )
      ],
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
