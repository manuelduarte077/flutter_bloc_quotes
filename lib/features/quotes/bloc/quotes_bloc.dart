import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_quotes/features/quotes/repository/quote_repository.dart';
import 'package:flutter_bloc_quotes/models/models.dart';

part 'quotes_event.dart';

part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final QuotesRepository _repository;

  QuotesBloc(this._repository) : super(QuoteLoadingState()) {
    on<LoadQuotesEvent>((event, emit) async {
      emit(QuoteLoadingState());
      try {
        final model = await _repository.getQuote();
        emit(QuoteLoadState(model));
      } catch (e) {
        emit(QuoteErrorState(e.toString()));
      }
    });
  }
}
