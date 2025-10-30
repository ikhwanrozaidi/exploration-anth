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
import '../../../company/domain/entities/company.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../company/presentation/pages/edit_company_page.dart';
import '../../../rbac/domain/constants/permission_codes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
                            print("Qr button clicked");

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
                  padding: EdgeInsets.symmetric(horizontal: 25),
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
                          return _buildProfileContent(selectedCompany);
                        },
                        fieldUpdateFailure:
                            (companies, errorMessage, selectedCompany) {
                              return SizedBox.shrink();
                              // _buildProfileContent(selectedCompany?.name ?? 'No Company',);
                            },
                        orElse: () {
                          return SizedBox.shrink();
                          // _buildProfileContent('Loading...');
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

  Widget _buildProfileContent(Company? selectedCompany) {
    return ListView(
      children: [
        SizedBox(height: 25),

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
                selectedCompany?.name ?? 'No Company Selected',
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
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'null',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          'Report',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.grey,
                    height: 30,
                    width: 1,
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'null',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          'Members',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.grey,
                    height: 30,
                    width: 1,
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          selectedCompany?.cidbNo ?? 'N/A',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          'CIDB',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditCompanyPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: ResponsiveHelper.padding(context, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    'Edit Company',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                    ),
                  ),
                ),
              ).withPermission(PermissionCodes.COMPANY_UPDATE),
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
                "Your're signing in as",
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  fontWeight: FontWeight.w600,
                ),
              ),

              Divider(height: 30, thickness: 0.5, color: Colors.grey),

              GestureDetector(
                onTap: () {
                  CustomSnackBar.show(
                    context,
                    'This feature is coming soon...',
                    type: SnackBarType.comingsoon,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                (selectedCompany?.name ?? '').length >= 2
                                    ? (selectedCompany?.name ?? '')
                                          .substring(0, 2)
                                          .toUpperCase()
                                    : (selectedCompany?.name ?? '')
                                          .toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 20),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Company'),

                              Text(
                                selectedCompany?.name ?? 'No Company Selected',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 14,
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color.fromARGB(255, 214, 226, 255),
                        ),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
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
                'Personal Info',
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
                      title: 'Name',
                      titleDetails: 'null',
                      icon: Icons.person,
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
                      titleDetails: 'null',
                      icon: Icons.phone_android_outlined,
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
                      titleDetails: 'null',
                      icon: Icons.email_rounded,
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
                      title: 'Signature',
                      titleDetails: 'null',
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
                      title: 'Branch',
                      titleDetails: 'null',
                      icon: Icons.domain,
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
                      titleDetails: 'null',
                      icon: Icons.work,
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
                      icon: Icons.badge,
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
                      icon: Icons.support_agent,
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
                      icon: Icons.language,
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
                      titleDetails: 'null',
                      icon: Icons.info,
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
                      icon: Icons.settings,
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
                      icon: Icons.domain,
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
                      icon: Icons.delete_rounded,
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
                      icon: Icons.logout,

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
