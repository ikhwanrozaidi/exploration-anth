import 'package:injectable/injectable.dart';

import '../../../../core/database/app_database.dart';
import '../models/contractor_relation_model.dart';

abstract class ContractorRelationLocalDataSource {
  Future<List<ContractorRelationModel>?> getLocal();
  Future<void> saveLocal(List<ContractorRelationModel> contractors);
  Future<void> clearCache();
}

@LazySingleton(as: ContractorRelationLocalDataSource)
class ContractorRelationLocalDataSourceImpl
    implements ContractorRelationLocalDataSource {
  final DatabaseService _databaseService;

  ContractorRelationLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<List<ContractorRelationModel>?> getLocal() async {
    // // TODO: Implement database caching when table is ready
    // print('⚠️ ContractorRelation: Database caching not implemented yet');
    // return null;

    /* 
    // UNCOMMENT WHEN DATABASE TABLE IS READY
    
    try {
      final contractorRecords =
          await _database.select(_database.contractors).get();
      
      if (contractorRecords.isEmpty) {
        return null;
      }

      final List<ContractorRelationModel> contractors = [];

      for (final record in contractorRecords) {
        contractors.add(
          ContractorRelationModel(  // ← Create MODEL, not entity
            id: record.id,
            uid: record.uid,
            name: record.name,
            regNo: record.regNo,
            cidbNo: record.cidbNo,
            address: record.address,
            postalCode: record.postalCode,
            city: record.city,
            state: record.state,
            country: record.country,
            phone: record.phone,
            email: record.email,
            website: record.website,
            companyType: record.companyType,
            bumiputera: record.bumiputera,
            einvoiceTinNo: record.einvoiceTinNo,
            registrationDate: record.registrationDate,
            createdAt: record.createdAt,
            updatedAt: record.updatedAt,
            deletedAt: record.deletedAt,
            ownerID: record.ownerID,
            defaultBankAcc: record.defaultBankAcc,
            defaultBankAccType: record.defaultBankAccType,
            isSelf: record.isSelf,
            contractRelationUID: record.contractRelationUID,
          ),
        );
      }

      return contractors.isEmpty ? null : contractors;
    } catch (e) {
      print('❌ Error loading cached contractors: $e');
      return null;
    }
    */
  }

  @override
  Future<void> saveLocal(List<ContractorRelationModel> contractors) async {
    // TODO: Implement database caching when table is ready
    print(
      '⚠️ ContractorRelation: Skipping cache save (${contractors.length} contractors)',
    );
    print('   Database table not implemented yet');
    return;

    /* 
    // UNCOMMENT WHEN DATABASE TABLE IS READY
    
    try {
      await _database.transaction(() async {
        await _database.delete(_database.contractors).go();

        for (final contractor in contractors) {
          await _database.into(_database.contractors).insertOnConflictUpdate(
                ContractorsCompanion(
                  id: Value(contractor.id),
                  uid: Value(contractor.uid),
                  name: Value(contractor.name),
                  regNo: Value(contractor.regNo),
                  cidbNo: Value(contractor.cidbNo),
                  address: Value(contractor.address),
                  postalCode: Value(contractor.postalCode),
                  city: Value(contractor.city),
                  state: Value(contractor.state),
                  country: Value(contractor.country),
                  phone: Value(contractor.phone),
                  email: Value(contractor.email),
                  website: Value(contractor.website),
                  companyType: Value(contractor.companyType),
                  bumiputera: Value(contractor.bumiputera),
                  einvoiceTinNo: Value(contractor.einvoiceTinNo),
                  registrationDate: Value(contractor.registrationDate),
                  createdAt: Value(contractor.createdAt),
                  updatedAt: Value(contractor.updatedAt),
                  deletedAt: Value(contractor.deletedAt),
                  ownerID: Value(contractor.ownerID),
                  defaultBankAcc: Value(contractor.defaultBankAcc),
                  defaultBankAccType: Value(contractor.defaultBankAccType),
                  isSelf: Value(contractor.isSelf),
                  contractRelationUID: Value(contractor.contractRelationUID),
                  isSynced: const Value(true),
                ),
              );
        }
      });

      print('✅ Cached ${contractors.length} contractors');
    } catch (e) {
      print('❌ Error caching contractors: $e');
    }
    */
  }

  @override
  Future<void> clearCache() async {
    print('⚠️ ContractorRelation: Skipping cache clear');
    print('   Database table not implemented yet');
    return;

    /* 
    // UNCOMMENT WHEN DATABASE TABLE IS READY
    
    try {
      await _database.delete(_database.contractors).go();
      print('✅ Contractor cache cleared from database');
    } catch (e) {
      print('❌ Error clearing contractor cache: $e');
    }
    */
  }
}
