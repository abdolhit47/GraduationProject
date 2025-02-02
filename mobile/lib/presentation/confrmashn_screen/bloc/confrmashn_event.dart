part of 'confrmashn_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Confrmashn widget.
///
/// Events must be immutable and implement the [Equatable] interface.
class ConfrmashnEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Event that is dispatched when the Confrmashn widget is first created.
class ConfrmashnInitialEvent extends ConfrmashnEvent {
  @override
  List<Object?> get props => [];
}
