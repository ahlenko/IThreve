class CompactRoleModel {
  final bool isDelayed;
  final int step;
  final String currentStep;
  final int stepCount;
  final String roleName;
  final String nextStep;
  final String trains;
  final String hireDate;
  final bool isDraft;

  CompactRoleModel(
      {required this.hireDate,
      required this.isDelayed,
      required this.currentStep,
      required this.isDraft,
      required this.nextStep,
      required this.roleName,
      required this.step,
      required this.stepCount,
      required this.trains});
}
