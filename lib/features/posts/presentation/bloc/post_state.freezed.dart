// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostState()';
}


}

/// @nodoc
class $PostStateCopyWith<$Res>  {
$PostStateCopyWith(PostState _, $Res Function(PostState) __);
}


/// Adds pattern-matching-related methods to [PostState].
extension PostStatePatterns on PostState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PostInitial value)?  initial,TResult Function( PostLoading value)?  loading,TResult Function( PostLoaded value)?  loaded,TResult Function( PostError value)?  error,TResult Function( PostCreating value)?  creating,TResult Function( PostCreated value)?  created,TResult Function( PostSyncing value)?  syncing,TResult Function( PostSynced value)?  synced,TResult Function( PostTokenPatched value)?  tokenPatched,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PostInitial() when initial != null:
return initial(_that);case PostLoading() when loading != null:
return loading(_that);case PostLoaded() when loaded != null:
return loaded(_that);case PostError() when error != null:
return error(_that);case PostCreating() when creating != null:
return creating(_that);case PostCreated() when created != null:
return created(_that);case PostSyncing() when syncing != null:
return syncing(_that);case PostSynced() when synced != null:
return synced(_that);case PostTokenPatched() when tokenPatched != null:
return tokenPatched(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PostInitial value)  initial,required TResult Function( PostLoading value)  loading,required TResult Function( PostLoaded value)  loaded,required TResult Function( PostError value)  error,required TResult Function( PostCreating value)  creating,required TResult Function( PostCreated value)  created,required TResult Function( PostSyncing value)  syncing,required TResult Function( PostSynced value)  synced,required TResult Function( PostTokenPatched value)  tokenPatched,}){
final _that = this;
switch (_that) {
case PostInitial():
return initial(_that);case PostLoading():
return loading(_that);case PostLoaded():
return loaded(_that);case PostError():
return error(_that);case PostCreating():
return creating(_that);case PostCreated():
return created(_that);case PostSyncing():
return syncing(_that);case PostSynced():
return synced(_that);case PostTokenPatched():
return tokenPatched(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PostInitial value)?  initial,TResult? Function( PostLoading value)?  loading,TResult? Function( PostLoaded value)?  loaded,TResult? Function( PostError value)?  error,TResult? Function( PostCreating value)?  creating,TResult? Function( PostCreated value)?  created,TResult? Function( PostSyncing value)?  syncing,TResult? Function( PostSynced value)?  synced,TResult? Function( PostTokenPatched value)?  tokenPatched,}){
final _that = this;
switch (_that) {
case PostInitial() when initial != null:
return initial(_that);case PostLoading() when loading != null:
return loading(_that);case PostLoaded() when loaded != null:
return loaded(_that);case PostError() when error != null:
return error(_that);case PostCreating() when creating != null:
return creating(_that);case PostCreated() when created != null:
return created(_that);case PostSyncing() when syncing != null:
return syncing(_that);case PostSynced() when synced != null:
return synced(_that);case PostTokenPatched() when tokenPatched != null:
return tokenPatched(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Post> posts,  bool isFromLocal,  int responseTimeMs,  bool isCreating)?  loaded,TResult Function( String message,  List<Post> cachedPosts)?  error,TResult Function()?  creating,TResult Function( Post post,  List<Post> allPosts)?  created,TResult Function()?  syncing,TResult Function()?  synced,TResult Function()?  tokenPatched,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PostInitial() when initial != null:
return initial();case PostLoading() when loading != null:
return loading();case PostLoaded() when loaded != null:
return loaded(_that.posts,_that.isFromLocal,_that.responseTimeMs,_that.isCreating);case PostError() when error != null:
return error(_that.message,_that.cachedPosts);case PostCreating() when creating != null:
return creating();case PostCreated() when created != null:
return created(_that.post,_that.allPosts);case PostSyncing() when syncing != null:
return syncing();case PostSynced() when synced != null:
return synced();case PostTokenPatched() when tokenPatched != null:
return tokenPatched();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Post> posts,  bool isFromLocal,  int responseTimeMs,  bool isCreating)  loaded,required TResult Function( String message,  List<Post> cachedPosts)  error,required TResult Function()  creating,required TResult Function( Post post,  List<Post> allPosts)  created,required TResult Function()  syncing,required TResult Function()  synced,required TResult Function()  tokenPatched,}) {final _that = this;
switch (_that) {
case PostInitial():
return initial();case PostLoading():
return loading();case PostLoaded():
return loaded(_that.posts,_that.isFromLocal,_that.responseTimeMs,_that.isCreating);case PostError():
return error(_that.message,_that.cachedPosts);case PostCreating():
return creating();case PostCreated():
return created(_that.post,_that.allPosts);case PostSyncing():
return syncing();case PostSynced():
return synced();case PostTokenPatched():
return tokenPatched();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Post> posts,  bool isFromLocal,  int responseTimeMs,  bool isCreating)?  loaded,TResult? Function( String message,  List<Post> cachedPosts)?  error,TResult? Function()?  creating,TResult? Function( Post post,  List<Post> allPosts)?  created,TResult? Function()?  syncing,TResult? Function()?  synced,TResult? Function()?  tokenPatched,}) {final _that = this;
switch (_that) {
case PostInitial() when initial != null:
return initial();case PostLoading() when loading != null:
return loading();case PostLoaded() when loaded != null:
return loaded(_that.posts,_that.isFromLocal,_that.responseTimeMs,_that.isCreating);case PostError() when error != null:
return error(_that.message,_that.cachedPosts);case PostCreating() when creating != null:
return creating();case PostCreated() when created != null:
return created(_that.post,_that.allPosts);case PostSyncing() when syncing != null:
return syncing();case PostSynced() when synced != null:
return synced();case PostTokenPatched() when tokenPatched != null:
return tokenPatched();case _:
  return null;

}
}

}

