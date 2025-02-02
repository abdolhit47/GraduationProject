part of 'seventeen_bloc.dart';

/// Represents the state of Seventeen in the application.

// ignore_for_file: must_be_immutable
class SeventeenState extends Equatable {
  SeventeenState({this.seventeenTabModelObj, this.seventeenModelObj});

  SeventeenModel? seventeenModelObj;

  SeventeenTabModel? seventeenTabModelObj;

  @override
  List<Object?> get props => [seventeenTabModelObj, seventeenModelObj];
  SeventeenState copyWith({
    SeventeenTabModel? seventeenTabModelObj,
    SeventeenModel? seventeenModelObj,
  }) {
    return SeventeenState(
      seventeenTabModelObj: seventeenTabModelObj ?? this.seventeenTabModelObj,
      seventeenModelObj: seventeenModelObj ?? this.seventeenModelObj,
    );
  }
}
