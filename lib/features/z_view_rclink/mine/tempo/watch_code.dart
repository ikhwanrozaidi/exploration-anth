import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/shared/widgets/theme_listtile_widget.dart';
import 'package:rclink_app/features/rbac/presentation/widgets/permission_gate.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../company/presentation/pages/widgets/edit_company_page.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../rbac/domain/constants/permission_codes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showActionRequired =
      true; //was in DashboardPage, but will use as AnimatedContainer later
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  void toggleActionRequired() {
    setState(() {
      showActionRequired = !showActionRequired;
    });
  }

  void onMonthSelected(int month, int year) {
    setState(() {
      selectedMonth = month;
      selectedYear = year;
    });
    print('Selected month: $month, year: $year');
  }

  @override
  Widget build(BuildContext context) {
    double bottomContainerHeight = showActionRequired
        ? MediaQuery.of(context).size.height * 0.76
        : MediaQuery.of(context).size.height * 0.70;

    return Scaffold(
      body: Container(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),

                        IconButton(
                          style: IconButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(5),
                          ),
                          onPressed: () {
                            print("Add button clicked");

                            CustomSnackBar.show(
                              context,
                              'This feature is coming soon...',
                              type: SnackBarType.comingsoon,
                            );
                          },
                          icon: const Icon(
                            Icons.qr_code_2,
                            color: primaryColor,
                            size: 25,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
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
                  child: BlocBuilder<CompanyBloc, CompanyState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loaded: (companies, selectedCompany) {
                          return _buildProfileContent(
                            selectedCompany?.name ?? 'No Company',
                          );
                        },
                        fieldUpdateFailure:
                            (companies, errorMessage, selectedCompany) {
                              return _buildProfileContent(
                                selectedCompany?.name ?? 'No Company',
                              );
                            },
                        orElse: () {
                          return _buildProfileContent('Loading...');
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent(String companyName) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyName,
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Divider(height: 30, thickness: 0.5, color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '89021',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text('Report'),
                    ],
                  ),
                  Container(color: Colors.grey, height: 30, width: 1),
                  Column(
                    children: [
                      Text(
                        '89021',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text('Members'),
                    ],
                  ),
                  Container(color: Colors.grey, height: 30, width: 1),
                  Column(
                    children: [
                      Text(
                        '89021',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text('Projects'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 30),

        Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'User Info',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  PermissionGate(
                    permissionCode: PermissionCodes.userEdit,
                    child: GestureDetector(
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'EDIT',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 10,
                            ),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              dividerConfig(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    ThemeListTileWidget(
                      title: 'Full name',
                      titleDetails: 'Tom',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: 'Email',
                      titleDetails: 'tom@gmail.com',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: 'Phone',
                      titleDetails: '+600127383732',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: 'Position',
                      titleDetails: 'Contract Assistant',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: 'CIDB',
                      titleDetails: 'Not updated yet',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                      focus: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 30),

        Container(
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
                    ThemeListTileWidget(
                      title: 'Support',
                      titleDetails: 'Get help on WhatsApp',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: 'Language',
                      titleDetails: 'English',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: 'Application version',
                      titleDetails: '3.8',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: '',
                      titleDetails: 'App Settings',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: '',
                      titleDetails: 'Manage Companies',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: '',
                      titleDetails: 'Delete Account',
                      icon: Icons.abc,
                      onTap: () {
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                      focus: true,
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: '',
                      titleDetails: 'Logout',
                      icon: Icons.abc,

                      onTap: () {
                        context.read<AuthBloc>().add(const LogoutRequested());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 60),
      ],
    );
  }
}
