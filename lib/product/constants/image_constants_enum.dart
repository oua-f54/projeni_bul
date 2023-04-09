enum ImageConstants{
  logo,
  defaultPp,
  googleIcon
}

extension ImageConstantsExtention on ImageConstants{

  String convertFullPathInAsset(String name){
    return "asset/images/$name.png";
  }

  String get toPath{
    switch(this){
      case ImageConstants.logo:
        return convertFullPathInAsset("logo");
      case ImageConstants.defaultPp:
        return convertFullPathInAsset("default_pp");
      case ImageConstants.googleIcon:
        return convertFullPathInAsset("google_icon");
    }
  }
}