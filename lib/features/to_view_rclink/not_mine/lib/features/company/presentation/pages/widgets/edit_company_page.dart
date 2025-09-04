import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/widgets/theme_listtile_widget.dart';
import '../../../domain/entities/company.dart';
import '../../bloc/company_bloc.dart';
import '../../bloc/company_state.dart';
import 'edit_company_field_dialog.dart';

class EditCompanyPage extends StatefulWidget {
  @override
  State<EditCompanyPage> createState() => _EditCompanyPageState();
}

class _EditCompanyPageState extends State<EditCompanyPage> {
  void _showEditDialog(
    BuildContext context, {
    required String fieldName,
    required String fieldTitle,
    required String currentValue,
    required String companyUid,
    TextInputType? keyboardType,
    int? maxLines,
  }) {
    showDialog(
      context: context,
      builder: (dialogContext) => BlocProvider.value(
        value: context.read<CompanyBloc>(),
        child: EditCompanyFieldDialog(
          fieldName: fieldName,
          fieldTitle: fieldTitle,
          currentValue: currentValue,
          companyUid: companyUid,
          keyboardType: keyboardType,
          maxLines: maxLines,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edit Company',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocBuilder<CompanyBloc, CompanyState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const Center(child: Text('No company data')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (companies, selectedCompany) {
              if (selectedCompany == null) {
                return const Center(child: Text('No company selected'));
              }
              return _buildCompanyDetails(selectedCompany);
            },
            failure: (message) => Center(child: Text('Error: $message')),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Widget _buildCompanyDetails(Company selectedCompany) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 30),
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
                  'Company Details',
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
                        title: 'Company full name',
                        titleDetails: selectedCompany.name,
                        icon: Icons.business,
                        onTap: () => _showEditDialog(
                          context,
                          fieldName: 'name',
                          fieldTitle: 'Company full name',
                          currentValue: selectedCompany.name,
                          companyUid: selectedCompany.uid,
                        ),
                      ),

                      dividerConfig(),

                      ThemeListTileWidget(
                        title: 'Registration Number',
                        titleDetails: selectedCompany.cidbNo,
                        icon: Icons.assignment,
                        onTap: () => _showEditDialog(
                          context,
                          fieldName: 'cidbNo',
                          fieldTitle: 'Registration Number',
                          currentValue: selectedCompany.cidbNo,
                          companyUid: selectedCompany.uid,
                        ),
                      ),

                      dividerConfig(),

                      ThemeListTileWidget(
                        title: 'Company Phone Number',
                        titleDetails: selectedCompany.phone,
                        icon: Icons.phone,
                        onTap: () => _showEditDialog(
                          context,
                          fieldName: 'phone',
                          fieldTitle: 'Company Phone Number',
                          currentValue: selectedCompany.phone,
                          companyUid: selectedCompany.uid,
                          keyboardType: TextInputType.phone,
                        ),
                      ),

                      dividerConfig(),

                      ThemeListTileWidget(
                        title: 'Address',
                        titleDetails: selectedCompany.address,
                        icon: Icons.location_on,
                        onTap: () => _showEditDialog(
                          context,
                          fieldName: 'address',
                          fieldTitle: 'Address',
                          currentValue: selectedCompany.address,
                          companyUid: selectedCompany.uid,
                          maxLines: 3,
                        ),
                      ),

                      dividerConfig(),

                      ThemeListTileWidget(
                        title: 'Country',
                        titleDetails: selectedCompany.country,
                        icon: Icons.flag,
                        onTap: () => _showEditDialog(
                          context,
                          fieldName: 'country',
                          fieldTitle: 'Country',
                          currentValue: selectedCompany.country,
                          companyUid: selectedCompany.uid,
                        ),
                      ),

                      dividerConfig(),

                      ThemeListTileWidget(
                        title: 'Phone',
                        titleDetails: selectedCompany.phone,
                        icon: Icons.phone_android,
                        onTap: () => _showEditDialog(
                          context,
                          fieldName: 'phone',
                          fieldTitle: 'Phone',
                          currentValue: selectedCompany.phone,
                          companyUid: selectedCompany.uid,
                          keyboardType: TextInputType.phone,
                        ),
                      ),

                      dividerConfig(),

                      ThemeListTileWidget(
                        title: 'Email',
                        titleDetails: selectedCompany.email,
                        icon: Icons.email,
                        onTap: () => _showEditDialog(
                          context,
                          fieldName: 'email',
                          fieldTitle: 'Email',
                          currentValue: selectedCompany.email,
                          companyUid: selectedCompany.uid,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),

                      dividerConfig(),

                      ThemeListTileWidget(
                        title: 'Website',
                        titleDetails: selectedCompany.website,
                        icon: Icons.language,
                        onTap: () => _showEditDialog(
                          context,
                          fieldName: 'website',
                          fieldTitle: 'Website',
                          currentValue: selectedCompany.website,
                          companyUid: selectedCompany.uid,
                          keyboardType: TextInputType.url,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dividerConfig() {
    return Divider(height: 30, thickness: 0.5, color: Colors.grey);
  }
}
