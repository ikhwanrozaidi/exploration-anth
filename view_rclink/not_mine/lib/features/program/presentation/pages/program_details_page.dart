import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/features/company/presentation/bloc/company_state.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../bloc/program_view/program_view_bloc.dart';
import '../bloc/program_view/program_view_event.dart';
import '../bloc/program_view/program_view_state.dart';
import '../../domain/entities/program_entity.dart';
import '../widgets/details_of_work_widget.dart';
import '../widgets/program_details_overview_widget.dart';

class ProgramDetailsPage extends StatefulWidget {
  final String programId;
  final String? from;

  const ProgramDetailsPage({Key? key, required this.programId, this.from})
    : super(key: key);

  @override
  State<ProgramDetailsPage> createState() => _ProgramDetailsPageState();
}

class _ProgramDetailsPageState extends State<ProgramDetailsPage> {
  @override
  void initState() {
    super.initState();

    print('Program ID: ${widget.programId}');
    print('Came from: ${widget.from}');

    // Load program detail
    final companyUID = context.read<CompanyBloc>().state.maybeMap(
      loaded: (state) => state.selectedCompany?.uid,
      orElse: () => null,
    );

    if (companyUID != null) {
      getIt<ProgramViewBloc>().add(
        ProgramViewEvent.loadProgramDetail(
          companyUID: companyUID,
          programUID: widget.programId,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ProgramViewBloc>(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.2],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  SizedBox(height: ResponsiveHelper.getHeight(context, 0.02)),

                  // Header
                  Padding(
                    padding: ResponsiveHelper.padding(context, horizontal: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  style: IconButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors.white,
                                    padding: const EdgeInsets.all(5),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: primaryColor,
                                    size: ResponsiveHelper.iconSize(
                                      context,
                                      base: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: ResponsiveHelper.spacing(context, 10),
                                ),
                                Text(
                                  'Program',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              style: IconButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(5),
                              ),
                              onPressed: () {},
                              icon: Icon(
                                Icons.share_sharp,
                                color: primaryColor,
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ResponsiveHelper.spacing(context, 20)),
                      ],
                    ),
                  ),

                  // Body
                  Expanded(
                    child: Container(
                      padding: ResponsiveHelper.padding(
                        context,
                        horizontal: 20,
                        vertical: 20,
                      ),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, -2),
                          ),
                        ],
                      ),
                      child: BlocBuilder<ProgramViewBloc, ProgramViewState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () =>
                                const Center(child: Text('Loading...')),
                            loading: () => const SizedBox.shrink(),
                            loaded: (_, __, ___, ____) =>
                                const SizedBox.shrink(),
                            failure: (_) => const SizedBox.shrink(),
                            detailLoading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            detailLoaded: (program) =>
                                _buildProgramDetail(context, program),
                            detailFailure: (message) => Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 48,
                                    color: Colors.red,
                                  ),
                                  SizedBox(height: 16),
                                  Text(message),
                                  SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      final companyUID = context
                                          .read<CompanyBloc>()
                                          .state
                                          .maybeMap(
                                            loaded: (state) =>
                                                state.selectedCompany?.uid,
                                            orElse: () => null,
                                          );

                                      if (companyUID != null) {
                                        getIt<ProgramViewBloc>().add(
                                          ProgramViewEvent.loadProgramDetail(
                                            companyUID: companyUID,
                                            programUID: widget.programId,
                                            forceRefresh: true,
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text('Retry'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgramDetail(BuildContext context, Program program) {
    return ListView(
      children: [
        SizedBox(height: ResponsiveHelper.spacing(context, 5)),

        // Progress Section
        _buildProgressSection(context, program),

        SizedBox(height: ResponsiveHelper.spacing(context, 20)),

        // Overview Section - Using ProgramDetailsOverviewWidget
        ProgramDetailsOverviewWidget(program: program),

        SizedBox(height: ResponsiveHelper.spacing(context, 20)),

        // Others Section
        _buildOthersSection(context, program),
      ],
    );
  }

  Widget _buildProgressSection(BuildContext context, Program program) {
    return Container(
      padding: ResponsiveHelper.padding(context, vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: ResponsiveHelper.borderRadius(
                          context,
                          all: 6,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          program.workScope?.code ?? 'N/A',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        program.workScope?.name ?? 'N/A',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          dividerConfig(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Progress',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${program.totalReports ?? 0}/${program.requiredReportsCount ?? 0} Report',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: ResponsiveHelper.spacing(context, 8)),
              Container(
                height: ResponsiveHelper.spacing(context, 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor:
                      (program.requiredReportsCount != null &&
                          program.requiredReportsCount! > 0)
                      ? (program.totalReports ?? 0) /
                            program.requiredReportsCount!
                      : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOthersSection(BuildContext context, Program program) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Others',
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 14),
              fontWeight: FontWeight.w600,
            ),
          ),

          dividerConfig(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                // Update Program - Keep your exact UI
                GestureDetector(
                  onTap: () {
                    showFlexibleBottomsheet(
                      context: context,
                      title: 'Update Program',
                      attributes: ['Details of Work', 'Note'],
                      isRadio: false,
                      isNavigate: true,
                      onTap: (selectedOption) {
                        switch (selectedOption) {
                          case 'Details of Work':
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsOfWorkProgramWidget(),
                              ),
                            );
                            break;
                          case 'Note':
                            // Handle note
                            break;
                        }
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.edit_square,
                                color: primaryColor,
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ResponsiveHelper.spacing(context, 15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Update Program',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 12,
                                  ),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'For updating work information',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 11,
                                  ),
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: primaryColor.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: primaryColor,
                          size: ResponsiveHelper.iconSize(context, base: 20),
                        ),
                      ),
                    ],
                  ),
                ),

                dividerConfig(),

                // Remove Program
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.red.shade400,
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ResponsiveHelper.spacing(context, 15),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Remove Program',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 12,
                                  ),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red.shade400,
                                ),
                              ),
                              Text(
                                'Delete work program',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 11,
                                  ),
                                  color: Colors.red.shade400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.red.shade100,
                        ),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.red.shade400,
                          size: ResponsiveHelper.iconSize(context, base: 20),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
