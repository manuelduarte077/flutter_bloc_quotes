part of 'quotes_bloc.dart';

abstract class QuotesState extends Equatable {
  const QuotesState();
}

class QuotesInitial extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuoteLoadingState extends QuotesState {
  @override
  List<Object?> get props => [];
}

class QuoteErrorState extends QuotesState {
  final String message;

  const QuoteErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class QuoteLoadState extends QuotesState {
  final QuoteModel model;

  const QuoteLoadState(this.model);

  @override
  List<Object?> get props => [model];
}
