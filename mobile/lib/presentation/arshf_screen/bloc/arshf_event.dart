part of 'arshf_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Arshf widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ArshfEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Arshf widget is first created.
class ArshfInitialEvent extends ArshfEvent {
  @override
  List<Object?> get props => [];
}
