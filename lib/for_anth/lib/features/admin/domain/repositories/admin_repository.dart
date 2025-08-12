import '../../../../shared/models/api_response.dart';
import '../entities/admin.dart';

abstract class AdminRepository {
  Future<ApiResponse<Admin>> getProfile({bool forceRefresh = false});
  Future<ApiResponse<Admin>> updateProfile(Admin admin);
}
