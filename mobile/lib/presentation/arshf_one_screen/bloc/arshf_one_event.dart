part of 'arshf_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ArshfOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ArshfOneEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the ArshfOne widget is first created.
class ArshfOneInitialEvent extends ArshfOneEvent {
  @override
  List<Object?> get props => [];
}
