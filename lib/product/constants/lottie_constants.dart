enum LottieConstants { onboardThinking, onboardTeam, onboardProject }

extension LottieItemsExtention on LottieConstants{
  String _path() {
    switch(this){
      case LottieConstants.onboardThinking:
        return "onboard_thinking";
      case LottieConstants.onboardTeam:
        return "onboard_team";
      case LottieConstants.onboardProject:
        return "onboard_project";
    }
  }

  String get lottiePath => "asset/lottie/${_path()}.json";
}