import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';
import 'package:rclink_app/core/database/app_database.dart';
import 'package:rclink_app/features/playground/posts/data/datasources/post_database_extension.dart';
import '../../domain/entities/post.dart';

abstract class PostLocalDataSource {
  Future<List<Post>> getAllPosts();
  Future<Post> insertPost(Post post);
  Future<void> insertPosts(List<Post> posts);
  Future<void> clearAllPosts();
  Future<List<Post>> getUnsyncedPosts();
  Future<void> markPostAsSynced(int id);
  Future<void> addToSyncQueue({
    required int entityId,
    required String action,
    int priority = 0,
  });
}

@LazySingleton(as: PostLocalDataSource)
class PostLocalDataSourceImpl implements PostLocalDataSource {
  final DatabaseService _databaseService;

  PostLocalDataSourceImpl(this._databaseService) {
    print('------PostLocalDataSourceImpl constructor called');
  }

  AppDatabase get _database => _databaseService.database;

  @override
  Future<List<Post>> getAllPosts() async {
    print('------PostLocalDataSourceImpl.getAllPosts called');

    final query = _database.select(_database.posts)
      ..where((p) => p.deletedAt.isNull())
      ..orderBy([(p) => OrderingTerm.desc(p.createdAt)]);

    final results = await query.get();
    print(
      'PostLocalDataSourceImpl.getAllPosts: found ${results.length} posts in local database',
    );

    return results.map((record) => record.toEntity()).toList();
  }

  @override
  Future<Post> insertPost(Post post) async {
    print(
      '------PostLocalDataSourceImpl.insertPost called for post: ${post.title}',
    );

    final companion = PostsCompanion(
      id: Value(post.id), // Use Value() for non-auto-increment primary key
      userId: Value(post.userId),
      title: Value(post.title),
      body: Value(post.body),
      createdAt: Value(post.createdAt ?? DateTime.now()),
      updatedAt: Value(post.updatedAt ?? DateTime.now()),
      isSynced: const Value(false),
      syncAction: const Value('create'),
    );

    await _database
        .into(_database.posts)
        .insert(companion, mode: InsertMode.insertOrReplace);

    // Add to sync queue for later synchronization
    await addToSyncQueue(entityId: post.id, action: 'create');

    print(
      '------PostLocalDataSourceImpl.insertPost: post inserted to local database',
    );
    return post;
  }

  @override
  Future<void> insertPosts(List<Post> posts) async {
    print(
      '------PostLocalDataSourceImpl.insertPosts called for ${posts.length} posts',
    );

    await _database.batch((batch) {
      for (final post in posts) {
        final companion = PostsCompanion(
          id: Value(post.id),
          userId: Value(post.userId),
          title: Value(post.title),
          body: Value(post.body),
          createdAt: Value(post.createdAt ?? DateTime.now()),
          updatedAt: Value(post.updatedAt ?? DateTime.now()),
          isSynced: const Value(true),
          syncAction: const Value.absent(),
        );
        batch.insert(
          _database.posts,
          companion,
          mode: InsertMode.insertOrReplace,
        );
      }
    });

    print(
      'PostLocalDataSourceImpl.insertPosts: ${posts.length} posts inserted to local database',
    );
  }

  @override
  Future<void> clearAllPosts() async {
    print('------PostLocalDataSourceImpl.clearAllPosts called');
    await _database.delete(_database.posts).go();
    print(
      'PostLocalDataSourceImpl.clearAllPosts: all posts cleared from local database',
    );
  }

  @override
  Future<List<Post>> getUnsyncedPosts() async {
    print('------PostLocalDataSourceImpl.getUnsyncedPosts called');

    final query = _database.select(_database.posts)
      ..where((p) => p.isSynced.equals(false) & p.deletedAt.isNull());

    final results = await query.get();
    print(
      'PostLocalDataSourceImpl.getUnsyncedPosts: found ${results.length} unsynced posts',
    );

    return results.map((record) => record.toEntity()).toList();
  }

  @override
  Future<void> markPostAsSynced(int id) async {
    print(
      '------PostLocalDataSourceImpl.markPostAsSynced called for post id: $id',
    );

    final updateQuery = _database.update(_database.posts)
      ..where((p) => p.id.equals(id));

    await updateQuery.write(
      const PostsCompanion(
        isSynced: Value(true),
        syncAction: Value.absent(),
        syncError: Value.absent(),
        lastSyncAttempt: Value.absent(),
      ),
    );

    print(
      '------PostLocalDataSourceImpl.markPostAsSynced: post $id marked as synced',
    );
  }

  @override
  Future<void> addToSyncQueue({
    required int entityId,
    required String action,
    int priority = 0,
  }) async {
    print(
      'PostLocalDataSourceImpl.addToSyncQueue called for post $entityId with action: $action',
    );

    await _database
        .into(_database.syncQueue)
        .insert(
          SyncQueueCompanion.insert(
            entityType: 'post',
            entityUid: entityId.toString(),
            action: action,
            priority: Value(priority),
            createdAt: DateTime.now(),
          ),
        );

    print(
      '------PostLocalDataSourceImpl.addToSyncQueue: sync queue entry added',
    );
  }
}
