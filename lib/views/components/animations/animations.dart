import 'package:insta_gram_riverpod/views/components/animations/lottie_animation_view.dart';
import 'package:insta_gram_riverpod/views/components/animations/models/lottie_animation.dart';

class DataNotFoundAnimationView extends LottieAnimationView {
  const DataNotFoundAnimationView({
    super.key,
  }) : super(
          animation: LottieAnimation.dataNotFound,
        );
}

class EmptyAnimationView extends LottieAnimationView {
  const EmptyAnimationView({
    super.key,
  }) : super(
          animation: LottieAnimation.empty,
        );
}

class ErrorAnimationView extends LottieAnimationView {
  const ErrorAnimationView({
    super.key,
  }) : super(
          animation: LottieAnimation.error,
        );
}

class LoadingAnimationView extends LottieAnimationView {
  const LoadingAnimationView({
    super.key,
  }) : super(
          animation: LottieAnimation.loading,
        );
}

class SmallErrorAnimationView extends LottieAnimationView {
  const SmallErrorAnimationView({
    super.key,
  }) : super(
          animation: LottieAnimation.smallError,
        );
}
