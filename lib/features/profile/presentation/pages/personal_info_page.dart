import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/template_page.dart';
import '../../domain/entities/user_profile_detail.dart';
import '../../domain/entities/user_profile_settings.dart';
import '../../domain/entities/user_profile_user.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  String? _editingField; // Track which field is being edited
  final Map<String, TextEditingController> _controllers = {};

  @override
  void dispose() {
    // Dispose all controllers
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      pageTitle: 'Personal Details',
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // When update succeeds, clear editing state
          state.whenOrNull(
            loaded: (user, detail, settings) {
              setState(() {
                _editingField = null;
              });
            },
            failure: (message) {
              // Show error
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
              setState(() {
                _editingField = null;
              });
            },
          );
        },
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              updating: () => const Center(child: CircularProgressIndicator()),
              loaded: (user, detail, settings) =>
                  _buildLoadedContent(context, user, detail, settings),
              empty: () =>
                  const Center(child: Text('No profile data available')),
              failure: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $message'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(
                          const ProfileEvent.loadProfile(),
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
    );
  }

  Widget _buildLoadedContent(
    BuildContext context,
    UserProfileUser user,
    UserProfileDetail? detail,
    UserProfileSettings? settings,
  ) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),

                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      shape: BoxShape.circle,
                      image: detail?.profilePicture != null
                          ? DecorationImage(
                              image: NetworkImage(detail!.profilePicture!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: detail?.profilePicture == null
                        ? Center(
                            child: Text(
                              _getInitials(detail),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : null,
                  ),

                  SizedBox(height: 20),

                  Text(
                    detail?.fullName ?? '',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text(
                    '@null',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Divider(height: 40, thickness: 1, color: backgroundColor),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'null',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 20,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            'Purchase',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            'null',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 20,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            'Gatepoints',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            'null',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 20,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            'Ratings',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        "You're not verified",
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'Your Profile',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 16),

            // Edit Profile Details
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildEditableField(
                    label: 'First Name',
                    fieldKey: 'firstName',
                    currentValue: detail?.firstName ?? '',
                    onSave: (newValue) {
                      context.read<ProfileBloc>().add(
                        ProfileEvent.updateProfile(firstName: newValue),
                      );
                    },
                  ),

                  Divider(height: 40, thickness: 1, color: backgroundColor),

                  _buildEditableField(
                    label: 'Last Name',
                    fieldKey: 'lastName',
                    currentValue: detail?.lastName ?? '',
                    onSave: (newValue) {
                      context.read<ProfileBloc>().add(
                        ProfileEvent.updateProfile(lastName: newValue),
                      );
                    },
                  ),

                  Divider(height: 40, thickness: 1, color: backgroundColor),

                  _buildEditableField(
                    label: 'Email',
                    fieldKey: 'email',
                    currentValue: user.email,
                    onSave: (newValue) {
                      context.read<ProfileBloc>().add(
                        ProfileEvent.updateProfile(email: newValue),
                      );
                    },
                  ),

                  Divider(height: 40, thickness: 1, color: backgroundColor),

                  _buildEditableField(
                    label: 'Phone',
                    fieldKey: 'phone',
                    currentValue: user.phone,
                    onSave: (newValue) {
                      context.read<ProfileBloc>().add(
                        ProfileEvent.updateProfile(phone: newValue),
                      );
                    },
                  ),

                  Divider(height: 40, thickness: 1, color: backgroundColor),

                  _buildEditableField(
                    label: 'Address',
                    fieldKey: 'address',
                    currentValue: detail?.address ?? '',
                    maxLines: 3,
                    onSave: (newValue) {
                      context.read<ProfileBloc>().add(
                        ProfileEvent.updateProfile(address: newValue),
                      );
                    },
                  ),

                  Divider(height: 40, thickness: 1, color: backgroundColor),

                  _buildEditableField(
                    label: 'Birth Date',
                    fieldKey: 'birthDate',
                    currentValue: detail?.birthDate ?? '',
                    onSave: (newValue) {
                      context.read<ProfileBloc>().add(
                        ProfileEvent.updateProfile(birthDate: newValue),
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required String fieldKey,
    required String currentValue,
    required Function(String) onSave,
    int maxLines = 1,
  }) {
    final isEditing = _editingField == fieldKey;

    // Initialize controller if not exists
    if (!_controllers.containsKey(fieldKey)) {
      _controllers[fieldKey] = TextEditingController(text: currentValue);
    }

    // Update controller text when currentValue changes
    if (!isEditing && _controllers[fieldKey]!.text != currentValue) {
      _controllers[fieldKey]!.text = currentValue;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isEditing
                    ? TextField(
                        controller: _controllers[fieldKey],
                        maxLines: maxLines,
                        autofocus: true,
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      )
                    : Text(
                        currentValue.isEmpty ? 'N/A' : currentValue,
                        style: const TextStyle(color: Colors.grey),
                        maxLines: maxLines,
                      ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                if (isEditing) {
                  // Save action - call the update
                  final newValue = _controllers[fieldKey]!.text.trim();
                  if (newValue.isNotEmpty && newValue != currentValue) {
                    onSave(newValue);
                  } else {
                    // Just cancel editing if no changes
                    setState(() {
                      _editingField = null;
                      _controllers[fieldKey]!.text = currentValue;
                    });
                  }
                } else {
                  // Only allow editing if no other field is being edited
                  if (_editingField == null) {
                    setState(() {
                      _editingField = fieldKey;
                    });
                  } else {
                    // Show message that another field is being edited
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Please save or cancel the current edit first',
                        ),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isEditing ? Colors.green.shade50 : backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isEditing ? Icons.check : Icons.mode_edit_outlined,
                  size: 20,
                  color: isEditing ? Colors.green : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getInitials(dynamic detail) {
    if (detail == null) return '?';
    final firstName = detail.firstName ?? '';
    final lastName = detail.lastName ?? '';
    if (firstName.isEmpty && lastName.isEmpty) return '?';
    return '${firstName.isNotEmpty ? firstName[0] : ''}${lastName.isNotEmpty ? lastName[0] : ''}'
        .toUpperCase();
  }
}
