import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/create_payment_request.dart';
import '../../domain/entities/search_response.dart';
import '../../domain/entities/seller_info_entity.dart';
import '../../domain/usecases/create_payment_usecase.dart';
import '../../domain/usecases/search_phone_usecase.dart';
import '../../domain/usecases/search_username_usecase.dart';
import 'escrowpay_event.dart';
import 'escrowpay_state.dart';

@injectable
class EscrowpayBloc extends Bloc<EscrowpayEvent, EscrowpayState> {
  final SearchUsernameUseCase _searchUsernameUseCase;
  final SearchPhoneUseCase _searchPhoneUseCase;
  final CreatePaymentUseCase _createPaymentUseCase;

  // Form data
  String _productName = '';
  String _productDesc = '';
  double _price = 0.0;
  String _sellerUsername = '';
  String _sellerPhone = '';
  SellerInfo? _validatedSeller;
  List<String> _productDescriptions = [];

  EscrowpayBloc(
    this._searchUsernameUseCase,
    this._searchPhoneUseCase,
    this._createPaymentUseCase,
  ) : super(const EscrowpayInitial()) {
    on<EscrowpayFormFieldChanged>(_onFormFieldChanged);
    on<EscrowpaySearchUsername>(_onSearchUsername);
    on<EscrowpaySearchPhone>(_onSearchPhone);
    on<EscrowpayCreatePayment>(_onCreatePayment);
    on<EscrowpayReset>(_onReset);
    on<EscrowpayClearSellerValidation>(_onClearSellerValidation);

    on<EscrowpayDescriptionsChanged>(_onDescriptionsChanged);
  }

  Future<void> _onFormFieldChanged(
    EscrowpayFormFieldChanged event,
    Emitter<EscrowpayState> emit,
  ) async {
    _productName = event.productName;
    _productDesc = event.productDesc;

    // Parse price safely
    try {
      _price = event.price.isEmpty ? 0.0 : double.parse(event.price);
    } catch (e) {
      _price = 0.0;
    }

    _sellerUsername = event.sellerUsername;
    _sellerPhone = event.sellerPhone;

    // Check if form is complete
    final isFormComplete =
        _productName.isNotEmpty &&
        _productDesc.isNotEmpty &&
        _price > 0 &&
        (_sellerUsername.isNotEmpty || _sellerPhone.isNotEmpty) &&
        _validatedSeller != null;

    emit(
      EscrowpayFormValid(
        productName: _productName,
        productDesc: _productDesc,
        price: _price,
        sellerUsername: _sellerUsername,
        sellerPhone: _sellerPhone,
        isFormComplete: isFormComplete,
      ),
    );
  }

  Future<void> _onSearchUsername(
    EscrowpaySearchUsername event,
    Emitter<EscrowpayState> emit,
  ) async {
    print('🔍 Starting username search for: ${event.username}');
    emit(const EscrowpaySellerSearchLoading());

    final result = await _searchUsernameUseCase(
      SearchUsernameParams(event.username),
    );

    result.fold(
      (failure) {
        print('❌ Search failed: ${failure.message}');
        emit(EscrowpayError(_mapFailureToMessage(failure)));
      },
      (response) {
        print('✅ Search success: ${response.message}');
        _handleSearchResponse(response, 'username', emit);
      },
    );
  }

  Future<void> _onSearchPhone(
    EscrowpaySearchPhone event,
    Emitter<EscrowpayState> emit,
  ) async {
    emit(const EscrowpaySellerSearchLoading());

    final result = await _searchPhoneUseCase(SearchPhoneParams(event.phone));

    result.fold(
      (failure) => emit(EscrowpayError(_mapFailureToMessage(failure))),
      (response) => _handleSearchResponse(response, 'phone', emit),
    );
  }

