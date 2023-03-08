import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_quotes/models/models.dart';

import '../../../animations/rotate_animation.dart';
import '../../bloc/quotes_bloc.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({Key? key, required this.model}) : super(key: key);

  final QuoteModel model;

  // final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Quote of the day',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.deepPurple.shade800,
                fontWeight: FontWeight.bold,
              ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff232260),
            border: Border.all(
              color: Colors.deepPurple.shade200,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Icon(
                  Icons.format_quote,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              Text(
                model.content,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 15),
              Text('Author: ${model.author}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                      )),
            ],
          ),
        ),
        Wrap(
          spacing: 8,
          children: [
            for (var tag in model.tags)
              Chip(
                label: Text(tag),
              ),
          ],
        ),
        QuoteOptions(model: model),
      ],
    );
  }
}

class QuoteOptions extends StatelessWidget {
  const QuoteOptions({Key? key, required this.model}) : super(key: key);

  final QuoteModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const _HeartIconButton(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _QuoteIconButton(
              iconData: Icons.share,
              onPressed: () {
                print('Share quote: ${model.content} Author: ${model.author}');
              },
            ),
            _QuoteIconButton(
              iconData: Icons.copy,
              onPressed: () {
                /// Copy to clipboard
                final data = ClipboardData(
                  text: 'Quote: ${model.content} Author: ${model.author}',
                );
                Clipboard.setData(data);
              },
            ),
            _QuoteIconButton(iconData: Icons.translate, onPressed: () {}),
            _QuoteIconButton(
              iconData: Icons.refresh_rounded,
              onPressed: () {
                /// Refresh quote
                context.read<QuotesBloc>().add(LoadQuotesEvent());
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _QuoteIconButton extends StatelessWidget {
  const _QuoteIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(iconData),
    );
  }
}

class _HeartIconButton extends StatelessWidget {
  const _HeartIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          /// Add to favorites
        },
        icon: const RotateAnimation(
          child: AnimatedScale(
            scale: 1.5,
            curve: Curves.bounceInOut,
            duration: Duration(milliseconds: 300),
            child: Icon(
              CupertinoIcons.heart_fill,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
