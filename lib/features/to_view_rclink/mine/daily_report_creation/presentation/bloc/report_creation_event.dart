// BLoC Events
abstract class ReportCreationEvent {}

class ScopeSelectedEvent extends ReportCreationEvent {
  final String scopeId;
  ScopeSelectedEvent(this.scopeId);
}

class QuantitySelectedEvent extends ReportCreationEvent {
  final List<String> quantityIds;
  QuantitySelectedEvent(this.quantityIds);
}

class FieldUpdatedEvent extends ReportCreationEvent {
  final String fieldId;
  final dynamic value;
  FieldUpdatedEvent(this.fieldId, this.value);
}

class ImageAddedEvent extends ReportCreationEvent {
  final String fieldId;
  final String imagePath;
  ImageAddedEvent(this.fieldId, this.imagePath);
}

class ImageRemovedEvent extends ReportCreationEvent {
  final String fieldId;
  final String imagePath;
  ImageRemovedEvent(this.fieldId, this.imagePath);
}