  void _handleSearchResponse(
    SearchResponse response,
    String searchType,
    Emitter<EscrowpayState> emit,
  ) {
    if (response.status == 200) {
      if (response.message == "User found" && response.data is SellerInfo) {
        _validatedSeller = response.data as SellerInfo;
        emit(
          EscrowpaySellerFound(
            sellerInfo: _validatedSeller!,
            searchType: searchType,
          ),
        );
      } else if (response.message == "User Not found") {
        _validatedSeller = null;
        if (searchType == 'username') {
          emit(
            const EscrowpaySellerNotFound(
              message: "Please enter seller's phone number",
              searchType: 'username',
            ),
          );
        } else if (searchType == 'phone') {
          if (response.data is SearchMessage) {
            final searchMessage = response.data as SearchMessage;
            if (searchMessage.message == "Valid") {
              _validatedSeller = SellerInfo(
                userId: '', // Will be handled in backend
                phone: _sellerPhone,
                username: _sellerUsername,
                firstName: '',
                lastName: '',
                address: '',
                profilePic: '',
                status: 'new',
              );
              emit(
                const EscrowpaySellerValidated(
                  message: "Seller validation completed",
                ),
              );
            } else {
              emit(
                EscrowpaySellerNotFound(
                  message: searchMessage.message,
                  searchType: 'phone',
                ),
              );
            }
          }
        }
      }
    } else {
      emit(EscrowpayError('Search failed: ${response.message}'));
    }
  }

  Future<void> _onCreatePayment(
    EscrowpayCreatePayment event,
    Emitter<EscrowpayState> emit,
  ) async {
    emit(const EscrowpayPaymentCreating());

    final result = await _createPaymentUseCase(
      CreatePaymentParams(event.request),
    );

    result.fold(
      (failure) => emit(EscrowpayError(_mapFailureToMessage(failure))),
      (message) => emit(EscrowpayPaymentSuccess(message)),
    );
  }

  Future<void> _onReset(
    EscrowpayReset event,
    Emitter<EscrowpayState> emit,
  ) async {
    _productName = '';
    _productDesc = '';
    _price = 0.0;
    _sellerUsername = '';
    _sellerPhone = '';
    _validatedSeller = null;
    _productDescriptions = [];

    emit(const EscrowpayInitial());
  }

  Future<void> _onClearSellerValidation(
    EscrowpayClearSellerValidation event,
    Emitter<EscrowpayState> emit,
  ) async {
    _validatedSeller = null;

    emit(
      EscrowpayFormValid(
        productName: _productName,
        productDesc: _productDesc,
        price: _price,
        sellerUsername: _sellerUsername,
        sellerPhone: _sellerPhone,
        isFormComplete: false,
      ),
    );
  }

  Future<void> _onDescriptionsChanged(
    EscrowpayDescriptionsChanged event,
    Emitter<EscrowpayState> emit,
  ) async {
    _productDescriptions = event.descriptions;

    final isFormComplete =
        _productName.isNotEmpty &&
        _productDescriptions.isNotEmpty &&
        _price > 0 &&
        (_sellerUsername.isNotEmpty || _sellerPhone.isNotEmpty) &&
        _validatedSeller != null;

    emit(
      EscrowpayFormValid(
        productName: _productName,
        productDesc: _productDescriptions.join(' | '),
        price: _price,
        sellerUsername: _sellerUsername,
        sellerPhone: _sellerPhone,
        isFormComplete: isFormComplete,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (NetworkFailure):
        return failure.message;
      case const (ServerFailure):
        return failure.message;
      case const (ConnectionFailure):
        return 'No internet connection';
      case const (ValidationFailure):
        return failure.message;
      default:
        return 'Something went wrong';
    }
  }

  // Getters for current form state
  String get productName => _productName;
  String get productDesc => _productDesc;
  double get price => _price;
  String get sellerUsername => _sellerUsername;
  String get sellerPhone => _sellerPhone;
  SellerInfo? get validatedSeller => _validatedSeller;
  List<String> get productDescriptions => _productDescriptions;
}
