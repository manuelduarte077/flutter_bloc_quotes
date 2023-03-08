import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_quotes/features/quotes/bloc/quotes_bloc.dart';
import 'package:flutter_bloc_quotes/features/quotes/repository/quote_repository.dart';
import 'package:flutter_bloc_quotes/features/quotes/ui/widgets/quote_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        toolbarOpacity: 0.8,
        leading: const Icon(FontAwesomeIcons.quoteRight),
      ),
      body: BlocProvider<QuotesBloc>(
        create: (context) =>
            QuotesBloc(RepositoryProvider.of<QuotesRepository>(context))
              ..add(LoadQuotesEvent()),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<QuotesBloc, QuotesState>(
              builder: (context, state) {
                if (state is QuoteErrorState) {
                  return Text(
                    state.message,
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  );
                } else if (state is QuoteLoadState) {
                  return QuoteWidget(
                    model: state.model,
                    onPressed: () =>
                        context.read<QuotesBloc>().add(LoadQuotesEvent()),
                  );
                }
                return const CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      ),
    );
  }
}
