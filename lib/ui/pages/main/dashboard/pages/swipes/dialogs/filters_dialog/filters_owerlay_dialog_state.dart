import 'package:ithreve_web/domain/model/selected_unselected.dart';

class FiltersOwerlayDialogState {
  List<SelectedUnselected>? niceToHaveSkills;
  List<SelectedUnselected>? residingLocation;
  List<SelectedUnselected>? coreSkills;
  List<SelectedUnselected>? benefits;
  List<SelectedUnselected>? type;
  bool visaSponsorship;

  FiltersOwerlayDialogState(
      {this.benefits,
      this.coreSkills,
      this.type,
      this.niceToHaveSkills,
      this.residingLocation,
      this.visaSponsorship = false});

  FiltersOwerlayDialogState copyWith({
    List<SelectedUnselected>? niceToHaveSkills,
    List<SelectedUnselected>? residingLocation,
    List<SelectedUnselected>? coreSkills,
    List<SelectedUnselected>? benefits,
    List<SelectedUnselected>? type,
    bool? visaSponsorship,
  }) {
    return FiltersOwerlayDialogState(
      niceToHaveSkills: niceToHaveSkills ?? this.niceToHaveSkills,
      residingLocation: residingLocation ?? this.residingLocation,
      visaSponsorship: visaSponsorship ?? this.visaSponsorship,
      coreSkills: coreSkills ?? this.coreSkills,
      benefits: benefits ?? this.benefits,
      type: type ?? this.type,
    );
  }
}
