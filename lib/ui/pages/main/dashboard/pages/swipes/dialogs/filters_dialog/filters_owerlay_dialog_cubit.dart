import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/domain/model/selected_unselected.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/dialogs/filters_dialog/filters_owerlay_dialog_state.dart';

@Injectable()
class FiltersOwerlayDialogCubit extends Cubit<FiltersOwerlayDialogState> {
  FiltersOwerlayDialogCubit() : super(FiltersOwerlayDialogState()) {
    _init();
  }

  TextEditingController minContract = TextEditingController();
  TextEditingController maxContract = TextEditingController();
  TextEditingController minSalary = TextEditingController();
  TextEditingController maxSalary = TextEditingController();

  String coreSkillText = '';
  String niceToHaveText = '';
  String residingLocationText = '';
  String benefitsText = '';

  void _init() {
    final newArray = state.type ?? [];

    newArray.addAll([
      SelectedUnselected(title: 'Full-Time'),
      SelectedUnselected(title: 'Part-Time'),
      SelectedUnselected(title: 'Contract')
    ]);

    emit(state.copyWith(type: newArray));
  }

  addNewCoreSkill(String value) {
    if (value.isEmpty ||
        (state.coreSkills ?? [])
            .contains(SelectedUnselected(title: value, selected: true))) return;
    final newArray = state.coreSkills ?? [];
    newArray.add(SelectedUnselected(title: value, selected: true));
    emit(state.copyWith(coreSkills: newArray));
  }

  removeCoreSkill(int i) {
    final newArray = state.coreSkills ?? [];
    newArray.removeAt(i);
    emit(state.copyWith(coreSkills: newArray));
  }

  addNiceToHaveSkill(String value) {
    if (value.isEmpty ||
        (state.niceToHaveSkills ?? [])
            .contains(SelectedUnselected(title: value, selected: true))) return;
    final newArray = state.niceToHaveSkills ?? [];
    newArray.add(SelectedUnselected(title: value, selected: true));
    emit(state.copyWith(niceToHaveSkills: newArray));
  }

  removeNiceToHaveSkill(int i) {
    final newArray = state.niceToHaveSkills ?? [];
    newArray.removeAt(i);
    emit(state.copyWith(niceToHaveSkills: newArray));
  }

  addBenefits(String value) {
    if (value.isEmpty ||
        (state.benefits ?? [])
            .contains(SelectedUnselected(title: value, selected: true))) return;
    final newArray = state.benefits ?? [];
    newArray.add(SelectedUnselected(title: value, selected: true));
    emit(state.copyWith(benefits: newArray));
  }

  removeBenefits(int i) {
    final newArray = state.benefits ?? [];
    newArray.removeAt(i);
    emit(state.copyWith(benefits: newArray));
  }

  addNewLocation(String value) {
    if (value.isEmpty ||
        (state.residingLocation ?? [])
            .contains(SelectedUnselected(title: value, selected: true))) return;
    final newArray = state.residingLocation ?? [];
    newArray.add(SelectedUnselected(title: value, selected: true));
    emit(state.copyWith(residingLocation: newArray));
  }

  removeLocation(int i) {
    final newArray = state.residingLocation ?? [];
    newArray.removeAt(i);
    emit(state.copyWith(residingLocation: newArray));
  }

  selectUnselectType(int index) {
    final newArray = state.type ?? [];
    newArray[index].selected = !newArray[index].selected;
    emit(state.copyWith(type: newArray));
  }

  setVisaSponsorship(bool value) {
    emit(state.copyWith(visaSponsorship: value));
  }
}
