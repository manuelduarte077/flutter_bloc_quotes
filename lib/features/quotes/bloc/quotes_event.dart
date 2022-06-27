part of 'quotes_bloc.dart';

abstract class QuotesEvent extends Equatable {
  const QuotesEvent();
}

class LoadQuotesEvent extends QuotesEvent {
  @override
  List<Object?> get props => [];
}
