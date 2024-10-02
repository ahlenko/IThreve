import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/job/create_job_page_selector_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/job/create_job_page_selector_state.dart';

class CreateJobPageSelector extends StatefulWidget {
  const CreateJobPageSelector({super.key});

  @override
  State<CreateJobPageSelector> createState() => _CreateJobPageSelectorState();
}

class _CreateJobPageSelectorState extends State<CreateJobPageSelector> {
  CreateJobPageSelectorCubit cubit = getIt.get<CreateJobPageSelectorCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateJobPageSelectorCubit, CreateJobPageSelectorState>(
      bloc: cubit,
      builder: (context, state) {
        return Container();
      },
    );
  }
}
