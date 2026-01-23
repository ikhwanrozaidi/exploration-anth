import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/month_filter_widget.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../rbac/domain/constants/permission_codes.dart';
import '../../../rbac/presentation/bloc/rbac_bloc.dart';
import '../../../rbac/presentation/bloc/rbac_state.dart';
import '../../../warnings/presentation/widgets/no_access.dart';
import '../../../work_scope/presentation/bloc/work_scope_bloc.dart';
import '../../../work_scope/presentation/widgets/work_scope_bottom_sheet.dart';
import '../bloc/program_list/program_list_bloc.dart';
import '../bloc/program_list/program_list_event.dart';
import '../bloc/program_list/program_list_state.dart';
import '../widgets/program_list_widget.dart';
import 'program_creation_page.dart';
import 'view_program_draft_page.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProgramListBloc>(),
      child: const _ProgramPageContent(),
    );
  }
}

class _ProgramPageContent extends StatefulWidget {
  const _ProgramPageContent({Key? key}) : super(key: key);

  @override
  State<_ProgramPageContent> createState() => _ProgramPageContentState();
}

class _ProgramPageContentState extends State<_ProgramPageContent> {
  bool showActionRequired = true;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  late ScrollController _scrollController;
  // bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPrograms();
    });
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _loadPrograms() {
    final companyState = context.read<CompanyBloc>().state;
    if (companyState is! CompanyLoaded ||
        companyState.selectedCompany == null) {
      return;
    }

    final companyUID = companyState.selectedCompany!.uid;

    context.read<ProgramListBloc>().add(
      ProgramListEvent.loadPrograms(
        companyUID: companyUID,
        page: 1,
        limit: 10,
        forceRefresh: true,
      ),
    );
  }

  void toggleActionRequired() {
    setState(() {
      showActionRequired = !showActionRequired;
    });
  }

  void onMonthSelected(String from, String to) {
    setState(() {
      final fromDate = DateTime.parse(from);
      selectedMonth = fromDate.month;
      selectedYear = fromDate.year;
    });
    print('From: $from, To: $to');
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return BlocBuilder<RbacBloc, RbacState>(
      builder: (context, rbacState) {
        final hasPermission = rbacState.hasPermission(
          PermissionCodes.PROGRAM_VIEW,
        );

        return Scaffold(
          body: NoAccessOverlay(
            showOverlay: !hasPermission,
            backButton: true,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.2],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: ResponsiveHelper.getHeight(context, 0.02)),

                    // Header
                    _buildHeader(context),

                    SizedBox(height: 20),

                    // Body Container
                    Expanded(
                      child: Container(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title & Search Bar
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildTitleWithCount(context),

                                  // _buildSearchBar(context),
                                ],
                              ),
                            ),

                            // Month Filter
                            MonthFilter(
                              onMonthSelected: onMonthSelected,
                              primaryColor: primaryColor,
                            ),

                            // Filter Buttons & List
                            Expanded(
                              child: Padding(
                                padding: ResponsiveHelper.padding(
                                  context,
                                  all: 15,
                                ),
                                child: Column(
                                  children: [
                                    _buildFilterButtons(context, w),
                                    SizedBox(height: 20),

                                    // Program List Widget
                                    Expanded(child: ProgramListWidget()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Program',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: ResponsiveHelper.fontSize(context, base: 18),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ViewProgramDraftPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: primaryColor,
                  side: BorderSide(color: Colors.amber.shade800, width: 1.5),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Draft',
                  style: TextStyle(color: Colors.amber.shade800),
                ),
              ),
              SizedBox(width: 5),
              IconButton(
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(5),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgramCreationPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: primaryColor,
                  size: ResponsiveHelper.iconSize(context, base: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitleWithCount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
      child: Row(
        children: [
          Text(
            'All Reports',
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 15),
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
          BlocBuilder<ProgramListBloc, ProgramListState>(
            builder: (context, state) {
              final count = state.maybeWhen(
                loaded: (programs, _, __, ___) => programs.length,
                orElse: () => 0,
              );

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.grey.shade200,
      ),
      onPressed: () {
        CustomSnackBar.show(
          context,
          'This feature is coming soon...',
          type: SnackBarType.comingsoon,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 25),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: ResponsiveHelper.iconSize(context, base: 25),
              color: Colors.black.withOpacity(0.5),
            ),
            SizedBox(width: 20),
            Text(
              'Search contractor or district',
              style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: ResponsiveHelper.fontSize(context, base: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButtons(BuildContext context, double w) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Contractor Filter
        Expanded(
          child: _buildFilterButton(
            context: context,
            w: w,
            icon: Icons.person,
            label: 'Contractor',
            onPressed: () {
              CustomSnackBar.show(
                context,
                'This feature is coming soon...',
                type: SnackBarType.comingsoon,
              );
            },
          ),
        ),
        SizedBox(width: 10),

        // Scope Work Filter
        Expanded(
          child: _buildFilterButton(
            context: context,
            w: w,
            icon: Icons.restaurant_menu,
            label: 'Scope Work',
            onPressed: () {
              final workScopeBloc = context.read<WorkScopeBloc>();
              final workScopeState = workScopeBloc.state;

              showWorkScopeSelection(
                context: context,
                state: workScopeState,
                onScopeSelected: (selectedData) {
                  print('Selected UID: ${selectedData['uid']}');
                  print('Code: ${selectedData['code']}');
                  print('Name: ${selectedData['name']}');
                  print('Description: ${selectedData['description']}');
                  print(
                    'Allow Multiple Quantities: ${selectedData['allowMultipleQuantities']}',
                  );
                },
              );
            },
          ),
        ),
        SizedBox(width: 10),

        // Status Filter
        Expanded(
          child: _buildFilterButton(
            context: context,
            w: w,
            icon: Icons.grid_on,
            label: 'Status',
            onPressed: () {
              CustomSnackBar.show(
                context,
                'This feature is coming soon...',
                type: SnackBarType.comingsoon,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton({
    required BuildContext context,
    required double w,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Icon(icon, size: 10, color: Colors.black),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: w * 0.022,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.expand_more, size: 15, color: Colors.black),
        ],
      ),
    );
  }
}
