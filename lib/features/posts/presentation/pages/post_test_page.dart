import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';
import '../../domain/entities/post.dart';

class PostsTestPage extends StatefulWidget {
  const PostsTestPage({super.key});

  @override
  State<PostsTestPage> createState() => _PostsTestPageState();
}

class _PostsTestPageState extends State<PostsTestPage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print('------PostsTestPage.initState called');
  }

  @override
  void dispose() {
    print('------PostsTestPage.dispose called');
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('------PostsTestPage.build called');

    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Clean Architecture'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          print(
            'PostsTestPage.BlocListener: State changed to ${state.runtimeType}',
          );

          state.maybeWhen(
            error: (message, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            created: (post, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Post created: ${post.title}'),
                  backgroundColor: Colors.green,
                ),
              );
              // Clear form
              _titleController.clear();
              _bodyController.clear();
            },
            synced: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Posts synced successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            tokenPatched: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Access token patched!'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            orElse: () {},
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Control Buttons Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Test Controls',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Patch Access Token Button
                        ElevatedButton.icon(
                          onPressed: () {
                            print(
                              'PostsTestPage: Patch Access Token button pressed',
                            );
                            context.read<PostBloc>().add(
                              const PatchAccessToken(),
                            );
                          },
                          icon: const Icon(Icons.security),
                          label: const Text('Patch Access Token'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Fetch Posts Button
                        ElevatedButton.icon(
                          onPressed: () {
                            print(
                              '------PostsTestPage: Fetch Posts button pressed',
                            );
                            context.read<PostBloc>().add(
                              const LoadPosts(forceRefresh: true),
                            );
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('Fetch Posts (Force Refresh)'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Load Local Posts Button
                        ElevatedButton.icon(
                          onPressed: () {
                            print(
                              'PostsTestPage: Load Local Posts button pressed',
                            );
                            context.read<PostBloc>().add(
                              const LoadLocalPosts(),
                            );
                          },
                          icon: const Icon(Icons.storage),
                          label: const Text('Load Local Posts Only'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Sync Posts Button
                        ElevatedButton.icon(
                          onPressed: () {
                            print(
                              '------PostsTestPage: Sync Posts button pressed',
                            );
                            context.read<PostBloc>().add(const SyncPosts());
                          },
                          icon: const Icon(Icons.sync),
                          label: const Text('Sync Unsynced Posts'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Create Post Section
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Create New Post',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        TextField(
                          controller: _titleController,
                          decoration: const InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 8),

                        TextField(
                          controller: _bodyController,
                          decoration: const InputDecoration(
                            labelText: 'Body',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                        ),

                        const SizedBox(height: 16),

                        BlocBuilder<PostBloc, PostState>(
                          builder: (context, state) {
                            final isCreating = state.maybeWhen(
                              creating: () => true,
                              loaded: (_, __, ___, isCreating) => isCreating,
                              orElse: () => false,
                            );

                            return ElevatedButton.icon(
                              onPressed: isCreating
                                  ? null
                                  : () {
                                      print(
                                        'PostsTestPage: Create Post button pressed',
                                      );
                                      if (_titleController.text
                                              .trim()
                                              .isNotEmpty &&
                                          _bodyController.text
                                              .trim()
                                              .isNotEmpty) {
                                        context.read<PostBloc>().add(
                                          CreatePost(
                                            userId: 1,
                                            title: _titleController.text.trim(),
                                            body: _bodyController.text.trim(),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Please fill in both title and body',
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                              icon: isCreating
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.add),
                              label: Text(
                                isCreating ? 'Creating...' : 'Create Post',
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 700,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Posts List',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        BlocBuilder<PostBloc, PostState>(
                          builder: (context, state) {
                            return state.when(
                              initial: () => const Text(
                                'Press "Fetch Posts" to load data',
                              ),

                              loading: () => const Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Loading posts...'),
                                ],
                              ),

                              loaded:
                                  (
                                    posts,
                                    isFromLocal,
                                    responseTime,
                                    isCreating,
                                  ) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: isFromLocal
                                              ? Colors.orange.shade100
                                              : Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              isFromLocal
                                                  ? Icons.storage
                                                  : Icons.cloud_download,
                                              size: 16,
                                              color: isFromLocal
                                                  ? Colors.orange
                                                  : Colors.green,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              isFromLocal
                                                  ? 'Data Source: LOCAL DATABASE'
                                                  : 'Data Source: REMOTE API',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: isFromLocal
                                                    ? Colors.orange.shade800
                                                    : Colors.green.shade800,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Response Time: ${responseTime}ms | Total Posts: ${posts.length}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),

                              creating: () => const Text('Creating post...'),

                              created: (post, allPosts) =>
                                  Text('Created: ${post.title}'),

                              syncing: () => const Text('Syncing posts...'),

                              synced: () =>
                                  const Text('Posts synced successfully!'),

                              tokenPatched: () =>
                                  const Text('Access token patched!'),

                              error: (message, cachedPosts) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade100,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.error,
                                          size: 16,
                                          color: Colors.red,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            'Error: $message',
                                            style: const TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (cachedPosts.isNotEmpty) ...[
                                    const SizedBox(height: 8),
                                    Text(
                                      'Showing ${cachedPosts.length} cached posts',
                                    ),
                                  ],
                                ],
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 16),

                        Expanded(
                          child: BlocBuilder<PostBloc, PostState>(
                            builder: (context, state) {
                              final posts = state.maybeWhen(
                                loaded: (posts, _, __, ___) => posts,
                                error: (_, cachedPosts) => cachedPosts,
                                orElse: () => <Post>[],
                              );

                              if (posts.isEmpty) {
                                return const Center(
                                  child: Text('No posts available'),
                                );
                              }

                              return ListView.builder(
                                itemCount: posts.length,
                                itemBuilder: (context, index) {
                                  final post = posts[index];
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: post.isSynced
                                            ? Colors.green
                                            : Colors.orange,
                                        child: Icon(
                                          post.isSynced
                                              ? Icons.cloud_done
                                              : Icons.sync_problem,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                      title: Text(
                                        post.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            post.body,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(height: 2),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'ID: ${post.id} | User: ${post.userId}',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey[600],
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 1,
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: post.isSynced
                                                      ? Colors.green.shade100
                                                      : Colors.orange.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  post.isSynced
                                                      ? 'SYNCED'
                                                      : 'LOCAL',
                                                  style: TextStyle(
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.bold,
                                                    color: post.isSynced
                                                        ? Colors.green.shade800
                                                        : Colors
                                                              .orange
                                                              .shade800,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      isThreeLine: true,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
