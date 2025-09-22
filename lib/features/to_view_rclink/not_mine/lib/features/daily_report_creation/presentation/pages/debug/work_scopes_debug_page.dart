import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../data/repositories/daily_report_creation_repository_impl.dart';
import '../../../domain/usecases/get_work_scopes_usecase.dart';
import '../../../domain/usecases/clear_work_scopes_cache_usecase.dart';
import '../../../domain/entities/scope_of_work/scope_of_work.dart';
import '../../bloc/report_creation_bloc.dart';
import '../../bloc/report_creation_event.dart';
import '../../bloc/report_creation_state.dart';
import 'dart:convert';

class WorkScopesDebugPage extends StatefulWidget {
  const WorkScopesDebugPage({super.key});

  @override
  State<WorkScopesDebugPage> createState() => _WorkScopesDebugPageState();
}

class _WorkScopesDebugPageState extends State<WorkScopesDebugPage> {
  ScopeOfWork? selectedScope;
  List<ScopeOfWork> availableScopes = [];

  @override
  Widget build(BuildContext context) {
    // Create dependencies manually
    final repository = DailyReportCreationRepositoryImpl(
      getIt(), // DailyReportCreationRemoteDataSource
      getIt(), // DailyReportCreationLocalDatasource
      getIt(), // CompanyBloc
    );

    final getWorkScopesUseCase = GetWorkScopesUseCase(repository);
    final clearCacheUseCase = ClearWorkScopesCacheUseCase(repository);

    return BlocProvider(
      create: (context) => ReportCreationBloc(
        {}, // Empty scope configurations for now
        getWorkScopesUseCase,
        clearCacheUseCase,
      ),
      child: _WorkScopesDebugView(
        selectedScope: selectedScope,
        availableScopes: availableScopes,
        onScopeSelected: (scope) {
          setState(() {
            selectedScope = scope;
          });
        },
        onScopesLoaded: (scopes) {
          setState(() {
            availableScopes = scopes;
            selectedScope = null; // Reset selection when new data loads
          });
        },
      ),
    );
  }
}

class _WorkScopesDebugView extends StatelessWidget {
  final ScopeOfWork? selectedScope;
  final List<ScopeOfWork> availableScopes;
  final Function(ScopeOfWork?) onScopeSelected;
  final Function(List<ScopeOfWork>) onScopesLoaded;

  const _WorkScopesDebugView({
    required this.selectedScope,
    required this.availableScopes,
    required this.onScopeSelected,
    required this.onScopesLoaded,
  });

  void _printSelectedScopeJson() {
    if (selectedScope == null) {
      print('❌ No scope selected');
      return;
    }

    print('🔍 ===== SELECTED SCOPE JSON =====');
    print('📋 Selected: ${selectedScope!.name}');
    print('');

    // Convert to JSON
    final jsonData = selectedScope!.toJson();

    // Pretty print JSON
    const encoder = JsonEncoder.withIndent('  ');
    final prettyJson = encoder.convert(jsonData);

    print('📄 JSON Structure:');
    print(prettyJson);
    print('');
    print('✅ ===== END JSON =====');
  }

  void _printAllScopesStructure(List<ScopeOfWork> workScopes) {
    print('🔍 ===== ALL WORK SCOPES LOADED =====');
    print('📊 Total Work Scopes Found: ${workScopes.length}');
    print('');

    for (int i = 0; i < workScopes.length; i++) {
      final scope = workScopes[i];
      print('🏗️ [$i] ${scope.name} (${scope.code})');
      print('   📋 UID: ${scope.uid}');
      print('   🔢 ID: ${scope.id}');
      print('   📝 Description: ${scope.description}');
      print('   🔧 Equipment Count: ${scope.workEquipments.length}');
      print('   📏 Quantity Types Count: ${scope.workQuantityTypes.length}');
      print('');
    }
    print('✅ ===== END WORK SCOPES =====');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work Scopes Debug'),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: BlocListener<ReportCreationBloc, ReportCreationState>(
        listener: (context, state) {
          if (state.workScopes != null && state.workScopes!.isNotEmpty) {
            print('✅ Work scopes loaded successfully!');
            _printAllScopesStructure(state.workScopes!);
            onScopesLoaded(state.workScopes!);
          }

          if (state.workScopesError != null) {
            print('❌ ERROR: ${state.workScopesError}');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Fetch Button
              ElevatedButton.icon(
                onPressed: () {
                  print('🚀 Fetching work scopes...');
                  context.read<ReportCreationBloc>().add(
                    LoadWorkScopesEvent(forceRefresh: true),
                  );
                },
                icon: const Icon(Icons.download, color: Colors.white),
                label: const Text(
                  'Fetch Work Scopes',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Loading/Error State
              BlocBuilder<ReportCreationBloc, ReportCreationState>(
                builder: (context, state) {
                  if (state.isLoadingWorkScopes) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(width: 16),
                            Text('Loading work scopes...'),
                          ],
                        ),
                      ),
                    );
                  }

                  if (state.workScopesError != null) {
                    return Card(
                      color: Colors.red.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Icon(
                              Icons.error,
                              color: Colors.red.shade700,
                              size: 32,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Error Loading Data',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              state.workScopesError!,
                              style: TextStyle(color: Colors.red.shade600),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),

              // Work Scope Dropdown Section
              if (availableScopes.isNotEmpty) ...[
                const SizedBox(height: 24),
                const Text(
                  'Select Work Scope to View JSON:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // Dropdown
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<ScopeOfWork>(
                      isExpanded: true,
                      value: selectedScope,
                      hint: const Text('Choose a work scope...'),
                      items: availableScopes.map((scope) {
                        return DropdownMenuItem<ScopeOfWork>(
                          value: scope,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                scope.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${scope.code} • ${scope.workQuantityTypes.length} quantity types • ${scope.workEquipments.length} equipment',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: onScopeSelected,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Print JSON Button
                ElevatedButton.icon(
                  onPressed: selectedScope != null
                      ? _printSelectedScopeJson
                      : null,
                  icon: const Icon(Icons.print, color: Colors.white),
                  label: const Text(
                    'Print Selected Scope JSON',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedScope != null
                        ? Colors.green
                        : Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Selected Scope Info Card
                if (selectedScope != null)
                  Card(
                    color: Colors.blue.shade50,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info, color: Colors.blue.shade700),
                              const SizedBox(width: 8),
                              Text(
                                'Selected Scope',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildInfoRow('Name', selectedScope!.name),
                          _buildInfoRow('Code', selectedScope!.code),
                          _buildInfoRow(
                            'Description',
                            selectedScope!.description,
                          ),
                          _buildInfoRow(
                            'Equipment Count',
                            '${selectedScope!.workEquipments.length}',
                          ),
                          _buildInfoRow(
                            'Quantity Types',
                            '${selectedScope!.workQuantityTypes.length}',
                          ),
                          _buildInfoRow(
                            'Allow Multiple Quantities',
                            selectedScope!.allowMultipleQuantities
                                ? 'Yes'
                                : 'No',
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '💡 Press "Print Selected Scope JSON" to see the complete JSON structure in the console!',
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],

              // Empty State
              if (availableScopes.isEmpty &&
                  !context
                      .watch<ReportCreationBloc>()
                      .state
                      .isLoadingWorkScopes)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.work_outline,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No Work Scopes Loaded',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Press "Fetch Work Scopes" to load data',
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }
}
