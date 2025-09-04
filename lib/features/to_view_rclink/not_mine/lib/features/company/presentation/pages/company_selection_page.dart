import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../rbac/presentation/bloc/rbac_bloc.dart';
import '../../../rbac/presentation/bloc/rbac_state.dart';
import '../../domain/entities/company.dart';
import '../bloc/company_bloc.dart';
import '../bloc/company_event.dart';
import 'widgets/company_bottomsheet.dart';
import 'widgets/company_confirmation_content.dart';
import 'widgets/company_selection_page.dart';

enum CompanyScreen { selection, confirmation }

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
  late final CompanyBloc _companyBloc;

  Company? _selectedCompany;
  CompanyScreen _currentScreen = CompanyScreen.selection;
  bool _isRoleLoading = false;

  @override
  void initState() {
    super.initState();

    _companyBloc = context.read<CompanyBloc>();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    _fadeController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _companyBloc.add(const LoadCompanies());
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _navigateToConfirmation(Company company) {
    setState(() {
      _selectedCompany = company;
      _currentScreen = CompanyScreen.confirmation;
      _isRoleLoading = false;
    });
  }

  void _backToSelection() {
    setState(() {
      _currentScreen = CompanyScreen.selection;
      _selectedCompany = null;
      _isRoleLoading = false;
    });
  }

  void _showCompanySelectionBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          CompanyBottomSheet(onCompanySelected: _navigateToConfirmation),
    );
  }

  void _exitCompanySelection() {
    // if (widget.onBackPressed != null) {
    //   widget.onBackPressed!();
    // }
    context.read<AuthBloc>().add(const LogoutRequested());
  }

  void _signInToCompany() {
    setState(() {
      _isRoleLoading = true;
    });

    try {
      if (_companyBloc.isClosed) {
        if (mounted) {
          setState(() {
            _isRoleLoading = false;
          });
        }
        return;
      }
      _companyBloc.add(SelectCompany(_selectedCompany!.uid));
    } catch (e) {
      if (mounted) {
        setState(() {
          _isRoleLoading = false;
        });
        CustomSnackBar.show(
          context,
          'Failed to select company: $e',
          type: SnackBarType.error,
        );
      }
    }
  }

  Widget _getCurrentScreen() {
    switch (_currentScreen) {
      case CompanyScreen.selection:
        return CompanySelectionContent(
          onBackPressed: _exitCompanySelection,
          onSearchPressed: _showCompanySelectionBottomSheet,
          fadeAnimation: _fadeAnimation,
        );
      case CompanyScreen.confirmation:
        if (_selectedCompany == null) {
          return const Center(child: Text('No company selected'));
        }
        return CompanyConfirmationContent(
          selectedCompany: _selectedCompany!,
          isRoleLoading: _isRoleLoading,
          onSignIn: _signInToCompany,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RbacBloc, RbacState>(
      listener: (context, state) {
        if (state is RbacLoading) {
          setState(() {
            _isRoleLoading = true;
          });
        } else if (state is RbacError) {
          setState(() {
            _isRoleLoading = false;
          });
          CustomSnackBar.show(
            context,
            'Failed to load permissions: ${state.message}',
            type: SnackBarType.error,
          );
        } else if (state is RbacLoaded) {
          setState(() {
            _isRoleLoading = false;
          });
        }
      },
      child: Container(
        key: ValueKey(_currentScreen),
        child: _getCurrentScreen(),
      ),
    );
  }
}
