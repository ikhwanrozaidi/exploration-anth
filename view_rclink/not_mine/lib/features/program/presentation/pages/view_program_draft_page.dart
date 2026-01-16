// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';

// import '../../../../core/di/injection.dart';
// import '../../../../shared/utils/responsive_helper.dart';
// import '../../../../shared/utils/theme.dart';
// import '../../../../shared/widgets/custom_snackbar.dart';
// import '../../../../shared/widgets/template_page.dart';
// import '../../../company/presentation/bloc/company_bloc.dart';
// import '../../../company/presentation/bloc/company_state.dart';
// import '../../domain/entities/program_draft_data_entity.dart';
// import '../bloc/program_draft/program_draft_bloc.dart';
// import '../bloc/program_draft/program_draft_event.dart';
// import '../bloc/program_draft/program_draft_state.dart';
// import '../widgets/program_creation_draft_page.dart';
// import '../widgets/r02_program_creation_draft_page.dart';

// class ViewProgramDraftPage extends StatefulWidget {
//   const ViewProgramDraftPage({super.key});

//   @override
//   State<ViewProgramDraftPage> createState() => _ViewProgramDraftPageState();
// }

// class _ViewProgramDraftPageState extends State<ViewProgramDraftPage> {
//   late final ProgramDraftBloc _programDraftBloc;
//   late final CompanyBloc _companyBloc;

//   @override
//   void initState() {
//     super.initState();
//     _programDraftBloc = getIt<ProgramDraftBloc>();
//     _companyBloc = getIt<CompanyBloc>();
//     _loadDrafts();
//   }

//   void _loadDrafts() {
//     final companyState = _companyBloc.state;
//     if (companyState is CompanyLoaded && companyState.selectedCompany != null) {
//       _programDraftBloc.add(
//         ProgramDraftEvent.loadDraftList(
//           companyUID: companyState.selectedCompany!.uid,
//         ),
//       );
//     }
//   }

//   void _onDraftTapped(ProgramDraftData draft) async {
//     // Navigate to appropriate draft page based on work scope
//     final isR02 = draft.workScopeCode == 'R02';

//     if (isR02) {
//       // Navigate to R02 draft page
//       await Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => R02ProgramCreationDraftPage(
//             draftUID: draft.draftUID,
//             workScopeUID: draft.workScopeUID,
//             workScopeName: draft.workScopeName,
//             workScopeCode: draft.workScopeCode,
//             workScopeID: draft.workScopeID,
//             road: draft.road!,
//             section: draft.section!,
//           ),
//         ),
//       );
//     } else {
//       // Navigate to non-R02 draft page
//       await Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ProgramCreationDraftPage(
//             draftUID: draft.draftUID,
//             workScopeUID: draft.workScopeUID!,
//             workScopeName: draft.workScopeName!,
//             workScopeCode: draft.workScopeCode!,
//             workScopeID: draft.workScopeID!,
//             contractor: draft.contractor!,
//             selectedRoads: draft.roads ?? [],
//           ),
//         ),
//       );
//     }

//     // Reload drafts after returning
//     _loadDrafts();
//   }

//   void _onDeleteDraft(ProgramDraftData draft) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Delete Draft'),
//         content: const Text('Are you sure you want to delete this draft?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _programDraftBloc.add(const ProgramDraftEvent.deleteDraft());
//               CustomSnackBar.show(
//                 context,
//                 'Draft deleted successfully',
//                 type: SnackBarType.success,
//               );
//               _loadDrafts();
//             },
//             style: TextButton.styleFrom(foregroundColor: Colors.red),
//             child: const Text('Delete'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TemplatePage(
//       pageTitle: 'Draft Programs',
//       body: BlocBuilder<ProgramDraftBloc, ProgramDraftState>(
//         bloc: _programDraftBloc,
//         builder: (context, state) {
//           return state.when(
//             initial: () => const Center(child: Text('No drafts loaded')),
//             loading: () => Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(color: primaryColor),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Loading drafts...',
//                     style: TextStyle(
//                       fontSize: ResponsiveHelper.fontSize(context, base: 14),
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             draftListLoaded: (drafts) {
//               if (drafts.isEmpty) {
//                 return Center(
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 100),
//                       Lottie.asset(
//                         'assets/lottie/no_record.json',
//                         width: 200,
//                         height: 200,
//                         fit: BoxFit.contain,
//                       ),
//                       const Text(
//                         'No program drafts found',
//                         style: TextStyle(fontSize: 15, color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 );
//               }

