import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import '../models/prtfoleo_steng_model.dart';
part 'prtfoleo_steng_event.dart';
part 'prtfoleo_steng_state.dart';

/// A bloc that manages the state of a PrtfoleoSteng according to the event that is dispatched to it.
class PrtfoleoStengBloc extends Bloc<PrtfoleoStengEvent, PrtfoleoStengState> {
  PrtfoleoStengBloc(PrtfoleoStengState initialState) : super(initialState) {
    on<PrtfoleoStengInitialEvent>(_onInitialize);
    on<ChangeDateEvent>(_changeDate);
  }

  _onInitialize(
    PrtfoleoStengInitialEvent event,
    Emitter<PrtfoleoStengState> emit,
  ) async {
    emit(
      state.copyWith(
        firstNameInputController: TextEditingController(),
        lastNameInputController: TextEditingController(),
        userNameInputController: TextEditingController(),
        phoneInputController: TextEditingController(),
        emailInputController: TextEditingController(),
        birthdateInputController: TextEditingController(),
      ),
    );
    emit(
      state.copyWith(
        prtfoleoStengModelObj: state.prtfoleoStengModelObj?.copyWith(
          dropdownItemList: fillDropdownItemList(),
        ),
      ),
    );
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _changeDate(
    ChangeDateEvent event,
    Emitter<PrtfoleoStengState> emit,
  ) {
    emit(state.copyWith(
        prtfoleoStengModelObj: state.prtfoleoStengModelObj?.copyWith(
      selectedBirthdateInput: event.date,
    )));
  }
}
