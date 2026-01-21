import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rclink_app/shared/widgets/template_page.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../road/domain/entities/district_entity.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../bloc/program_draft/program_draft_bloc.dart';
import '../bloc/program_draft/program_draft_event.dart';
import '../bloc/program_draft/program_draft_state.dart';
import '../widgets/program_creation_draft_page.dart';
import '../widgets/r02_program_creation_draft_page.dart';

class ViewProgramDraftPage extends StatefulWidget {
  const ViewProgramDraftPage({super.key});

  @override
  State<ViewProgramDraftPage> createState() => _ViewProgramDraftPageState();
}

class _ViewProgramDraftPageState extends State<ViewProgramDraftPage> {
  late final ProgramDraftBloc _programDraftBloc;
  late final CompanyBloc _companyBloc;

  @override
  void initState() {
    super.initState();
    _programDraftBloc = getIt<ProgramDraftBloc>();
    _companyBloc = getIt<CompanyBloc>();
    _loadDrafts();
  }

  void _loadDrafts() {
    final companyState = _companyBloc.state;
    if (companyState is CompanyLoaded && companyState.selectedCompany != null) {
      _programDraftBloc.add(
        ProgramDraftEvent.loadDraftList(
          companyUID: companyState.selectedCompany!.uid,
        ),
      );
    }
  }

