class TeamMembers {
  String name;
  String role;
  String? phone;
  bool newMember;
  bool selected;
  String? nameError;
  String? phoneEmailError;

  TeamMembers({
    required this.name,
    required this.role,
    this.phone,
    this.nameError,
    this.phoneEmailError,
    this.newMember = true,
    this.selected = false,
  });

  TeamMembers copy() {
    return TeamMembers(
      name: name,
      role: role,
      phone: phone,
      nameError: nameError,
      phoneEmailError: phoneEmailError,
      newMember: newMember,
      selected: selected,
    );
  }
}
