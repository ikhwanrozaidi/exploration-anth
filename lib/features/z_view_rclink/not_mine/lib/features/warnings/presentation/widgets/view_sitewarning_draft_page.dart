import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/template_page.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../../domain/entities/warning.dart';
import '../bloc/site_warning_draft/site_warning_draft_bloc.dart';
import '../bloc/site_warning_draft/site_warning_draft_event.dart';
import '../bloc/site_warning_draft/site_warning_draft_state.dart';
import '../pages/warning_draft_page.dart';

class ViewSitewarningDraftPage extends StatefulWidget {
  const ViewSitewarningDraftPage({super.key});

  @override
  State<ViewSitewarningDraftPage> createState() =>
      _ViewSitewarningDraftPageState();
}

class _ViewSitewarningDraftPageState extends State<ViewSitewarningDraftPage> {
  late final SiteWarningDraftBloc _siteWarningDraftBloc;
  late final CompanyBloc _companyBloc;

  @override
  void initState() {
    super.initState();
    _siteWarningDraftBloc = getIt<SiteWarningDraftBloc>();
    _companyBloc = getIt<CompanyBloc>();
    _loadDrafts();
  }

  void _loadDrafts() {
    final companyState = _companyBloc.state;
    if (companyState is CompanyLoaded && companyState.selectedCompany != null) {
      _siteWarningDraftBloc.add(
        SiteWarningDraftEvent.loadDraftList(
          companyUID: companyState.selectedCompany!.uid,
        ),
      );
    }
  }

  void _onDraftTapped(Warning draft) async {
    // Extract data from draft for navigation
    final scopeUID = draft.workScope?.uid ?? '';
    final scopeName = draft.workScope?.name ?? 'Unknown Scope';

    // Convert RoadResponse to Road entity
    Road? road;
    if (draft.road != null) {
      road = Road(
        id: null,
        uid: draft.road!.uid,
        name: draft.road!.name,
        roadNo: draft.road!.roadNo,
        sectionStart: null,
        sectionFinish: null,
        mainCategory: null,
        secondaryCategory: null,
        district: null,
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
      );
    }

    final startSection = draft.fromSection ?? '';
    final endSection = draft.toSection;

    // Navigate to WarningDraftPage with draft UID AND all required data
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WarningDraftPage(
          draftUID: draft.uid,
          scopeID: scopeUID,
          scopeName: scopeName,
          road: road,
          startSection: startSection,
          endSection: endSection,
        ),
      ),
    );

    // Reload drafts if draft was submitted/deleted
    if (result == true) {
      _loadDrafts();
    }
  }

  void _onDeleteDraft(Warning draft) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Draft'),
        content: const Text('Are you sure you want to delete this draft?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _siteWarningDraftBloc.add(
                SiteWarningDraftEvent.deleteDraft(draftUID: draft.uid),
              );
              CustomSnackBar.show(
                context,
                'Draft deleted successfully',
                // backgroundColor: Colors.green,
              );
              _loadDrafts();
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
      pageTitle: 'Draft Site Warning',
      body: BlocBuilder<SiteWarningDraftBloc, SiteWarningDraftState>(
        bloc: _siteWarningDraftBloc,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('No drafts loaded')),
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
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inbox_outlined,
                        size: 80,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'No draft warnings',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 16,
                          ),
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Create a new warning to see it here',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  _loadDrafts();
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: drafts.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 15),
                  itemBuilder: (context, index) {
                    final draft = drafts[index];
                    return _DraftWarningCard(
                      draft: draft,
                      onTap: () => _onDraftTapped(draft),
                      onDelete: () => _onDeleteDraft(draft),
                    );
                  },
                ),
              );
            },
            error: (failure, draftData) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.red.shade300,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Error loading drafts',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 16),
                      fontWeight: FontWeight.w600,
                      color: Colors.red.shade600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    failure.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _loadDrafts,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Ignore other states
            editing: (draftData) => const SizedBox(),
            autoSaving: (draftData) => const SizedBox(),
            autoSaved: (draftData) => const SizedBox(),
            submitting: (draftData) => const SizedBox(),
            submitted: (draftData) => const SizedBox(),
          );
        },
      ),
    );
  }
}

class _DraftWarningCard extends StatelessWidget {
  final Warning draft;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _DraftWarningCard({
    required this.draft,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    // Format date
    final updatedDate = DateFormat('d MMM yyyy, HH:mm').format(draft.updatedAt);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: 170,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Stack(
                children: [
                  // Placeholder
                  Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey.shade400,
                    ),
                  ),

                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),

                  // Badges
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'DRAFT',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 10,
                              ),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            DateFormat('d MMM').format(draft.updatedAt),
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 11,
                              ),
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (draft.company != null)
                    Text(
                      draft.company!.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.fontSize(context, base: 15),
                      ),
                    ),
                  const SizedBox(height: 10),
                  if (draft.road != null)
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (draft.road!.districtName != null)
                                Text(
                                  draft.road!.districtName!,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 12,
                                    ),
                                  ),
                                ),
                              Text(
                                '${draft.road!.roadNo ?? ''} ${draft.road!.name}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 13,
                                  ),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.swap_calls,
                        color: Colors.black,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        draft.toSection != null
                            ? '${draft.fromSection} - ${draft.toSection}'
                            : draft.fromSection ?? 'No section',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Updated: $updatedDate',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 11,
                          ),
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      IconButton(
                        onPressed: onDelete,
                        icon: const Icon(Icons.delete_outline),
                        color: Colors.red,
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
