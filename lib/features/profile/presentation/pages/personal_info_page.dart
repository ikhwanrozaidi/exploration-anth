import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatepay_app/shared/utils/responsive_helper.dart';
import 'package:gatepay_app/shared/widgets/custom_snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/template_page.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  // Controllers for each field
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _birthDateController = TextEditingController();

  // Edit state for each field
  final Map<String, bool> _isEditing = {
    'firstName': false,
    'lastName': false,
    'email': false,
    'phone': false,
    'address': false,
    'birthDate': false,
  };

  // Original values (to revert on cancel)
  final Map<String, String> _originalValues = {};

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  void _toggleEdit(String field) {
    setState(() {
      if (_isEditing[field]!) {
        // Save mode - trigger update
        _saveField(field);
      } else {
        // Edit mode - store original value
        _originalValues[field] = _getControllerForField(field).text;
        _isEditing[field] = true;
      }
    });
  }

  void _saveField(String field) {
    final controller = _getControllerForField(field);
    final newValue = controller.text.trim();

    // Validate
    if (newValue.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('$field cannot be empty')));
      return;
    }

    // Prepare update payload
    Map<String, dynamic> updates = {};

    if (field == 'firstName' || field == 'lastName') {
      updates[field] = newValue;
      // Also update fullName
      final firstName = field == 'firstName'
          ? newValue
          : _firstNameController.text;
      final lastName = field == 'lastName'
          ? newValue
          : _lastNameController.text;
      updates['fullName'] = '$firstName $lastName'.trim();
    } else {
      updates[field] = newValue;
    }

    // Send update
    context.read<ProfileBloc>().add(UpdateUserProfile(updates));

    // Exit edit mode
    setState(() {
      _isEditing[field] = false;
    });
  }

  TextEditingController _getControllerForField(String field) {
    switch (field) {
      case 'firstName':
        return _firstNameController;
      case 'lastName':
        return _lastNameController;
      case 'email':
        return _emailController;
      case 'phone':
        return _phoneController;
      case 'address':
        return _addressController;
      case 'birthDate':
        return _birthDateController;
      default:
        return _firstNameController;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      pageTitle: 'Personal Details',
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is ProfileLoaded) {
            // Update controllers with latest data
            final user = state.user;
            final userDetail = user.userDetail;

            _firstNameController.text = userDetail?.firstName ?? '';
            _lastNameController.text = userDetail?.lastName ?? '';
            _emailController.text = user.email;
            _phoneController.text = user.phone;
            _addressController.text = userDetail?.address ?? '';
            _birthDateController.text = userDetail?.birthDate ?? '';

            if (state is ProfileLoaded && state != ProfileLoaded) {
              CustomSnackBar.show(
                context,
                'Profile updated successfully',
                type: SnackBarType.success,
              );
            }
          }
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileError && state is! ProfileLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(const LoadUserSettings());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Get user data (works for both ProfileLoaded and ProfileUpdating)
          final user = state is ProfileLoaded
              ? state.user
              : state is ProfileUpdating
              ? state.user
              : null;

          if (user == null) {
            return const Center(child: Text('No user data'));
          }

          final userDetail = user.userDetail;
          final fullName = userDetail?.fullName ?? 'Unknown User';
          final gatePoint = userDetail?.gatePoint ?? 0;
          final isVerified = userDetail?.verify ?? false;
          final isUpdating = state is ProfileUpdating;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),

                        // Profile Picture
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: userDetail?.profilePicture != null
                              ? ClipOval(
                                  child: Image.network(
                                    userDetail?.profilePicture ?? 'so?',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.person,
                                        size: 50,
                                        color: Colors.white,
                                      );
                                    },
                                  ),
                                )
                              : const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.white,
                                ),
                        ),

                        const SizedBox(height: 20),

                        // Full Name
                        Text(
                          fullName,
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 18,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        // Email as username
                        Text(
                          '@${user.email.split('@').first}',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const Divider(
                          height: 40,
                          thickness: 1,
                          color: backgroundColor,
                        ),

                        // Stats
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '0', // TODO: Add purchase count when available
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 20,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
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
                                  gatePoint.toString(),
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 20,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
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
                                  '0.0', // TODO: Add ratings when available
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 20,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 5),
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

                        const SizedBox(height: 20),

                        // Verification Badge
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: isVerified
                                ? Colors.green.shade100
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              isVerified
                                  ? "You're verified ✓"
                                  : "You're not verified",
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 14,
                                ),
                                fontWeight: FontWeight.w500,
                                color: isVerified ? Colors.green : Colors.black,
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

                  // Editable Profile Details
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 25,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // FIRST NAME
                        _buildEditableField(
                          label: 'First Name',
                          field: 'firstName',
                          controller: _firstNameController,
                          isUpdating: isUpdating,
                        ),

                        const Divider(
                          height: 40,
                          thickness: 1,
                          color: backgroundColor,
                        ),

                        // LAST NAME
                        _buildEditableField(
                          label: 'Last Name',
                          field: 'lastName',
                          controller: _lastNameController,
                          isUpdating: isUpdating,
                        ),

                        const Divider(
                          height: 40,
                          thickness: 1,
                          color: backgroundColor,
                        ),

                        // EMAIL
                        _buildEditableField(
                          label: 'Email',
                          field: 'email',
                          controller: _emailController,
                          isUpdating: isUpdating,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const Divider(
                          height: 40,
                          thickness: 1,
                          color: backgroundColor,
                        ),

                        // PHONE
                        _buildEditableField(
                          label: 'Phone',
                          field: 'phone',
                          controller: _phoneController,
                          isUpdating: isUpdating,
                          keyboardType: TextInputType.phone,
                        ),

                        const Divider(
                          height: 40,
                          thickness: 1,
                          color: backgroundColor,
                        ),

                        // ADDRESS
                        _buildEditableField(
                          label: 'Address',
                          field: 'address',
                          controller: _addressController,
                          isUpdating: isUpdating,
                          maxLines: 3,
                          minHeight: 100,
                        ),

                        const Divider(
                          height: 40,
                          thickness: 1,
                          color: backgroundColor,
                        ),

                        // BIRTH DATE
                        _buildEditableField(
                          label: 'Birth Date',
                          field: 'birthDate',
                          controller: _birthDateController,
                          isUpdating: isUpdating,
                          keyboardType: TextInputType.datetime,
                          hintText: 'YYYY-MM-DD',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required String field,
    required TextEditingController controller,
    required bool isUpdating,
    TextInputType? keyboardType,
    int maxLines = 1,
    double? minHeight,
    String? hintText,
  }) {
    final isEditing = _isEditing[field]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: Container(
                constraints: minHeight != null
                    ? BoxConstraints(minHeight: minHeight)
                    : null,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                  border: isEditing
                      ? Border.all(color: Colors.blue, width: 2)
                      : null,
                ),
                child: isEditing
                    ? TextField(
                        controller: controller,
                        keyboardType: keyboardType,
                        maxLines: maxLines,
                        enabled: !isUpdating,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hintText: hintText,
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                        ),
                      )
                    : Text(
                        controller.text.isEmpty ? 'Not set' : controller.text,
                        style: TextStyle(
                          color: controller.text.isEmpty
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: isUpdating ? null : () => _toggleEdit(field),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isEditing ? Colors.green.shade100 : backgroundColor,
                  shape: BoxShape.circle,
                ),
                child: isUpdating && _isEditing[field]!
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(
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
}
