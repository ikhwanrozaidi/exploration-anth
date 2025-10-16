import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/locale_bloc.dart';
import '../bloc/locale_event.dart';
import '../bloc/locale_state.dart';
import '../widgets/app_localization.dart';

class LocalizationTestPage extends StatelessWidget {
  const LocalizationTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localization Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, localeState) {
          final localization = AppLocalizations.of(context);

          log('Current locale: ${localeState.locale.languageCode}');
          log('Localization instance: $localization');

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSection('Current Locale Information', [
                  Text(
                    'Language Code: ${localeState.locale.languageCode}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Language Name: ${localeState.currentLanguageName}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Flag: ${localeState.currentLanguageFlag}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ]),

                const SizedBox(height: 24),

                _buildSection('Change Language', [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: LocaleState.supportedLocales.map((locale) {
                      final isSelected =
                          locale.languageCode ==
                          localeState.locale.languageCode;
                      return ElevatedButton(
                        onPressed: () {
                          context.read<LocaleBloc>().add(ChangeLocale(locale));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isSelected
                              ? Colors.blue
                              : Colors.grey[300],
                          foregroundColor: isSelected
                              ? Colors.white
                              : Colors.black,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              LocaleState.languageFlags[locale.languageCode] ??
                                  '🏳️',
                            ),
                            const SizedBox(width: 8),
                            Text(
                              LocaleState.languageNames[locale.languageCode] ??
                                  'Unknown',
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ]),

                const SizedBox(height: 24),

                _buildSection('Localization Test Results', [
                  if (localization != null) ...[
                    _buildTranslationTest(
                      'Auth - Sign In',
                      localization.auth('signIn'),
                    ),
                    _buildTranslationTest(
                      'Auth - Phone Number',
                      localization.auth('phoneNumber'),
                    ),
                    _buildTranslationTest(
                      'Auth - Next',
                      localization.auth('next'),
                    ),
                    _buildTranslationTest(
                      'Auth - Phone Required',
                      localization.auth('phoneRequired'),
                    ),
                    _buildTranslationTest(
                      'Auth - Phone Invalid',
                      localization.auth('phoneInvalid'),
                    ),
                    _buildTranslationTest(
                      'Auth - SMS Info',
                      localization.auth('smsInfo'),
                    ),
                    _buildTranslationTest(
                      'Auth - OTP Sent',
                      localization.auth('otpSent'),
                    ),

                    const Divider(height: 32),

                    // Shared section tests
                    _buildTranslationTest(
                      'Shared - Submit Button',
                      localization.shared('submitButton'),
                    ),
                    _buildTranslationTest(
                      'Shared - Cancel',
                      localization.shared('cancel'),
                    ),
                    _buildTranslationTest(
                      'Shared - Next',
                      localization.shared('next'),
                    ),
                    _buildTranslationTest(
                      'Shared - Enabled',
                      localization.shared('enabled'),
                    ),
                    _buildTranslationTest(
                      'Shared - Disabled',
                      localization.shared('disabled'),
                    ),

                    const Divider(height: 32),

                    // Main screen section tests
                    _buildTranslationTest(
                      'Main - Title Desc',
                      localization.main('titleDesc'),
                    ),

                    const Divider(height: 32),

                    // Flavor section tests
                    _buildTranslationTest(
                      'Flavor - Configuration',
                      localization.flavor('flavorConfiguration'),
                    ),
                    _buildTranslationTest(
                      'Flavor - Environment',
                      localization.flavor('environment'),
                    ),
                    _buildTranslationTest(
                      'Flavor - Language',
                      localization.flavor('language'),
                    ),

                    const Divider(height: 32),

                    // Test using get method with dot notation
                    _buildTranslationTest(
                      'Get Method - auth.signIn',
                      localization.get('auth.signIn'),
                    ),
                    _buildTranslationTest(
                      'Get Method - shared.next',
                      localization.get('shared.next'),
                    ),
                    _buildTranslationTest(
                      'Get Method - main_screen.titleDesc',
                      localization.get('main_screen.titleDesc'),
                    ),
                  ] else ...[
                    const Card(
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(Icons.error, color: Colors.white),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'ERROR: AppLocalizations is null!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ]),

                const SizedBox(height: 24),

                // Debug Information
                _buildSection('Debug Information', [
                  Card(
                    color: Colors.grey[100],
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Localizations.localeOf(context): ${Localizations.localeOf(context)}',
                          ),
                          Text(
                            'LocaleState.supportedLocales: ${LocaleState.supportedLocales}',
                          ),
                          Text(
                            'AppLocalizations.of(context) != null: ${localization != null}',
                          ),
                          if (localization != null)
                            Text(
                              'Localization instance type: ${localization.runtimeType}',
                            ),
                        ],
                      ),
                    ),
                  ),
                ]),

                const SizedBox(height: 24),

                _buildSection('Test Actions', [
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Test loading saved locale
                            context.read<LocaleBloc>().add(
                              const LoadSavedLocale(),
                            );
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('Reload Saved Locale'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Navigate back
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Go Back'),
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  Widget _buildTranslationTest(String label, String translation) {
    final isTranslated =
        !translation.contains('.') && translation != label.split(' - ').last;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            isTranslated ? Icons.check_circle : Icons.error,
            color: isTranslated ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isTranslated ? Colors.green[50] : Colors.red[50],
                border: Border.all(
                  color: isTranslated ? Colors.green : Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                translation,
                style: TextStyle(
                  color: isTranslated ? Colors.green[800] : Colors.red[800],
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
