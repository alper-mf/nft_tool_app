import 'package:flutter/material.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class LoadingProgress {
  LoadingProgress.showLoading(BuildContext context) {
    OverlayLoadingProgress.start(context, barrierDismissible: false);
  }

  LoadingProgress.done(BuildContext context) {
    OverlayLoadingProgress.stop(
      context,
    );
  }
}
