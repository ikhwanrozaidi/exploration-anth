import 'package:flutter/material.dart';
import '../../core/config/flavor_config.dart';

/// HomePage - Dashboard/Home content (one of the tabs in RootPage)
/// This is just the content for the "Home" tab, not the navigation structure
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final flavorConfig = FlavorConfig.instance;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: _getFlavorColor(flavorConfig.flavor),
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Welcome to RC Link!',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'You are successfully authenticated and ready to use the app.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // App Info Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: _getFlavorColor(flavorConfig.flavor),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'App Information',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow(
                    'Environment',
                    flavorConfig.flavor.name.toUpperCase(),
                  ),
                  _buildInfoRow('Version', flavorConfig.appTitle),
                  _buildInfoRow('API URL', flavorConfig.apiBaseUrl),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Quick Actions Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Actions',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionButton(
                        context,
                        icon: Icons.sync,
                        label: 'Sync Data',
                        onTap: () {
                          // TODO: Implement sync
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Sync feature coming soon!'),
                            ),
                          );
                        },
                      ),
                      _buildActionButton(
                        context,
                        icon: Icons.refresh,
                        label: 'Refresh',
                        onTap: () {
                          // TODO: Implement refresh
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Refreshed!')),
                          );
                        },
                      ),
                      _buildActionButton(
                        context,
                        icon: Icons.help_outline,
                        label: 'Help',
                        onTap: () {
                          // TODO: Implement help
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Help feature coming soon!'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// Helper function - you can move this to a utility file later
Color _getFlavorColor(Flavor flavor) {
  switch (flavor) {
    case Flavor.development:
      return Colors.orange;
    case Flavor.staging:
      return Colors.blue;
    case Flavor.production:
      return Colors.green;
  }
}
