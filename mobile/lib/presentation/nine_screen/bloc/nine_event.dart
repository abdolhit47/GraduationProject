part of 'nine_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Nine widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class NineEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Nine widget is first created.
class NineInitialEvent extends NineEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing slider index

// ignore_for_file: must_be_immutable
class ChangeSliderIndexEvent extends NineEvent {
  ChangeSliderIndexEvent({required this.value});

  int value;

  @override
  List<Object?> get props => [value];
}
