import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/market_data_job_offer/widgets/job_offer_column.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/market_data_job_offer/widgets/job_offer_percent_container_column.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/market_data_job_offer/widgets/job_offer_what_column.dart';
import 'package:ithreve_web/ui/theme/colors.dart';

class JobOfferCompetitiveness extends StatelessWidget {
  const JobOfferCompetitiveness({super.key});

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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JobOfferWhatColumn(),
          JobOfferColumn(),
          JobOfferPercentContainerColumn(),
        ],
      ),
    );
  }
}
