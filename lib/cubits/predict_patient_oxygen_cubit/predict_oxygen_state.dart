import 'package:equatable/equatable.dart';
import '../../models/predict_response_model.dart';

abstract class PredictOxygenState extends Equatable {
  const PredictOxygenState();

  @override
  List<Object> get props => [];
}

class PredictOxygenInitial extends PredictOxygenState {}

class PredictOxygenLoading extends PredictOxygenState {}

class PredictOxygenLoaded extends PredictOxygenState {
  final PredictResponseModel response;

  const PredictOxygenLoaded(this.response);

  @override
  List<Object> get props => [response];
}

class PredictOxygenError extends PredictOxygenState {
  final String message;

  const PredictOxygenError(this.message);

  @override
  List<Object> get props => [message];
}

