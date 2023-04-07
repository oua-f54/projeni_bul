enum LottieConstants { deneme }

extension LottieItemsExtention on LottieConstants{
  String _path() {
    switch(this){
      case LottieConstants.deneme:
        return "deneme";
    }
  }

  String get lottiePath => "assets/lottie/${_path()}.json";
}