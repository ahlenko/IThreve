class RolesEditDialogEditState {
  final bool addBenefits;
  final bool addCoreSkill;
  final bool addNiceoHaveScill;
  final bool addCandidateAttributes;
  final bool managerVideoRemoved;
  final bool teamVideoRemoved;

  RolesEditDialogEditState({
    this.addBenefits = false,
    this.addCoreSkill = false,
    this.addNiceoHaveScill = false,
    this.addCandidateAttributes = false,
    this.managerVideoRemoved = false,
    this.teamVideoRemoved = false,
  });

  RolesEditDialogEditState copyWith({
    bool? addBenefits,
    bool? addCoreSkill,
    bool? addNiceoHaveScill,
    bool? addCandidateAttributes,
    bool? managerVideoRemoved,
    bool? teamVideoRemoved,
  }) {
    return RolesEditDialogEditState(
      addBenefits: addBenefits ?? this.addBenefits,
      addCoreSkill: addCoreSkill ?? this.addCoreSkill,
      addNiceoHaveScill: addNiceoHaveScill ?? this.addNiceoHaveScill,
      addCandidateAttributes:
          addCandidateAttributes ?? this.addCandidateAttributes,
      managerVideoRemoved: managerVideoRemoved ?? this.managerVideoRemoved,
      teamVideoRemoved: teamVideoRemoved ?? this.teamVideoRemoved,
    );
  }
}

class RolesEditDialogState {
  final bool maxDialogSize;
  final List<String>? benefits;
  final List<String>? coreSkills;
  final List<String>? niceToHaveSkills;
  final List<String>? candidateAttributes;
  final List<String>? managers;
  final List<String>? teamMembers;
  final List<String>? candidateResponsibillities;
  final int visaSponsorship;
  final RolesEditDialogEditState? editState;

  RolesEditDialogState(
      {this.maxDialogSize = false,
      this.benefits,
      this.candidateAttributes,
      this.candidateResponsibillities,
      this.coreSkills,
      this.managers,
      this.niceToHaveSkills,
      this.teamMembers,
      this.visaSponsorship = 0,
      this.editState});

  RolesEditDialogState initial() {
    return RolesEditDialogState(benefits: [
      'Medical',
      'Dental',
      'Retirement',
    ], coreSkills: [
      'Design system',
      '3D animation',
      'Branding',
    ], niceToHaveSkills: [
      'Interaction design',
      'User Flow',
      'Icon Design',
    ], candidateAttributes: [
      'Can-do-mentality',
      'Passionate',
      'Little ego',
    ], managers: [
      'Ayana Terauchi',
    ], teamMembers: [
      'Alan Matviienko',
      'Lisa Matviienko',
      'Marcos Spaziani',
    ], candidateResponsibillities: [
      'Leading, creating and implementing the design system into our mobile and web app using our branding',
      'Working with our marketing, product design team to have a coherent message through design',
    ], editState: RolesEditDialogEditState());
  }

  RolesEditDialogState copyWith(
      {bool? maxDialogSize,
      List<String>? benefits,
      List<String>? coreSkills,
      List<String>? niceToHaveSkills,
      List<String>? candidateAttributes,
      List<String>? managers,
      List<String>? teamMembers,
      List<String>? candidateResponsibillities,
      int? visaSponsorship,
      RolesEditDialogEditState? editState}) {
    return RolesEditDialogState(
      maxDialogSize: maxDialogSize ?? this.maxDialogSize,
      benefits: benefits ?? this.benefits,
      coreSkills: coreSkills ?? this.coreSkills,
      niceToHaveSkills: niceToHaveSkills ?? this.niceToHaveSkills,
      managers: managers ?? this.managers,
      candidateAttributes: candidateAttributes ?? this.candidateAttributes,
      teamMembers: teamMembers ?? this.teamMembers,
      candidateResponsibillities:
          candidateResponsibillities ?? this.candidateResponsibillities,
      editState: editState ?? this.editState,
      visaSponsorship: visaSponsorship ?? this.visaSponsorship,
    );
  }
}
