enum ImageConstants{
  icChef,
  icDelivery,
  icOrder,
  logo
}

extension ImageConstantsExtention on ImageConstants{

  String convertFullPathInAsset(String name){
    return "asset/images/$name.png";
  }

  String get toName{
    switch(this){
      case ImageConstants.icChef:
        return "ic_chef";
      case ImageConstants.icDelivery:
        return "ic_delivery";
      case ImageConstants.icOrder:
        return "ic_order";
      case ImageConstants.logo:
        return "logo";
    }
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
    }
  }
}