import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../locale/presentation/widgets/app_localization.dart';
import '../bloc/company_bloc.dart';
import '../bloc/company_event.dart';
import '../bloc/company_state.dart';

class CompanySelectionPage extends StatefulWidget {
  final VoidCallback? onBackPressed;

  const CompanySelectionPage({super.key, this.onBackPressed});

  @override
  State<CompanySelectionPage> createState() => _CompanySelectionPageState();
}

class _CompanySelectionPageState extends State<CompanySelectionPage>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _showCompanySelectionBottomSheet(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    _searchController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                // Handle bar
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Contractor',
                      hintStyle: TextStyle(
                        fontSize: w * 0.035,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                    ),
                    onChanged: (value) {
                      setModalState(() {});
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Company list
                Expanded(
                  child: BlocProvider(
                    create: (context) =>
                        getIt<CompanyBloc>()..add(const LoadCompanies()),
                    child: BlocBuilder<CompanyBloc, CompanyState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () =>
                              const Center(child: Text('Initializing...')),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          loaded: (companies, selectedCompanyId) {
                            // Filter companies based on search
                            final filteredCompanies = companies.where((
                              company,
                            ) {
                              final searchLower = _searchController.text
                                  .toLowerCase();
                              return company.name.toLowerCase().contains(
                                    searchLower,
                                  ) ||
                                  company.regNo.toLowerCase().contains(
                                    searchLower,
                                  );
                            }).toList();

                            if (filteredCompanies.isEmpty) {
                              return const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search_off,
                                      size: 64,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 16),
                                    Text('No companies found'),
                                    Text('Try adjusting your search'),
                                  ],
                                ),
                              );
                            }

                            return ListView.separated(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              itemCount: filteredCompanies.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final company = filteredCompanies[index];
                                final isSelected =
                                    selectedCompanyId == company.uid;

                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: isSelected
                                          ? primaryColor
                                          : Colors.grey[300]!,
                                      width: isSelected ? 2 : 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: isSelected
                                            ? primaryColor.withOpacity(0.15)
                                            : Colors.black.withOpacity(0.06),
                                        blurRadius: isSelected ? 15 : 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(16),
                                      onTap: () {
                                        context.read<CompanyBloc>().add(
                                          SelectCompany(company.uid),
                                        );
                                        Navigator.pop(context);
                                        CustomSnackBar.show(
                                          context,
                                          'Selected: ${company.name}',
                                          type: SnackBarType.success,
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            // Company Avatar
                                            Container(
                                              width: w * 0.13,
                                              height: w * 0.13,
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? primaryColor
                                                    : Colors.grey[100],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  company.name.isNotEmpty
                                                      ? company.name
                                                            .substring(0, 1)
                                                            .toUpperCase()
                                                      : 'C',
                                                  style: TextStyle(
                                                    color: isSelected
                                                        ? Colors.white
                                                        : Colors.grey[600],
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(width: 16),

                                            // Company Info
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    company.name,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: isSelected
                                                          ? primaryColor
                                                          : Colors.black,
                                                      fontSize: w * 0.035,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  if (company
                                                      .regNo
                                                      .isNotEmpty) ...[
                                                    const SizedBox(height: 6),
                                                    Text(
                                                      'Reg No: ${company.regNo}',
                                                      style: TextStyle(
                                                        color: isSelected
                                                            ? primaryColor
                                                                  .withOpacity(
                                                                    0.8,
                                                                  )
                                                            : Colors.grey[600],
                                                        fontSize: w * 0.03,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                  if (company.city.isNotEmpty &&
                                                      company
                                                          .state
                                                          .isNotEmpty) ...[
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      '${company.city}, ${company.state}',
                                                      style: TextStyle(
                                                        color: isSelected
                                                            ? primaryColor
                                                                  .withOpacity(
                                                                    0.8,
                                                                  )
                                                            : Colors.grey[600],
                                                        fontSize: w * 0.03,
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),

                                            // Selection indicator
                                            if (isSelected)
                                              Icon(
                                                Icons.check_circle,
                                                color: primaryColor,
                                                size: w * 0.04,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          failure: (message) => Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_outline,
                                  size: 64,
                                  color: Colors.red,
                                ),
                                const SizedBox(height: 16),
                                Text('Error: $message'),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<CompanyBloc>().add(
                                      const LoadCompanies(),
                                    );
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
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Text(
            'Choose Company to Manage',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: w * 0.07,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 20),

          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.grey.shade200,
            ),
            onPressed: () {
              _showCompanySelectionBottomSheet(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: w * 0.06,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Company',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Choose which company you want to manage',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: w * 0.03,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: Image.asset(
                'assets/images/choose_company_vector.png',
                height: 200,
                width: 350,
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: widget.onBackPressed,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: primaryColor),
                padding: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Back to sign in',
                style: TextStyle(
                  fontSize: w * 0.035,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