/// @nodoc


class PostInitial implements PostState {
  const PostInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostState.initial()';
}


}




/// @nodoc


class PostLoading implements PostState {
  const PostLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostState.loading()';
}


}




/// @nodoc


class PostLoaded implements PostState {
  const PostLoaded({required final  List<Post> posts, required this.isFromLocal, required this.responseTimeMs, this.isCreating = false}): _posts = posts;
  

 final  List<Post> _posts;
 List<Post> get posts {
  if (_posts is EqualUnmodifiableListView) return _posts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_posts);
}

 final  bool isFromLocal;
 final  int responseTimeMs;
@JsonKey() final  bool isCreating;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostLoadedCopyWith<PostLoaded> get copyWith => _$PostLoadedCopyWithImpl<PostLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostLoaded&&const DeepCollectionEquality().equals(other._posts, _posts)&&(identical(other.isFromLocal, isFromLocal) || other.isFromLocal == isFromLocal)&&(identical(other.responseTimeMs, responseTimeMs) || other.responseTimeMs == responseTimeMs)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_posts),isFromLocal,responseTimeMs,isCreating);

@override
String toString() {
  return 'PostState.loaded(posts: $posts, isFromLocal: $isFromLocal, responseTimeMs: $responseTimeMs, isCreating: $isCreating)';
}


}

