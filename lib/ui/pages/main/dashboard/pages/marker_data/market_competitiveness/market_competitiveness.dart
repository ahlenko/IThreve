import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/market_competitiveness/widgets/competitiveness_column.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/market_competitiveness/widgets/number_of_column.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/market_data_job_offer/widgets/job_offer_what_column.dart';
import 'package:ithreve_web/ui/theme/colors.dart';

class MarketCompetitiveness extends StatelessWidget {
  const MarketCompetitiveness({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 48,
      ),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: WEBColors.white.withOpacity(
          0.1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const JobOfferWhatColumn(),
          const CompetitivenessColumn(),
          NumberOfColumn(
            title: Strings.numberApplicants,
          ),
          NumberOfColumn(
            title: Strings.numberJobs,
          ),
        ],
      ),
    );
  }
}
