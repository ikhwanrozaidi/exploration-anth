import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../bloc/company_bloc.dart';
import '../bloc/company_event.dart';
import '../bloc/company_state.dart';
import '../../domain/entities/company.dart';
import 'widgets/company_animations.dart';
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
  late final CompanyBloc _companyBloc;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  bool _isRoleLoading = false;

  CompanyScreen _currentScreen = CompanyScreen.selection;
  Company? _selectedCompany;

  @override
  void initState() {
    super.initState();

    _companyBloc = getIt<CompanyBloc>();
    _fadeController = CompanyAnimations.createFadeController(this);
    _fadeAnimation = CompanyAnimations.createFadeAnimation(_fadeController);

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _navigateToConfirmation(Company company) {
    setState(() {
      _selectedCompany = company;
      _currentScreen = CompanyScreen.confirmation;
      _isRoleLoading = true;
    });

    // Fetch role data using the same bloc instance
    if (company.adminRole?.uid != null) {
      _companyBloc.add(FetchRole(company.adminRole!.uid));
    } else {
      setState(() {
        _isRoleLoading = false;
      });
    }
  }

  void _backToSelection() {
    setState(() {
      _currentScreen = CompanyScreen.selection;
      _selectedCompany = null;
    });
  }

  void _exitCompanySelection() {
    if (widget.onBackPressed != null) {
      widget.onBackPressed!();
    }
  }

  void _signInToCompany() {
    if (_selectedCompany != null) {
      _companyBloc.add(SelectCompany(_selectedCompany!.uid));
      CustomSnackBar.show(
        context,
        'Signing in to ${_selectedCompany!.name}...',
        type: SnackBarType.success,
      );
    }
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
    return BlocListener<CompanyBloc, CompanyState>(
      bloc: _companyBloc,
      listenWhen: (previous, current) {
        return current is CompanyRoleLoaded || current is CompanyRoleFailure;
      },
      listener: (context, state) {
        if (state is CompanyRoleLoaded) {
          setState(() {
            _isRoleLoading = false;
          });
        } else if (state is CompanyRoleFailure) {
          setState(() {
            _isRoleLoading = false;
          });
          CustomSnackBar.show(context, state.message, type: SnackBarType.error);
          _backToSelection();
        }
      },
      child: Container(
        key: ValueKey(_currentScreen),
        child: _getCurrentScreen(),
      ),
    );
  }
}
