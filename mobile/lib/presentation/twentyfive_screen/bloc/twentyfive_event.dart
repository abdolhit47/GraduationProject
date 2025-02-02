part of 'twentyfive_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Twentyfive widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class TwentyfiveEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Twentyfive widget is first created.
class TwentyfiveInitialEvent extends TwentyfiveEvent {
  @override
  List<Object?> get props => [];
}
