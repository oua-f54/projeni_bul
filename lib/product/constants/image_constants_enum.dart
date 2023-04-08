enum ImageConstants{
  icChef,
  icDelivery,
  icOrder,
  logo,
  defaultPp
}

extension ImageConstantsExtention on ImageConstants{

  String convertFullPathInAsset(String name){
    return "asset/images/$name.png";
  }

  String get toPath{
    switch(this){
      case ImageConstants.icChef:
        return convertFullPathInAsset("ic_chef");
      case ImageConstants.icDelivery:
        return convertFullPathInAsset("ic_delivery");
      case ImageConstants.icOrder:
        return convertFullPathInAsset("ic_order");
      case ImageConstants.logo:
        return convertFullPathInAsset("logo");
      case ImageConstants.defaultPp:
        return convertFullPathInAsset("default_pp");
    }
  }
}