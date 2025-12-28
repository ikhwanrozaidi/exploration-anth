import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_profile.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class UpdateProfileUseCase
    implements UseCase<UserProfile, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserProfile>> call(UpdateProfileParams params) async {
    return await repository.updateProfile(
      email: params.email,
      phone: params.phone,
      country: params.country,
      firstName: params.firstName,
      lastName: params.lastName,
      fullName: params.fullName,
      address: params.address,
      birthDate: params.birthDate,
      profilePicture: params.profilePicture,
    );
  }
}

class UpdateProfileParams extends Equatable {
  final String? email;
  final String? phone;
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? address;
  final String? birthDate;
  final String? profilePicture;

  const UpdateProfileParams({
    this.email,
    this.phone,
    this.country,
    this.firstName,
    this.lastName,
    this.fullName,
    this.address,
    this.birthDate,
    this.profilePicture,
  });

  @override
  List<Object?> get props => [
    email,
    phone,
    country,
    firstName,
    lastName,
    fullName,
    address,
    birthDate,
    profilePicture,
  ];
}
