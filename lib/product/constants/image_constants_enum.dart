enum ImageConstants{
  logo,
  defaultPp
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
    }
  }
}