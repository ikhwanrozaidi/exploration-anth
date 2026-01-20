import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../../routes/app_router.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/program_entity.dart';
import '../bloc/program_list/program_list_bloc.dart';
import '../bloc/program_list/program_list_event.dart';
import '../bloc/program_list/program_list_state.dart';

class ProgramListWidget extends StatelessWidget {
  const ProgramListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramListBloc, ProgramListState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Pull to refresh')),
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: CircularProgressIndicator(),
            ),
          ),
          loaded: (programs, currentPage, hasMore, isLoadingMore) {
            if (programs.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: 64,
                        color: Colors.grey.shade400,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'No record of your programs',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 16,
                          ),
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Create a new program to get started',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 13,
                          ),
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                final companyUID = context.read<CompanyBloc>().state.maybeMap(
                  loaded: (state) => state.selectedCompany?.uid,
                  orElse: () => null,
                );

                if (companyUID != null) {
                  getIt<ProgramListBloc>().add(
                    ProgramListEvent.refreshPrograms(companyUID: companyUID),
                  );
                }
              },
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: programs.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: ResponsiveHelper.spacing(context, 15)),
                itemBuilder: (context, index) {
                  final program = programs[index];
                  return _ProgramCard(program: program);
                },
              ),
            );
          },
          failure: (message) => Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red.shade700,
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final companyUID = context
                          .read<CompanyBloc>()
                          .state
                          .maybeMap(
                            loaded: (state) => state.selectedCompany?.uid,
                            orElse: () => null,
                          );

                      if (companyUID != null) {
                        getIt<ProgramListBloc>().add(
                          ProgramListEvent.loadPrograms(
                            companyUID: companyUID,
                            page: 1,
                            limit: 10,
                            forceRefresh: true,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      padding: ResponsiveHelper.padding(
                        context,
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final Program program;

  const _ProgramCard({Key? key, required this.program}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          AppRouteName.programDetail,
          pathParameters: {'programId': program.uid ?? ''},
          queryParameters: {'from': 'programs'},
        );
      },
      child: Container(
        padding: ResponsiveHelper.padding(
          context,
          vertical: 20,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: ResponsiveHelper.padding(context, all: 12),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      program.workScope?.code ?? 'N/A',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: ResponsiveHelper.fontSize(context, base: 13),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        program.contractRelation?.contractorCompany?.name ??
                            'N/A',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 13,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.swap_calls,
                            size: ResponsiveHelper.iconSize(context, base: 16),
                            color: Colors.black,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '${program.fromSection ?? 'N/A'} - ${program.toSection ?? 'N/A'}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Divider(height: 40, color: Colors.grey.shade300, thickness: 1),

            // Location Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: Colors.black,
                    size: ResponsiveHelper.iconSize(context, base: 20),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          program.road?.district?.name ?? 'N/A',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 12,
                            ),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '${program.road?.roadNo ?? 'N/A'} - ${program.road?.name ?? 'N/A'}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(height: 40, color: Colors.grey.shade300, thickness: 1),

            // Progress Row
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
                      '${program.totalReports ?? 0}/${program.requiredReportsCount ?? 0}',
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
      ),
    );
  }
}
