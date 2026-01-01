import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/database/app_database.dart';
import '../../../../../core/errors/failures.dart';
import '../../domain/entities/payment_details.dart';
import '../../domain/entities/transaction.dart' as entity;
import '../../domain/entities/transaction_board_data.dart';
import '../../domain/entities/transaction_user.dart';

abstract class TransactionBoardLocalDataSource {
  Future<Either<Failure, TransactionBoardData?>> getTransactions();
  Future<Either<Failure, void>> cacheTransactions(TransactionBoardData data);
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: TransactionBoardLocalDataSource)
class TransactionBoardLocalDataSourceImpl
    implements TransactionBoardLocalDataSource {
  final DatabaseService _databaseService;

  TransactionBoardLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, TransactionBoardData?>> getTransactions() async {
    try {
      print('🔍 [TransactionBoardLocalDataSource] Fetching from database...');

      // Get summary data
      final summaryQuery = _database.select(_database.transactionBoardSummary)
        ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)])
        ..limit(1);

      final summaryRecord = await summaryQuery.getSingleOrNull();

      if (summaryRecord == null) {
        print('❌ [TransactionBoardLocalDataSource] No summary found');
        return const Right(null);
      }

      // Get all transactions
      final transactionsQuery = _database.select(_database.transactions);

      final transactionRecords = await transactionsQuery.get();

      if (transactionRecords.isEmpty) {
        print('❌ [TransactionBoardLocalDataSource] No transactions found');
        return const Right(null);
      }

      print(
        '✅ [TransactionBoardLocalDataSource] Found ${transactionRecords.length} transactions',
      );

      // Build transaction entities
      final List<entity.Transaction> transactions = [];

      for (final txRecord in transactionRecords) {
        // Get payment details
        final detailQuery = _database.select(_database.paymentDetailsTable)
          ..where((d) => d.paymentId.equals(txRecord.paymentId));
        final detailRecord = await detailQuery.getSingleOrNull();

        if (detailRecord == null) continue;

        // Get seller info
        final sellerQuery = _database.select(_database.transactionUsers)
          ..where(
            (u) =>
                u.paymentId.equals(txRecord.paymentId) &
                u.userType.equals('seller'),
          );
        final sellerRecord = await sellerQuery.getSingleOrNull();

        // Get buyer info
        final buyerQuery = _database.select(_database.transactionUsers)
          ..where(
            (u) =>
                u.paymentId.equals(txRecord.paymentId) &
                u.userType.equals('buyer'),
          );
        final buyerRecord = await buyerQuery.getSingleOrNull();

        if (buyerRecord == null) continue; // Buyer is required

        // Parse productDesc JSON array
        List<String> productDesc = [];
        try {
          productDesc = List<String>.from(jsonDecode(detailRecord.productDesc));
        } catch (e) {
          print('⚠️ Failed to parse productDesc: $e');
        }

        final transaction = entity.Transaction(
          paymentId: txRecord.paymentId,
          paymentType: txRecord.paymentType,
          sellerId: txRecord.sellerId,
          buyerId: txRecord.buyerId,
          merchantId: txRecord.merchantId,
          amount: txRecord.amount,
          providerId: txRecord.providerId,
          isCompleted: txRecord.isCompleted,
          createdAt: txRecord.createdAt,
          updatedAt: txRecord.updatedAt,
          userRole: txRecord.userRole,
          paymentDetails: PaymentDetails(
            productName: detailRecord.productName,
            productDesc: productDesc,
            productCat: detailRecord.productCat,
            amount: detailRecord.amount,
            refundable: detailRecord.refundable,
            deliveryStatus: detailRecord.deliveryStatus,
          ),
          seller: sellerRecord != null
              ? TransactionUser(
                  id: sellerRecord.userId,
                  email: sellerRecord.email,
                )
              : null,
          buyer: TransactionUser(
            id: buyerRecord.userId,
            email: buyerRecord.email,
          ),
        );

        transactions.add(transaction);
      }

      final data = TransactionBoardData(
        completeOrder: summaryRecord.completeOrder,
        waitReceiveAmount: summaryRecord.waitReceiveAmount,
        completeReceive: summaryRecord.completeReceive,
        waitReleaseAmount: summaryRecord.waitReleaseAmount,
        completeRelease: summaryRecord.completeRelease,
        transactions: transactions,
      );

      print('✅ [TransactionBoardLocalDataSource] Data loaded successfully');
      return Right(data);
    } catch (e, stackTrace) {
      print('❌ [TransactionBoardLocalDataSource] Error: $e');
      print('❌ StackTrace: $stackTrace');
      return Left(CacheFailure('Failed to get transactions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheTransactions(
    TransactionBoardData data,
  ) async {
    try {
      print('💾 [TransactionBoardLocalDataSource] Caching transactions...');

      // 1. Store summary
      await _database
          .into(_database.transactionBoardSummary)
          .insert(
            TransactionBoardSummaryCompanion.insert(
              completeOrder: data.completeOrder,
              waitReceiveAmount: data.waitReceiveAmount,
              completeReceive: data.completeReceive,
              waitReleaseAmount: data.waitReleaseAmount,
              completeRelease: data.completeRelease,
              updatedAt: DateTime.now(),
            ),
            mode: InsertMode.insertOrReplace,
          );

      // 2. Store each transaction
      for (final tx in data.transactions) {
        // Store transaction
        await _database
            .into(_database.transactions)
            .insert(
              TransactionsCompanion.insert(
                paymentId: tx.paymentId,
                paymentType: tx.paymentType,
                sellerId: tx.sellerId,
                buyerId: tx.buyerId,
                merchantId: Value(tx.merchantId),
                amount: tx.amount,
                providerId: tx.providerId,
                isCompleted: tx.isCompleted,
                createdAt: tx.createdAt,
                updatedAt: tx.updatedAt,
                userRole: tx.userRole,
              ),
              mode: InsertMode.insertOrReplace,
            );

        // Store payment details
        await _database
            .into(_database.paymentDetailsTable)
            .insert(
              PaymentDetailsTableCompanion.insert(
                paymentId: tx.paymentId,
                productName: tx.paymentDetails.productName,
                productDesc: jsonEncode(tx.paymentDetails.productDesc),
                productCat: tx.paymentDetails.productCat,
                amount: tx.paymentDetails.amount,
                refundable: tx.paymentDetails.refundable,
                deliveryStatus: tx.paymentDetails.deliveryStatus,
              ),
              mode: InsertMode.insertOrReplace,
            );

        // Store seller info
        if (tx.seller != null) {
          await _database
              .into(_database.transactionUsers)
              .insert(
                TransactionUsersCompanion.insert(
                  paymentId: tx.paymentId,
                  userType: 'seller',
                  userId: tx.seller!.id,
                  email: tx.seller!.email,
                ),
                mode: InsertMode.insertOrReplace,
              );
        }

        // Store buyer info
        await _database
            .into(_database.transactionUsers)
            .insert(
              TransactionUsersCompanion.insert(
                paymentId: tx.paymentId,
                userType: 'buyer',
                userId: tx.buyer.id,
                email: tx.buyer.email,
              ),
              mode: InsertMode.insertOrReplace,
            );
      }

      print(
        '✅ [TransactionBoardLocalDataSource] Cached ${data.transactions.length} transactions',
      );
      return const Right(null);
    } catch (e, stackTrace) {
      print('❌ [TransactionBoardLocalDataSource] Cache error: $e');
      print('❌ StackTrace: $stackTrace');
      return Left(
        CacheFailure('Failed to cache transactions: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      print('🗑️ [TransactionBoardLocalDataSource] Clearing cache...');

      await _database.delete(_database.transactions).go();
      await _database.delete(_database.paymentDetailsTable).go();
      await _database.delete(_database.transactionUsers).go();
      await _database.delete(_database.transactionBoardSummary).go();

      print('✅ [TransactionBoardLocalDataSource] Cache cleared');
      return const Right(null);
    } catch (e) {
      print('❌ [TransactionBoardLocalDataSource] Clear cache error: $e');
      return Left(CacheFailure('Failed to clear cache: ${e.toString()}'));
    }
  }
}
