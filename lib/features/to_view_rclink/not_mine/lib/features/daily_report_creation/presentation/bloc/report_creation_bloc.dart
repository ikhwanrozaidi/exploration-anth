import 'package:flutter_bloc/flutter_bloc.dart';
import '../constant/report_model.dart';
import '../constant/scope_configurations.dart';
import 'report_creation_event.dart';
import 'report_creation_state.dart';

// BLoC Implementation
class ReportCreationBloc
    extends Bloc<ReportCreationEvent, ReportCreationState> {
  final Map<String, ScopeConfig> scopeConfigurations;

  ReportCreationBloc(this.scopeConfigurations) : super(ReportCreationState()) {
    on<ScopeSelectedEvent>(_onScopeSelected);
    on<QuantitySelectedEvent>(_onQuantitySelected);
    on<FieldUpdatedEvent>(_onFieldUpdated);
    on<ImageAddedEvent>(_onImageAdded);
    on<ImageRemovedEvent>(_onImageRemoved);
  }

  void _onScopeSelected(
    ScopeSelectedEvent event,
    Emitter<ReportCreationState> emit,
  ) {
    emit(
      state.copyWith(
        selectedScopeId: event.scopeId,
        selectedQuantityIds: [],
        fieldValues: {},
        imageFields: {},
        fieldErrors: {},
      ),
    );
  }

  void _onQuantitySelected(
    QuantitySelectedEvent event,
    Emitter<ReportCreationState> emit,
  ) {
    emit(state.copyWith(selectedQuantityIds: event.quantityIds));
    _validateForm(emit);
  }

  void _onFieldUpdated(
    FieldUpdatedEvent event,
    Emitter<ReportCreationState> emit,
  ) {
    final newFieldValues = Map<String, dynamic>.from(state.fieldValues);
    newFieldValues[event.fieldId] = event.value;

    emit(state.copyWith(fieldValues: newFieldValues));
    _validateField(event.fieldId, event.value, emit);
  }

  void _onImageAdded(ImageAddedEvent event, Emitter<ReportCreationState> emit) {
    final newImageFields = Map<String, List<String>>.from(state.imageFields);
    final currentImages = newImageFields[event.fieldId] ?? [];
    newImageFields[event.fieldId] = [...currentImages, event.imagePath];

    emit(state.copyWith(imageFields: newImageFields));
    _validateForm(emit);
  }

  void _onImageRemoved(
    ImageRemovedEvent event,
    Emitter<ReportCreationState> emit,
  ) {
    final newImageFields = Map<String, List<String>>.from(state.imageFields);
    final currentImages = newImageFields[event.fieldId] ?? [];
    currentImages.remove(event.imagePath);
    newImageFields[event.fieldId] = currentImages;

    emit(state.copyWith(imageFields: newImageFields));
    _validateForm(emit);
  }

  void _validateField(
    String fieldId,
    dynamic value,
    Emitter<ReportCreationState> emit,
  ) {
    final newErrors = Map<String, String?>.from(state.fieldErrors);

    // Find field configuration
    FieldConfig? fieldConfig;
    if (state.selectedScopeId != null) {
      final scopeConfig = scopeConfigurations[state.selectedScopeId!];
      if (scopeConfig != null) {
        // Check common fields
        try {
          fieldConfig = scopeConfig.commonFields.firstWhere(
            (f) => f.id == fieldId,
          );
        } catch (e) {
          // Field not found in common fields, check quantity fields
          for (final quantity in scopeConfig.quantityOptions) {
            try {
              fieldConfig = quantity.fields.firstWhere(
                (f) => fieldId.endsWith(f.id),
              );
              break;
            } catch (e) {
              // Continue searching
            }
          }
        }
      }
    }

    if (fieldConfig != null) {
      // Validate required fields
      if (fieldConfig.isRequired &&
          (value == null || value.toString().isEmpty)) {
        newErrors[fieldId] = '${fieldConfig.title} is required';
      }
      // Validate numeric ranges
      else if (fieldConfig.type == FieldType.numericField && value != null) {
        final numValue = double.tryParse(value.toString());
        if (numValue == null) {
          newErrors[fieldId] = 'Please enter a valid number';
        } else if (fieldConfig.numericMin != null &&
            numValue < fieldConfig.numericMin!) {
          newErrors[fieldId] = 'Minimum value is ${fieldConfig.numericMin}';
        } else if (fieldConfig.numericMax != null &&
            numValue > fieldConfig.numericMax!) {
          newErrors[fieldId] = 'Maximum value is ${fieldConfig.numericMax}';
        } else {
          newErrors.remove(fieldId);
        }
      } else {
        newErrors.remove(fieldId);
      }
    }

    emit(state.copyWith(fieldErrors: newErrors));
    _validateForm(emit);
  }

  void _validateForm(Emitter<ReportCreationState> emit) {
    final isValid =
        state.fieldErrors.values.every((error) => error == null) &&
        state.selectedScopeId != null;
    emit(state.copyWith(isValid: isValid));
  }
}
