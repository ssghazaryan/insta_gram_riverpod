import 'package:insta_gram_riverpod/views/components/animations/lottie_animation_view.dart';
import 'package:insta_gram_riverpod/views/components/animations/models/lottie_animation.dart';

class DataNotFoundAnimation extends LottieAnimationView {
  const DataNotFoundAnimation({
    super.key,
  }) : super(
          animation: LottieAnimation.dataNotFound,
        );
}
class EmptyAnimation extends LottieAnimationView {
  const EmptyAnimation({
    super.key,
  }) : super(
          animation: LottieAnimation.empty,
        );
}
class ErrorAnimation extends LottieAnimationView {
  const ErrorAnimation({
    super.key,
  }) : super(
          animation: LottieAnimation.error,
        );
}
class LoadingAnimation extends LottieAnimationView {
  const LoadingAnimation({
    super.key,
  }) : super(
          animation: LottieAnimation.loading,
        );
}
class SmallAnimation extends LottieAnimationView {
  const SmallAnimation({
    super.key,
  }) : super(
          animation: LottieAnimation.smallError,
        );
}
