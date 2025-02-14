part of '../config.dart';

/// For Loading Widget
Widget kLoadingWidget([BuildContext? context]) {
  var loadingConfig = LoadingConfig.fromJson(Configurations.loadingIcon ?? {});
  switch (loadingConfig.layout) {
    case LoadingLayout.image:
      return ImageLoading(loadingConfig);
    case LoadingLayout.rive:
      return RiveLoading(loadingConfig);
    case LoadingLayout.lottie:
      return LottieLoading(loadingConfig);
    case LoadingLayout.spinkit:
      return SpinkitLoading(loadingConfig);
  }
}