//               return RefreshIndicator(
//                 onRefresh: () async {
//                   _loadDrafts();
//                 },
//                 child: ListView.separated(
//                   padding: const EdgeInsets.all(20),
//                   itemCount: drafts.length,
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(height: 15),
//                   itemBuilder: (context, index) {
//                     final draft = drafts[index];
//                     return _DraftProgramCard(
//                       draft: draft,
//                       onTap: () => _onDraftTapped(draft),
//                       onDelete: () => _onDeleteDraft(draft),
//                     );
//                   },
//                 ),
//               );
//             },
//             error: (failure) => Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.error_outline,
//                     size: 80,
//                     color: Colors.red.shade300,
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Error loading drafts',
//                     style: TextStyle(
//                       fontSize: ResponsiveHelper.fontSize(context, base: 16),
//                       fontWeight: FontWeight.w600,
//                       color: Colors.red.shade600,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     failure.message,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: ResponsiveHelper.fontSize(context, base: 14),
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton.icon(
//                     onPressed: _loadDrafts,
//                     icon: const Icon(Icons.refresh),
//                     label: const Text('Retry'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: primaryColor,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             editing: (draftData) => const SizedBox(),
//             autoSaving: (draftData) => const SizedBox(),
//             autoSaved: (draftData) => const SizedBox(),
//             submitting: () => const SizedBox(),
//             submitted: (program) => const SizedBox(),
//           );
//         },
//       ),
//     );
//   }
// }

// class _DraftProgramCard extends StatelessWidget {
//   final ProgramDraftData draft;
//   final VoidCallback onTap;
//   final VoidCallback onDelete;

//   const _DraftProgramCard({
//     required this.draft,
//     required this.onTap,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final updatedDate = draft.updatedAt != null
//         ? DateFormat('d MMM yyyy, HH:mm').format(draft.updatedAt!)
//         : 'N/A';

//     // Build road info text
//     String roadInfo = '';
//     if (draft.workScopeCode == 'R02') {
//       // R02 - single road
//       roadInfo = draft.road != null
//           ? '${draft.road!.roadNo ?? ''} ${draft.road!.name ?? ''}'
//           : 'No road';
//     } else {
//       // Non-R02 - multiple roads
//       final roadCount = draft.roads?.length ?? 0;
//       roadInfo = '$roadCount Route${roadCount != 1 ? 's' : ''}';
//     }

//     // Build period info
//     String periodInfo = '';
//     if (draft.periodStart != null && draft.periodEnd != null) {
//       final start = DateFormat('MMM yyyy').format(draft.periodStart!);
//       final end = DateFormat('MMM yyyy').format(draft.periodEnd!);
//       periodInfo = start == end ? start : '$start - $end';
//     }

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 5,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header row with badge and date
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 5,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.orange,
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: Text(
//                       'DRAFT',
//                       style: TextStyle(
//                         fontSize: ResponsiveHelper.fontSize(context, base: 10),
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   if (draft.updatedAt != null)
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10,
//                         vertical: 5,
//                       ),
//                       decoration: BoxDecoration(
//                         color: primaryColor.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Text(
//                         DateFormat('d MMM').format(draft.updatedAt!),
//                         style: TextStyle(
//                           fontSize: ResponsiveHelper.fontSize(
//                             context,
//                             base: 11,
//                           ),
//                           fontWeight: FontWeight.w600,
//                           color: primaryColor,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               // Work Scope badge and name
//               Row(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 6,
//                     ),
//                     decoration: BoxDecoration(
//                       color: primaryColor,
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     child: Text(
//                       draft.workScopeCode ?? 'N/A',
//                       style: TextStyle(
//                         fontSize: ResponsiveHelper.fontSize(context, base: 12),
//                         fontWeight: FontWeight.w700,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Text(
//                       draft.workScopeName ?? 'Unknown Work Scope',
//                       style: TextStyle(
//                         fontSize: ResponsiveHelper.fontSize(context, base: 15),
//                         fontWeight: FontWeight.w600,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 12),

//               // Road info
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.location_on,
//                     color: Colors.black87,
//                     size: 18,
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: Text(
//                       roadInfo,
//                       style: TextStyle(
//                         fontSize: ResponsiveHelper.fontSize(context, base: 13),
//                         fontWeight: FontWeight.w500,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),

//               // Section info (R02 only)
//               if (draft.workScopeCode == 'R02' && draft.section != null) ...[
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.straighten,
//                       color: Colors.black87,
//                       size: 18,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       'Section: ${draft.section}',
//                       style: TextStyle(
//                         fontSize: ResponsiveHelper.fontSize(context, base: 13),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],

//               // Period info
//               if (periodInfo.isNotEmpty) ...[
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.calendar_today,
//                       color: Colors.black87,
//                       size: 18,
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       periodInfo,
//                       style: TextStyle(
//                         fontSize: ResponsiveHelper.fontSize(context, base: 13),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],

//               // Contractor info
//               if (draft.contractor != null) ...[
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     const Icon(Icons.business, color: Colors.black87, size: 18),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         draft.contractor!.name,
//                         style: TextStyle(
//                           fontSize: ResponsiveHelper.fontSize(
//                             context,
//                             base: 13,
//                           ),
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],

//               const SizedBox(height: 12),

//               // Footer with updated date and delete button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Updated: $updatedDate',
//                     style: TextStyle(
//                       fontSize: ResponsiveHelper.fontSize(context, base: 11),
//                       color: Colors.grey.shade600,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: onDelete,
//                     icon: const Icon(Icons.delete_outline),
//                     color: Colors.red,
//                     iconSize: 20,
//                     padding: EdgeInsets.zero,
//                     constraints: const BoxConstraints(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