  void _onDraftTapped(ProgramRecord draft) async {
    print('📂 Opening draft: ${draft.uid}');

    // Parse work scope data
    String workScopeUID = '';
    String workScopeName = '';
    String workScopeCode = '';
    if (draft.workScopeData != null && draft.workScopeData!.isNotEmpty) {
      try {
        final workScopeJson =
            json.decode(draft.workScopeData!) as Map<String, dynamic>;
        workScopeUID = workScopeJson['uid']?.toString() ?? '';
        workScopeName = workScopeJson['name']?.toString() ?? '';
        workScopeCode = workScopeJson['code']?.toString() ?? '';
      } catch (e) {
        print('⚠️ Error parsing workScopeData: $e');
      }
    }

    // Parse contractor data
    ContractorRelation contractor = const ContractorRelation(
      uid: '',
      id: 0,
      name: '',
    );
    if (draft.contractRelationData != null &&
        draft.contractRelationData!.isNotEmpty) {
      try {
        final contractorJson =
            json.decode(draft.contractRelationData!) as Map<String, dynamic>;
        contractor = ContractorRelation(
          id: contractorJson['id'],
          uid: contractorJson['uid']?.toString() ?? '',
          contractRelationUID: contractorJson['contractRelationUID']
              ?.toString(),
          name: contractorJson['name']?.toString() ?? '',
          regNo: contractorJson['regNo']?.toString(),
        );
      } catch (e) {
        print('⚠️ Error parsing contractRelationData: $e');
      }
    }

    // Parse roads data
    List<Road> roads = [];
    Road? singleRoad;

    if (draft.roadData != null && draft.roadData!.isNotEmpty) {
      try {
        final roadDataDecoded = json.decode(draft.roadData!);

        if (roadDataDecoded is List) {
          // Multi-road draft
          roads = roadDataDecoded.map<Road>((roadJson) {
            return Road(
              id: roadJson['id'],
              uid: roadJson['uid']?.toString() ?? '',
              name: roadJson['name']?.toString() ?? '',
              roadNo: roadJson['roadNo']?.toString(),
              sectionStart: roadJson['sectionStart'] != null
                  ? (roadJson['sectionStart'] as num).toDouble()
                  : null,
              sectionFinish: roadJson['sectionFinish'] != null
                  ? (roadJson['sectionFinish'] as num).toDouble()
                  : null,
              district: roadJson['district'] != null
                  ? District(
                      id: roadJson['district']['id'],
                      uid: roadJson['district']['uid']?.toString() ?? '',
                      name: roadJson['district']['name']?.toString() ?? '',
                    )
                  : null,
            );
          }).toList();
        } else if (roadDataDecoded is Map) {
          // Single road (R02)
          singleRoad = Road(
            id: roadDataDecoded['id'],
            uid: roadDataDecoded['uid']?.toString() ?? '',
            name: roadDataDecoded['name']?.toString() ?? '',
            roadNo: roadDataDecoded['roadNo']?.toString(),
            sectionStart: roadDataDecoded['sectionStart'] != null
                ? (roadDataDecoded['sectionStart'] as num).toDouble()
                : null,
            sectionFinish: roadDataDecoded['sectionFinish'] != null
                ? (roadDataDecoded['sectionFinish'] as num).toDouble()
                : null,
            district: roadDataDecoded['district'] != null
                ? District(
                    id: roadDataDecoded['district']['id'],
                    uid: roadDataDecoded['district']['uid']?.toString() ?? '',
                    name: roadDataDecoded['district']['name']?.toString() ?? '',
                  )
                : null,
          );
        }
      } catch (e) {
        print('⚠️ Error parsing roadData: $e');
      }
    }

    // Determine if it's R02 or multi-road based on workScopeCode
    final isR02 = workScopeCode == 'R02';

    Widget draftPage;

    if (isR02) {
      // Parse section data for R02
      double? section;
      if (draft.fromSection != null) {
        section = double.tryParse(draft.fromSection!);
      }

      // Navigate to R02 draft page with road and section
      draftPage = R02ProgramCreationDraftPage(
        draftUID: draft.uid,
        road: singleRoad, // Already parsed above
        section: section,
      );
    } else {
      // Navigate to multi-road draft page
      draftPage = ProgramCreationDraftPage(
        draftUID: draft.uid,
        workScopeUID: workScopeUID,
        workScopeName: workScopeName,
        workScopeCode: workScopeCode,
        workScopeID: draft.workScopeID,
        contractor: contractor,
        selectedRoads: roads,
      );
    }

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => draftPage),
    );

    // Reload drafts after returning
    _loadDrafts();
  }

  void _onDeleteDraft(ProgramRecord draft) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Draft'),
        content: Text(
          'Are you sure you want to delete this draft?',
          style: TextStyle(
            fontSize: ResponsiveHelper.fontSize(context, base: 14),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _programDraftBloc.add(
                ProgramDraftEvent.deleteDraft(draftUID: draft.uid),
              );
              CustomSnackBar.show(
                context,
                'Draft deleted successfully',
                type: SnackBarType.success,
              );

              // Reload drafts after deletion
              Future.delayed(const Duration(milliseconds: 500), () {
                _loadDrafts();
              });
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      pageTitle: 'Draft Programs',
      body: BlocBuilder<ProgramDraftBloc, ProgramDraftState>(
        bloc: _programDraftBloc,
        builder: (context, state) {
          return state.when(
            initial: () => _buildEmptyState(),
            loading: () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: primaryColor),
                  const SizedBox(height: 20),
                  Text(
                    'Loading drafts...',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            draftListLoaded: (drafts) {
              if (drafts.isEmpty) {
                return _buildEmptyState();
              }

              return RefreshIndicator(
                onRefresh: () async {
                  _loadDrafts();
                },
                child: ListView.separated(
                  padding: ResponsiveHelper.padding(context, all: 20),
                  itemCount: drafts.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: ResponsiveHelper.spacing(context, 15)),
                  itemBuilder: (context, index) {
                    final draft = drafts[index];
                    return _ProgramDraftCard(
                      draft: draft,
                      onTap: () => _onDraftTapped(draft),
                      onDelete: () => _onDeleteDraft(draft),
                    );
                  },
                ),
              );
            },
            editing: (draftData) => _buildEmptyState(),
            autoSaving: (draftData) => _buildEmptyState(),
            autoSaved: (draftData) => _buildEmptyState(),
            submitting: (draftData) => _buildEmptyState(),
            submitted: (draftData) => _buildEmptyState(),
            error: (failure, draftData) => Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 64,
                      color: Colors.red.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Failed to load drafts',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 16),
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      failure.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _loadDrafts,
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
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.description_outlined,
              size: 80,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 24),
            Text(
              'No Draft Programs',
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 18),
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your draft programs will appear here',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 14),
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// List Drafts
class _ProgramDraftCard extends StatelessWidget {
  final ProgramRecord draft;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _ProgramDraftCard({
    Key? key,
    required this.draft,
    required this.onTap,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String workScopeCode = 'N/A';
    String workScopeName = 'N/A';

    if (draft.workScopeData != null && draft.workScopeData!.isNotEmpty) {
      try {
        // Simple parsing for code and name
        final data = draft.workScopeData!;
        final codeMatch = RegExp(r'"code":"([^"]+)"').firstMatch(data);
        final nameMatch = RegExp(r'"name":"([^"]+)"').firstMatch(data);

        if (codeMatch != null) workScopeCode = codeMatch.group(1)!;
        if (nameMatch != null) workScopeName = nameMatch.group(1)!;
      } catch (e) {
        print('⚠️ Error parsing work scope data: $e');
      }
    }

    // Format dates
    final createdDate = draft.createdAt;
    final formattedDate = DateFormat(
      'MMM dd, yyyy • hh:mm a',
    ).format(createdDate);
    final timeAgo = _getTimeAgo(createdDate);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: ResponsiveHelper.padding(context, all: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: ResponsiveHelper.padding(context, all: 8),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.drafts,
                    color: Colors.amber.shade800,
                    size: ResponsiveHelper.iconSize(context, base: 20),
                  ),
                ),
                SizedBox(width: ResponsiveHelper.spacing(context, 12)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Draft Program',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 12,
                          ),
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        draft.name ?? 'Untitled Program',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.red.shade400,
                    size: ResponsiveHelper.iconSize(context, base: 20),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.red.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),

            Divider(height: 24, color: Colors.grey.shade200),

            // Content
            _buildInfoRow(
              context,
              icon: Icons.work_outline,
              label: 'Work Scope',
              value: '$workScopeCode - $workScopeName',
            ),

            _buildRoadInfo(context, draft),

            if (draft.fromSection != null && draft.toSection != null) ...[
              SizedBox(height: 8),
              _buildInfoRow(
                context,
                icon: Icons.swap_calls,
                label: 'Section',
                value: '${draft.fromSection} - ${draft.toSection}',
              ),
            ],

            if (draft.description != null && draft.description!.isNotEmpty) ...[
              SizedBox(height: 8),
              _buildInfoRow(
                context,
                icon: Icons.description,
                label: 'Description',
                value: draft.description!,
                maxLines: 2,
              ),
            ],

            Divider(height: 24, color: Colors.grey.shade200),

            // Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: ResponsiveHelper.iconSize(context, base: 14),
                      color: Colors.grey.shade500,
                    ),
                    SizedBox(width: 4),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 12),
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: onTap,
                  icon: Icon(
                    Icons.edit,
                    size: ResponsiveHelper.iconSize(context, base: 16),
                  ),
                  label: const Text('Continue'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: ResponsiveHelper.padding(
                      context,
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
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

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    int maxLines = 1,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: ResponsiveHelper.iconSize(context, base: 16),
          color: Colors.grey.shade600,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 11),
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 13),
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 7) {
      return DateFormat('MMM dd, yyyy').format(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }

  Widget _buildRoadInfo(BuildContext context, ProgramRecord draft) {
    // Parse road data
    String roadDisplay = 'No roads';
    String districtDisplay = '';
    String sectionDisplay = '';

    if (draft.roadData != null && draft.roadData!.isNotEmpty) {
      try {
        final roadDataDecoded = json.decode(draft.roadData!);

        if (roadDataDecoded is List) {
          // Multi-road program
          final roadCount = roadDataDecoded.length;

          if (roadCount > 0) {
            final firstRoad = roadDataDecoded[0];
            final roadName = firstRoad['name'] ?? 'Unnamed';
            final roadNo = firstRoad['roadNo'] ?? 'N/A';
            final district = firstRoad['district'];

            if (roadCount == 1) {
              roadDisplay = '$roadNo - $roadName';
              districtDisplay = district != null ? district['name'] ?? '' : '';
            } else {
              roadDisplay = '$roadNo - $roadName (+${roadCount - 1} more)';
              districtDisplay = district != null ? district['name'] ?? '' : '';
            }
          }
        } else if (roadDataDecoded is Map) {
          // Single road (R02)
          final roadName = roadDataDecoded['name'] ?? 'Unnamed';
          final roadNo = roadDataDecoded['roadNo'] ?? 'N/A';
          final district = roadDataDecoded['district'];

          roadDisplay = '$roadNo - $roadName';
          districtDisplay = district != null ? district['name'] ?? '' : '';

          // Add section information for R02
          if (draft.fromSection != null || draft.toSection != null) {
            final from = draft.fromSection ?? '0';
            final to = draft.toSection ?? '0';
            sectionDisplay = 'Section: $from - $to';
          }
        }
      } catch (e) {
        print('⚠️ Error parsing roadData in draft card: $e');
        roadDisplay = 'Error loading roads';
      }
    }

    return Column(
      children: [
        _buildInfoRow(
          context,
          icon: Icons.location_on,
          label: districtDisplay.isNotEmpty ? districtDisplay : 'Route',
          value: roadDisplay,
        ),
        if (sectionDisplay.isNotEmpty) ...[
          SizedBox(height: ResponsiveHelper.spacing(context, 8)),
          _buildInfoRow(
            context,
            icon: Icons.straighten,
            label: 'Section',
            value: sectionDisplay,
          ),
        ],
      ],
    );
  }
}
