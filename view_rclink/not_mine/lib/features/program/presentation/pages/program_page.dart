import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rclink_app/features/company/presentation/bloc/company_state.dart';
import 'package:rclink_app/features/program/presentation/pages/program_creation_page.dart';
import 'package:rclink_app/features/warnings/presentation/widgets/no_access.dart';
import 'package:rclink_app/shared/widgets/coming_soon_overlay.dart';

import '../../../../core/di/injection.dart';
import '../../../../routes/app_router.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../rbac/domain/constants/permission_codes.dart';
import '../../../rbac/presentation/bloc/rbac_bloc.dart';
import '../../../rbac/presentation/bloc/rbac_state.dart';
import '../../../work_scope/presentation/bloc/work_scope_bloc.dart';
import '../../../work_scope/presentation/widgets/work_scope_bottom_sheet.dart';
import '../../../../shared/widgets/month_filter_widget.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../bloc/program_view/program_view_bloc.dart';
import '../bloc/program_view/program_view_event.dart';
import '../bloc/program_view/program_view_state.dart';

class ProgramPage extends StatefulWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  bool showActionRequired = true;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  @override
  void initState() {
    super.initState();

    // Load programs when page initializes
    final companyUID = context.read<CompanyBloc>().state.maybeMap(
      loaded: (state) => state.selectedCompany?.uid,
      orElse: () => null,
    );

    if (companyUID != null) {
      getIt<ProgramViewBloc>().add(
        ProgramViewEvent.loadPrograms(
          companyUID: companyUID,
          page: 1,
          limit: 10,
        ),
      );
    }
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

    double bottomContainerHeight = showActionRequired
        ? MediaQuery.of(context).size.height * 0.76
        : MediaQuery.of(context).size.height * 0.70;

    return BlocProvider.value(
      value: getIt<ProgramViewBloc>(),
      child: BlocBuilder<RbacBloc, RbacState>(
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
                child: Stack(
                  children: [
                    SafeArea(
                      child: Column(
                        children: [
                          SizedBox(
                            height: ResponsiveHelper.getHeight(context, 0.02),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Program',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 18,
                                    ),
                                  ),
                                ),

                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: primaryColor,
                                        side: BorderSide(
                                          color: Colors.amber.shade800,
                                          width: 1.5,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 5,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Draft',
                                        style: TextStyle(
                                          color: Colors.amber.shade800,
                                        ),
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
                                            builder: (context) =>
                                                ProgramCreationPage(),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: primaryColor,
                                        size: ResponsiveHelper.iconSize(
                                          context,
                                          base: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

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
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10.0,
                                            left: 10.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'All Reports',
                                                style: TextStyle(
                                                  fontSize:
                                                      ResponsiveHelper.fontSize(
                                                        context,
                                                        base: 15,
                                                      ),
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              BlocBuilder<
                                                ProgramViewBloc,
                                                ProgramViewState
                                              >(
                                                builder: (context, state) {
                                                  final count = state.maybeWhen(
                                                    loaded:
                                                        (
                                                          programs,
                                                          _,
                                                          __,
                                                          ___,
                                                        ) => programs.length,
                                                    orElse: () => 0,
                                                  );

                                                  return Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 15,
                                                          vertical: 4,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            100,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      '$count',
                                                      style: TextStyle(
                                                        color: Colors.amber,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(
                                          height: ResponsiveHelper.spacing(
                                            context,
                                            15,
                                          ),
                                        ),

                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            backgroundColor:
                                                Colors.grey.shade200,
                                          ),
                                          onPressed: () {
                                            CustomSnackBar.show(
                                              context,
                                              'This feature is coming soon...',
                                              type: SnackBarType.comingsoon,
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 11,
                                              horizontal: 25,
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.search,
                                                  size:
                                                      ResponsiveHelper.iconSize(
                                                        context,
                                                        base: 25,
                                                      ),
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),

                                                SizedBox(width: 20),

                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Search contractor or district',
                                                      style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontSize:
                                                            ResponsiveHelper.fontSize(
                                                              context,
                                                              base: 13,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  MonthFilter(
                                    onMonthSelected: onMonthSelected,
                                    primaryColor: primaryColor,
                                  ),

                                  Expanded(
                                    child: Padding(
                                      padding: ResponsiveHelper.padding(
                                        context,
                                        all: 15,
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Contractor
                                              Expanded(
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 15,
                                                        ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            50,
                                                          ),
                                                      side: BorderSide(
                                                        color: Colors
                                                            .grey
                                                            .shade300,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    CustomSnackBar.show(
                                                      context,
                                                      'This feature is coming soon...',
                                                      type: SnackBarType
                                                          .comingsoon,
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.person,
                                                            size: 10,
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text(
                                                            'Contractor',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  w * 0.022,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.expand_more,
                                                        size: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              SizedBox(width: 10),

                                              // Scope Work
                                              Expanded(
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 15,
                                                        ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            50,
                                                          ),
                                                      side: BorderSide(
                                                        color: Colors
                                                            .grey
                                                            .shade300,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    final workScopeBloc =
                                                        context
                                                            .read<
                                                              WorkScopeBloc
                                                            >();
                                                    final workScopeState =
                                                        workScopeBloc.state;

                                                    showWorkScopeSelection(
                                                      context: context,
                                                      state: workScopeState,
                                                      onScopeSelected: (selectedData) {
                                                        print(
                                                          'Selected UID: ${selectedData['uid']}',
                                                        );
                                                        print(
                                                          'Code: ${selectedData['code']}',
                                                        );
                                                        print(
                                                          'Name: ${selectedData['name']}',
                                                        );
                                                        print(
                                                          'Description: ${selectedData['description']}',
                                                        );
                                                        print(
                                                          'Allow Multiple Quantities: ${selectedData['allowMultipleQuantities']}',
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .restaurant_menu,
                                                              size: 10,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            SizedBox(width: 5),
                                                            Expanded(
                                                              child: Text(
                                                                'Scope Work',
                                                                style: TextStyle(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      w * 0.022,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.expand_more,
                                                        size: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              SizedBox(width: 10),

                                              // Status
                                              Expanded(
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 15,
                                                        ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            50,
                                                          ),
                                                      side: BorderSide(
                                                        color: Colors
                                                            .grey
                                                            .shade300,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    CustomSnackBar.show(
                                                      context,
                                                      'This feature is coming soon...',
                                                      type: SnackBarType
                                                          .comingsoon,
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.grid_on,
                                                            size: 10,
                                                            color: Colors.black,
                                                          ),
                                                          SizedBox(width: 5),
                                                          Text(
                                                            'Status',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  w * 0.022,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Icon(
                                                        Icons.expand_more,
                                                        size: 15,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 20),

                                          // Program List
                                          Expanded(
                                            child: BlocBuilder<ProgramViewBloc, ProgramViewState>(
                                              builder: (context, state) {
                                                return state.when(
                                                  initial: () => const Center(
                                                    child: Text(
                                                      'Pull to refresh',
                                                    ),
                                                  ),
                                                  loading: () => const Center(
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                        50.0,
                                                      ),
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                  loaded:
                                                      (
                                                        programs,
                                                        currentPage,
                                                        hasMore,
                                                        isLoadingMore,
                                                      ) {
                                                        if (programs.isEmpty) {
                                                          return const Center(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                    50.0,
                                                                  ),
                                                              child: Text(
                                                                'No programs found',
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        return ListView.separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          itemCount:
                                                              programs.length,
                                                          separatorBuilder:
                                                              (
                                                                context,
                                                                index,
                                                              ) => SizedBox(
                                                                height:
                                                                    ResponsiveHelper.spacing(
                                                                      context,
                                                                      15,
                                                                    ),
                                                              ),
                                                          itemBuilder: (context, index) {
                                                            final program =
                                                                programs[index];

                                                            return GestureDetector(
                                                              onTap: () {
                                                                context.pushNamed(
                                                                  AppRouteName
                                                                      .programDetail,
                                                                  pathParameters: {
                                                                    'programId':
                                                                        program
                                                                            .uid ??
                                                                        '',
                                                                  },
                                                                  queryParameters: {
                                                                    'from':
                                                                        'programs',
                                                                  },
                                                                );
                                                              },
                                                              child: Container(
                                                                padding:
                                                                    ResponsiveHelper.padding(
                                                                      context,
                                                                      vertical:
                                                                          20,
                                                                      horizontal:
                                                                          20,
                                                                    ),
                                                                decoration: BoxDecoration(
                                                                  gradient: LinearGradient(
                                                                    colors: [
                                                                      Colors
                                                                          .white,
                                                                      Color.fromARGB(
                                                                        255,
                                                                        238,
                                                                        242,
                                                                        254,
                                                                      ),
                                                                    ],
                                                                    begin: Alignment
                                                                        .centerLeft,
                                                                    end: Alignment
                                                                        .centerRight,
                                                                  ),
                                                                  border: Border.all(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                ),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          padding: ResponsiveHelper.padding(
                                                                            context,
                                                                            all:
                                                                                12,
                                                                          ),
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                primaryColor,
                                                                            borderRadius: BorderRadius.circular(
                                                                              8,
                                                                            ),
                                                                          ),
                                                                          child: Center(
                                                                            child: Text(
                                                                              program.workScope?.code ??
                                                                                  'N/A',
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: ResponsiveHelper.fontSize(
                                                                                  context,
                                                                                  base: 13,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              15,
                                                                        ),
                                                                        Expanded(
                                                                          child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
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
                                                                              SizedBox(
                                                                                height: 2,
                                                                              ),
                                                                              Row(
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.swap_calls,
                                                                                    size: ResponsiveHelper.iconSize(
                                                                                      context,
                                                                                      base: 16,
                                                                                    ),
                                                                                    color: Colors.black,
                                                                                  ),
                                                                                  SizedBox(
                                                                                    width: 5,
                                                                                  ),
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
                                                                    Divider(
                                                                      height:
                                                                          40,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300,
                                                                      thickness:
                                                                          1,
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8.0,
                                                                      ),
                                                                      child: Row(
                                                                        children: [
                                                                          Icon(
                                                                            Icons.location_on_sharp,
                                                                            color:
                                                                                Colors.black,
                                                                            size: ResponsiveHelper.iconSize(
                                                                              context,
                                                                              base: 20,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                15,
                                                                          ),
                                                                          Expanded(
                                                                            child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  program.road?.district?.name ??
                                                                                      'N/A',
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w400,
                                                                                    color: Colors.grey,
                                                                                    fontSize: ResponsiveHelper.fontSize(
                                                                                      context,
                                                                                      base: 12,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 2,
                                                                                ),
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
                                                                    Divider(
                                                                      height:
                                                                          40,
                                                                      color: Colors
                                                                          .grey
                                                                          .shade300,
                                                                      thickness:
                                                                          1,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Progress',
                                                                              style: TextStyle(
                                                                                fontSize: ResponsiveHelper.fontSize(
                                                                                  context,
                                                                                  base: 12,
                                                                                ),
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '${program.totalReports ?? 0}/${program.requiredReportsCount ?? 0}',
                                                                              style: TextStyle(
                                                                                fontSize: ResponsiveHelper.fontSize(
                                                                                  context,
                                                                                  base: 12,
                                                                                ),
                                                                                fontWeight: FontWeight.w600,
                                                                                color: primaryColor,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height: ResponsiveHelper.spacing(
                                                                            context,
                                                                            8,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height: ResponsiveHelper.spacing(
                                                                            context,
                                                                            10,
                                                                          ),
                                                                          width:
                                                                              double.infinity,
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius: BorderRadius.circular(
                                                                              10,
                                                                            ),
                                                                          ),
                                                                          child: FractionallySizedBox(
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            widthFactor:
                                                                                (program.requiredReportsCount !=
                                                                                        null &&
                                                                                    program.requiredReportsCount! >
                                                                                        0)
                                                                                ? (program.totalReports ??
                                                                                          0) /
                                                                                      program.requiredReportsCount!
                                                                                : 0.0,
                                                                            child: Container(
                                                                              decoration: BoxDecoration(
                                                                                color: primaryColor,
                                                                                borderRadius: BorderRadius.circular(
                                                                                  12,
                                                                                ),
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
                                                          },
                                                        );
                                                      },
                                                  failure: (message) => Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            50.0,
                                                          ),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
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
                                                                  .read<
                                                                    CompanyBloc
                                                                  >()
                                                                  .state
                                                                  .maybeMap(
                                                                    loaded:
                                                                        (
                                                                          state,
                                                                        ) => state
                                                                            .selectedCompany
                                                                            ?.uid,
                                                                    orElse: () =>
                                                                        null,
                                                                  );

                                                              if (companyUID !=
                                                                  null) {
                                                                getIt<
                                                                      ProgramViewBloc
                                                                    >()
                                                                    .add(
                                                                      ProgramViewEvent.loadPrograms(
                                                                        companyUID:
                                                                            companyUID,
                                                                        page: 1,
                                                                        limit:
                                                                            10,
                                                                        forceRefresh:
                                                                            true,
                                                                      ),
                                                                    );
                                                              }
                                                            },
                                                            child: const Text(
                                                              'Retry',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  detailLoading: () =>
                                                      const SizedBox.shrink(),
                                                  detailLoaded: (_) =>
                                                      const SizedBox.shrink(),
                                                  detailFailure: (_) =>
                                                      const SizedBox.shrink(),
                                                );
                                              },
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
                        ],
                      ),
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
}
