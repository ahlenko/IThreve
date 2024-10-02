import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/edit/roles_edit_dialog_state.dart';

@Injectable()
class RolesEditDialogCubit extends Cubit<RolesEditDialogState> {
  RolesEditDialogCubit() : super(RolesEditDialogState().initial()) {
    _init();
  }
  TextEditingController locationCtrl =
      TextEditingController(text: 'Los Angeles, CA');
  TextEditingController officeRequirementCtrl =
      TextEditingController(text: 'Hybrid • Remote');
  TextEditingController salaryCtrl = TextEditingController(text: '160k-200k');
  TextEditingController benefitsCtrl = TextEditingController();
  TextEditingController coreSkillsCtrl = TextEditingController();
  TextEditingController niceToSkillsCtrl = TextEditingController();
  TextEditingController candidateAttributeCtrl = TextEditingController();
  TextEditingController managerCtrl = TextEditingController();
  TextEditingController memberCtrl = TextEditingController();

  final List<TextEditingController> responsibilitiesCtrl = [];
  final FocusNode newItemNode = FocusNode();

  _init() {
    for (String item in state.candidateResponsibillities ?? []) {
      responsibilitiesCtrl.add(TextEditingController(text: item));
    }
  }

  responsibillitieAdd() {
    responsibilitiesCtrl.add(TextEditingController());
    emit(state);
    newItemNode.requestFocus();
  }

  responsibillitieRemove(int index) {
    responsibilitiesCtrl.removeAt(index);
    emit(state);
  }

  changeDialogSize() {
    emit(state.copyWith(maxDialogSize: !state.maxDialogSize));
  }

  changeDialogSizeBool(bool isMaxSize) {
    emit(state.copyWith(maxDialogSize: isMaxSize));
  }

  deleteManagerVideo() {
    emit(state.copyWith(
        editState: state.editState!.copyWith(managerVideoRemoved: true)));
  }

  loadManagerVideo() {
    emit(state.copyWith(
        editState: state.editState!.copyWith(managerVideoRemoved: false)));
  }

  deleteTeamVideo() {
    emit(state.copyWith(
        editState: state.editState!.copyWith(teamVideoRemoved: true)));
  }

  loadTeamVideo() {
    emit(state.copyWith(
        editState: state.editState!.copyWith(teamVideoRemoved: false)));
  }

  removeTeamMember(int index) {
    final newMembers = state.teamMembers;
    newMembers!.removeAt(index);
    emit(state.copyWith(teamMembers: newMembers));
  }

  setVisaSponsorship(int index) {
    emit(state.copyWith(visaSponsorship: index));
  }

  addTeamMember() {
    final newMembers = state.teamMembers;
    newMembers!.add(memberCtrl.text);
    emit(state.copyWith(teamMembers: newMembers));
    memberCtrl.text = "";
  }

  removeTeamManager(int index) {
    final newManagers = state.managers;
    newManagers!.removeAt(index);
    emit(state.copyWith(managers: newManagers));
  }

  addTeamManager() {
    final newManagers = state.managers;
    newManagers!.add(managerCtrl.text);
    emit(state.copyWith(managers: newManagers));
    managerCtrl.text = "";
  }

  removeCandidateAttributes(int index) {
    final newCandidateAttributes = state.candidateAttributes;
    newCandidateAttributes!.removeAt(index);
    emit(state.copyWith(candidateAttributes: newCandidateAttributes));
  }

  addCandidateAttribute() {
    final newCandidateAttributes = state.candidateAttributes;
    newCandidateAttributes!.add(candidateAttributeCtrl.text);
    emit(state.copyWith(candidateAttributes: newCandidateAttributes));
    candidateAttributeCtrl.text = "";
  }

  removeNiceToHaveSkills(int index) {
    final newNiceToHaveSkills = state.niceToHaveSkills;
    newNiceToHaveSkills!.removeAt(index);
    emit(state.copyWith(niceToHaveSkills: newNiceToHaveSkills));
  }

  addNiceToHaveSkill() {
    final newNiceToHaveSkills = state.niceToHaveSkills;
    newNiceToHaveSkills!.add(niceToSkillsCtrl.text);
    emit(state.copyWith(niceToHaveSkills: newNiceToHaveSkills));
    niceToSkillsCtrl.text = "";
  }

  removeCoreSkills(int index) {
    final newCoreSkills = state.coreSkills;
    newCoreSkills!.removeAt(index);
    emit(state.copyWith(coreSkills: newCoreSkills));
  }

  addCoreSkill() {
    final newCoreSkills = state.coreSkills;
    newCoreSkills!.add(coreSkillsCtrl.text);
    emit(state.copyWith(coreSkills: newCoreSkills));
    coreSkillsCtrl.text = "";
  }

  removeBenefits(int index) {
    final newBenefits = state.benefits;
    newBenefits!.removeAt(index);
    emit(state.copyWith(benefits: newBenefits));
  }

  addBenefit() {
    final newBenefits = state.benefits;
    newBenefits!.add(benefitsCtrl.text);
    emit(state.copyWith(benefits: newBenefits));
    benefitsCtrl.text = "";
  }
}
