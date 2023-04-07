
import 'package:flutter/material.dart';
import 'package:jam_architecture/app/app_base_view_model.dart';
import 'package:jam_architecture/product/views/onboard/onboard_view.dart';

import '../../constants/image_constants_enum.dart';
import '../../constants/text_constants.dart';

abstract class OnboardViewModel extends BaseViewModel<OnboardView>{
  int currentIndex = 0;
  int lastItem = OnboardItems.datas.length - 1;

  bool get isLastItem => currentIndex == lastItem;
  bool get isFirstItem => currentIndex == 0;

  ValueNotifier<bool> isBackEnable = ValueNotifier(true);

  final PageController onBoardPageController = PageController();

  void incrementSelectedPage(){
    if(isLastItem){
      return;
    }
    setSelectedPage(currentIndex+1);
  }

  void reductiomSelectedPage(){
    if(isFirstItem){
      return;
    }
    setSelectedPage(currentIndex-1);
  }

  void setSelectedPage(int value){
    if(value == lastItem){
      isBackEnable.value = false;
    }else{
      isBackEnable.value = true;
    }
    setState(() {
      currentIndex = value;
    });
    onBoardPageController.animateToPage(
        currentIndex, 
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
  }

  void changeIsBackEnable(bool value){
    if(value == isBackEnable.value){
      return;
    }
    isBackEnable.value = value;
  }
}

class Onboard{
  final String title;
  final String description;
  final String imagePath;

  Onboard(this.title, this.description, this.imagePath);

  String get imageWithPath => "asset/images/$imagePath.png";
}

class OnboardItems {
  static final List<Onboard> datas = [
    Onboard(TextConstants.onboardTitle, TextConstants.onboardSubtitle, ImageConstants.icChef.toName),
    Onboard(TextConstants.onboardTitle, TextConstants.onboardSubtitle, ImageConstants.icDelivery.toName),
    Onboard(TextConstants.onboardTitle, TextConstants.onboardSubtitle, ImageConstants.icOrder.toName)
  ];
}