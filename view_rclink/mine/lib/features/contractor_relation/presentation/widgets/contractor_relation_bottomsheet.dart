import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../domain/entities/contractor_relation_entity.dart';
import '../bloc/contractor_relation_bloc.dart';
import '../bloc/contractor_relation_event.dart';
import '../bloc/contractor_relation_state.dart';

class ContractorRelationBottomSheet extends StatefulWidget {
  final Function(ContractorRelation) onContractorSelected;

  const ContractorRelationBottomSheet({
    super.key,
    required this.onContractorSelected,
  });

  @override
  State<ContractorRelationBottomSheet> createState() =>
      _ContractorRelationBottomSheetState();
}

class _ContractorRelationBottomSheetState
    extends State<ContractorRelationBottomSheet> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.6,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            ResponsiveHelper.adaptive(
              context,
              mobile: 20,
              tablet: 30,
              desktop: 30,
            ),
          ),
          topRight: Radius.circular(
            ResponsiveHelper.adaptive(
              context,
              mobile: 20,
              tablet: 30,
              desktop: 30,
            ),
          ),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.symmetric(
              vertical: ResponsiveHelper.adaptive(
                context,
                mobile: 15,
                tablet: 20,
                desktop: 35,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                ResponsiveHelper.adaptive(
                  context,
                  mobile: 20,
                  tablet: 30,
                  desktop: 30,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Contractor',
                hintStyle: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 13),
                  color: Colors.black.withOpacity(0.6),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                    left: ResponsiveHelper.adaptive(
                      context,
                      mobile: 20,
                      tablet: 30,
                      desktop: 30,
                    ),
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.adaptive(
                      context,
                      mobile: 50,
                      tablet: 80,
                      desktop: 100,
                    ),
                  ),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.adaptive(
                      context,
                      mobile: 50,
                      tablet: 80,
                      desktop: 100,
                    ),
                  ),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.adaptive(
                      context,
                      mobile: 50,
                      tablet: 80,
                      desktop: 100,
                    ),
                  ),
                  borderSide: const BorderSide(color: primaryColor),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.adaptive(
                    context,
                    mobile: 50,
                    tablet: 80,
                    desktop: 100,
                  ),
                  vertical: ResponsiveHelper.adaptive(
                    context,
                    mobile: 10,
                    tablet: 20,
                    desktop: 30,
                  ),
                ),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: BlocBuilder<ContractorRelationBloc, ContractorRelationState>(
              builder: (context, state) {
                if (state is ContractorRelationInitial) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.read<ContractorRelationBloc>().add(
                      const LoadContractorRelation(),
                    );
                  });
                }

                return state.maybeWhen(
                  initial: () => const Center(child: Text('Initializing...')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (contractors, selectedContractor) {
                    // Search contractors
                    final filteredContractors = contractors.where((contractor) {
                      final searchLower = _searchController.text.toLowerCase();
                      return contractor.name.toLowerCase().contains(
                            searchLower,
                          ) ||
                          (contractor.regNo?.toLowerCase().contains(
                                searchLower,
                              ) ??
                              false) ||
                          (contractor.cidbNo?.toLowerCase().contains(
                                searchLower,
                              ) ??
                              false);
                    }).toList();

                    if (filteredContractors.isEmpty) {
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
                            Text('No contractors found'),
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
                      itemCount: filteredContractors.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final contractor = filteredContractors[index];
                        final isSelected =
                            selectedContractor?.uid == contractor.uid;

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
                                Navigator.pop(context);
                                widget.onContractorSelected(contractor);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  children: [
                                    // Contractor Avatar
                                    Container(
                                      width: w * 0.13,
                                      height: w * 0.13,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? primaryColor
                                            : Colors.grey[100],
                                        borderRadius: BorderRadius.circular(
                                          ResponsiveHelper.adaptive(
                                            context,
                                            mobile: 10,
                                            tablet: 20,
                                            desktop: 30,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          contractor.name.isNotEmpty
                                              ? contractor.name
                                                    .substring(0, 1)
                                                    .toUpperCase()
                                              : 'C',
                                          style: TextStyle(
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.grey[600],
                                            fontWeight: FontWeight.bold,
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 16),

                                    // Contractor Info
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            contractor.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: isSelected
                                                  ? primaryColor
                                                  : Colors.black,
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 13,
                                                  ),
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          if (contractor.regNo != null &&
                                              contractor.regNo!.isNotEmpty) ...[
                                            const SizedBox(height: 6),
                                            Text(
                                              'Reg No: ${contractor.regNo}',
                                              style: TextStyle(
                                                color: isSelected
                                                    ? primaryColor.withOpacity(
                                                        0.8,
                                                      )
                                                    : Colors.grey[600],
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 11,
                                                    ),
                                              ),
                                            ),
                                          ],
                                          if (contractor.isSelf != null &&
                                              contractor.isSelf == true) ...[
                                            const SizedBox(height: 4),
                                            Text(
                                              '(Self Contractor)',
                                              style: TextStyle(
                                                color: primaryColor.withOpacity(
                                                  0.8,
                                                ),
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 11,
                                                    ),
                                                fontWeight: FontWeight.w600,
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
                                        size: ResponsiveHelper.adaptive(
                                          context,
                                          mobile: 24,
                                          tablet: 32,
                                          desktop: 40,
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
                        Text(
                          'Error loading contractors',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 16,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          message,
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 12,
                            ),
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  orElse: () => const Center(child: Text('Unknown state')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
