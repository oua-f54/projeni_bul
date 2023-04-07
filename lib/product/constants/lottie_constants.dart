enum LottieConstants { onboardThinking }

extension LottieItemsExtention on LottieConstants{
  String _path() {
    switch(this){
      case LottieConstants.onboardThinking:
        return "onboard_thinking";
    }
  }

  String get lottiePath => "asset/lottie/${_path()}.json";
}