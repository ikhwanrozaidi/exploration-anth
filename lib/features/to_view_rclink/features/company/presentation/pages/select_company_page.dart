import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../domain/entities/company.dart';
import '../bloc/company_bloc.dart';
import '../bloc/company_event.dart';
import '../bloc/company_state.dart';

class SelectCompanyPage extends StatefulWidget {
  const SelectCompanyPage({super.key});

  @override
  State<SelectCompanyPage> createState() => _SelectCompanyPageState();
}

class _SelectCompanyPageState extends State<SelectCompanyPage>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedCompanyId;

  // Animation controllers for smooth transitions
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animations
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    // Start animations
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CompanyBloc>()..add(const LoadCompanies()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<CompanyBloc, CompanyState>(
          listener: (context, state) {
            state.whenOrNull(
              failure: (message) {
                CustomSnackBar.show(context, message, type: SnackBarType.error);
              },
              loaded: (companies, selectedCompanyId) {
                if (selectedCompanyId != null &&
                    _selectedCompanyId != selectedCompanyId) {
                  final selectedCompany = companies.firstWhere(
                    (c) => c.uid == selectedCompanyId,
                  );
                  CustomSnackBar.show(
                    context,
                    'Selected: ${selectedCompany.name}',
                    type: SnackBarType.success,
                  );

                  // Smooth transition back to auth flow
                  Future.delayed(const Duration(milliseconds: 800), () {
                    if (mounted) {
                      // The auth wrapper will handle the transition to authenticated state
                    }
                  });
                }
              },
            );
          },
          builder: (context, state) {
            return AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: _buildContent(state),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(CompanyState state) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => _buildLoadingState(),
      loaded: (companies, selectedCompanyId) {
        _selectedCompanyId = selectedCompanyId;

        final filteredCompanies = companies.where((company) {
          final searchLower = _searchController.text.toLowerCase();
          return company.name.toLowerCase().contains(searchLower) ||
              company.regNo.toLowerCase().contains(searchLower);
        }).toList();

        return _buildLoadedState(filteredCompanies, selectedCompanyId);
      },
      failure: (message) => _buildFailureState(message),
    );
  }

  Widget _buildLoadingState() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF8F9FA), Colors.white],
        ),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 24),
            Text(
              'Loading companies...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadedState(List<Company> companies, String? selectedCompanyId) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF8F9FA), Colors.white],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header with smooth design
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            // Smooth transition back
                            _slideController.reverse().then((_) {
                              if (mounted) {
                                Navigator.of(context).pop();
                              }
                            });
                          },
                        ),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Select Company',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 48), // Balance the back button
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Choose your company to continue',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar with smooth design
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search company...',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[400],
                        size: 22,
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Companies List
            Expanded(
              child: companies.isEmpty
                  ? _buildEmptyState()
                  : _buildCompaniesList(companies, selectedCompanyId),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.business_outlined,
              size: 40,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _searchController.text.isNotEmpty
                ? 'No companies found'
                : 'No companies available',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _searchController.text.isNotEmpty
                ? 'Try adjusting your search'
                : 'Please contact support',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildCompaniesList(
    List<Company> companies,
    String? selectedCompanyId,
  ) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: companies.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final company = companies[index];
        final isSelected = selectedCompanyId == company.uid;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? primaryColor : Colors.transparent,
              width: 2,
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
                context.read<CompanyBloc>().add(SelectCompany(company.uid));
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    // Company Avatar
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: isSelected ? primaryColor : Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          company.name.isNotEmpty
                              ? company.name.substring(0, 1).toUpperCase()
                              : 'C',
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[600],
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            company.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: isSelected ? primaryColor : Colors.black,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (company.regNo.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Text(
                              'Reg No: ${company.regNo}',
                              style: TextStyle(
                                color: isSelected
                                    ? primaryColor.withOpacity(0.8)
                                    : Colors.grey[600],
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                          if (company.city.isNotEmpty &&
                              company.state.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              '${company.city}, ${company.state}',
                              style: TextStyle(
                                color: isSelected
                                    ? primaryColor.withOpacity(0.7)
                                    : Colors.grey[500],
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    // Selection Indicator
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: isSelected
                          ? Container(
                              key: const ValueKey('selected'),
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 18,
                              ),
                            )
                          : Icon(
                              key: const ValueKey('unselected'),
                              Icons.keyboard_arrow_right,
                              color: Colors.grey[400],
                              size: 24,
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

  Widget _buildFailureState(String message) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF8F9FA), Colors.white],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.error_outline,
                  size: 40,
                  color: Colors.red[300],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Oops! Something went wrong',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CompanyBloc>().add(const LoadCompanies());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Try Again',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
