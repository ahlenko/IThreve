class RolesReviewDialogState {
  final bool maxDialogSize;
  final List<String>? benefits;
  final List<String>? coreSkills;
  final List<String>? niceToHaveSkills;
  final List<String>? candidateAttributes;
  final List<String>? managers;
  final List<String>? teamMembers;
  final List<String>? candidateResponsibillities;

  final String? location;
  final String? office;
  final String? salary;
  final String? authorization;

  RolesReviewDialogState(
      {this.maxDialogSize = false,
      this.benefits,
      this.candidateAttributes,
      this.candidateResponsibillities,
      this.coreSkills,
      this.managers,
      this.niceToHaveSkills,
      this.authorization,
      this.location,
      this.office,
      this.salary,
      this.teamMembers});

  RolesReviewDialogState initial() {
    return RolesReviewDialogState(
        office: 'Hybrid • Remote',
        salary: '160k-200k',
        location: 'Los Angeles, CA',
        authorization: 'Visa Sponsor',
        benefits: [
          'Medical',
          'Dental',
          'Retirement',
        ],
        coreSkills: [
          'Design system',
          '3D animation',
          'Branding',
        ],
        niceToHaveSkills: [
          'Interaction design',
          'User Flow',
          'Icon Design',
        ],
        candidateAttributes: [
          'Can-do-mentality',
          'Passionate',
          'Little ego',
        ],
        managers: [
          'Ayana Terauchi',
        ],
        teamMembers: [
          'Alan Matviienko',
          'Lisa Matviienko',
          'Marcos Spaziani',
        ],
        candidateResponsibillities: [
          'Leading, creating and implementing the design system into our mobile and web app using our branding',
          'Working with our marketing, product design team to have a coherent message through design',
        ]);
  }

  RolesReviewDialogState copyWith(
      {bool? maxDialogSize,
      List<String>? benefits,
      List<String>? coreSkills,
      List<String>? niceToHaveSkills,
      List<String>? candidateAttributes,
      List<String>? managers,
      List<String>? teamMembers,
      List<String>? candidateResponsibillities,
      String? location,
      String? office,
      String? salary,
      String? authorization}) {
    return RolesReviewDialogState(
      maxDialogSize: maxDialogSize ?? this.maxDialogSize,
      benefits: benefits ?? this.benefits,
      coreSkills: coreSkills ?? this.coreSkills,
      niceToHaveSkills: niceToHaveSkills ?? this.niceToHaveSkills,
      managers: managers ?? this.managers,
      teamMembers: teamMembers ?? this.teamMembers,
      candidateAttributes: candidateAttributes ?? this.candidateAttributes,
      candidateResponsibillities:
          candidateResponsibillities ?? this.candidateResponsibillities,
      location: location ?? this.location,
      office: office ?? this.office,
      salary: salary ?? this.salary,
      authorization: authorization ?? this.authorization,
    );
  }
}