/// @nodoc
abstract mixin class $PostLoadedCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory $PostLoadedCopyWith(PostLoaded value, $Res Function(PostLoaded) _then) = _$PostLoadedCopyWithImpl;
@useResult
$Res call({
 List<Post> posts, bool isFromLocal, int responseTimeMs, bool isCreating
});




}
/// @nodoc
class _$PostLoadedCopyWithImpl<$Res>
    implements $PostLoadedCopyWith<$Res> {
  _$PostLoadedCopyWithImpl(this._self, this._then);

  final PostLoaded _self;
  final $Res Function(PostLoaded) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? posts = null,Object? isFromLocal = null,Object? responseTimeMs = null,Object? isCreating = null,}) {
  return _then(PostLoaded(
posts: null == posts ? _self._posts : posts // ignore: cast_nullable_to_non_nullable
as List<Post>,isFromLocal: null == isFromLocal ? _self.isFromLocal : isFromLocal // ignore: cast_nullable_to_non_nullable
as bool,responseTimeMs: null == responseTimeMs ? _self.responseTimeMs : responseTimeMs // ignore: cast_nullable_to_non_nullable
as int,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class PostError implements PostState {
  const PostError({required this.message, final  List<Post> cachedPosts = const []}): _cachedPosts = cachedPosts;
  

 final  String message;
 final  List<Post> _cachedPosts;
@JsonKey() List<Post> get cachedPosts {
  if (_cachedPosts is EqualUnmodifiableListView) return _cachedPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cachedPosts);
}


/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostErrorCopyWith<PostError> get copyWith => _$PostErrorCopyWithImpl<PostError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostError&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._cachedPosts, _cachedPosts));
}


@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(_cachedPosts));

@override
String toString() {
  return 'PostState.error(message: $message, cachedPosts: $cachedPosts)';
}


}

/// @nodoc
abstract mixin class $PostErrorCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory $PostErrorCopyWith(PostError value, $Res Function(PostError) _then) = _$PostErrorCopyWithImpl;
@useResult
$Res call({
 String message, List<Post> cachedPosts
});




}
/// @nodoc
class _$PostErrorCopyWithImpl<$Res>
    implements $PostErrorCopyWith<$Res> {
  _$PostErrorCopyWithImpl(this._self, this._then);

  final PostError _self;
  final $Res Function(PostError) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? cachedPosts = null,}) {
  return _then(PostError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,cachedPosts: null == cachedPosts ? _self._cachedPosts : cachedPosts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class PostCreating implements PostState {
  const PostCreating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostCreating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostState.creating()';
}


}




/// @nodoc


class PostCreated implements PostState {
  const PostCreated({required this.post, required final  List<Post> allPosts}): _allPosts = allPosts;
  

 final  Post post;
 final  List<Post> _allPosts;
 List<Post> get allPosts {
  if (_allPosts is EqualUnmodifiableListView) return _allPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allPosts);
}


/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCreatedCopyWith<PostCreated> get copyWith => _$PostCreatedCopyWithImpl<PostCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostCreated&&(identical(other.post, post) || other.post == post)&&const DeepCollectionEquality().equals(other._allPosts, _allPosts));
}


@override
int get hashCode => Object.hash(runtimeType,post,const DeepCollectionEquality().hash(_allPosts));

@override
String toString() {
  return 'PostState.created(post: $post, allPosts: $allPosts)';
}


}

/// @nodoc
abstract mixin class $PostCreatedCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory $PostCreatedCopyWith(PostCreated value, $Res Function(PostCreated) _then) = _$PostCreatedCopyWithImpl;
@useResult
$Res call({
 Post post, List<Post> allPosts
});




}
/// @nodoc
class _$PostCreatedCopyWithImpl<$Res>
    implements $PostCreatedCopyWith<$Res> {
  _$PostCreatedCopyWithImpl(this._self, this._then);

  final PostCreated _self;
  final $Res Function(PostCreated) _then;

/// Create a copy of PostState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? post = null,Object? allPosts = null,}) {
  return _then(PostCreated(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,allPosts: null == allPosts ? _self._allPosts : allPosts // ignore: cast_nullable_to_non_nullable
as List<Post>,
  ));
}


}

/// @nodoc


class PostSyncing implements PostState {
  const PostSyncing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostSyncing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostState.syncing()';
}


}




/// @nodoc


class PostSynced implements PostState {
  const PostSynced();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostSynced);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostState.synced()';
}


}




/// @nodoc


class PostTokenPatched implements PostState {
  const PostTokenPatched();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostTokenPatched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PostState.tokenPatched()';
}


}




// dart format on
