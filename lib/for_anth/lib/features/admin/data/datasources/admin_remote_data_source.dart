import 'package:injectable/injectable.dart';
import '../../../auth/data/datasources/auth_api_service.dart';

abstract class AdminRemoteDataSource {
  // TODO: Implement admin-specific API methods when needed
  // For now, this is a placeholder for future admin operations
}

@LazySingleton(as: AdminRemoteDataSource)
class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  final AuthApiService _authApiService;

  AdminRemoteDataSourceImpl(this._authApiService);

  // TODO: Implement admin-specific remote operations
  // Future<Admin> getAdminProfile() async { ... }
  // Future<void> updateAdminProfile(Admin admin) async { ... }
}
