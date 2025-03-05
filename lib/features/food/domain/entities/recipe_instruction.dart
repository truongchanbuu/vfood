import 'package:equatable/equatable.dart';

class RecipeInstruction extends Equatable {
  final int step;
  final String stepTitle;
  final String stepDescription;
  final List<String> imageUrls;
  final Duration? duration;

  const RecipeInstruction({
    required this.step,
    required this.stepTitle,
    required this.stepDescription,
    this.imageUrls = const [],
    this.duration,
  });

  @override
  List<Object?> get props => [
        step,
        stepTitle,
        stepDescription,
        imageUrls,
        duration,
      ];
}
