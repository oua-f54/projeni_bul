import '../constants/image_constants_enum.dart';
import '../constants/text_constants.dart';

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
