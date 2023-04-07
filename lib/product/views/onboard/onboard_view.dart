import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/app/app_router.dart';
import 'package:jam_architecture/product/constants/project_colors.dart';
import 'package:jam_architecture/product/views/onboard/onboard_view_model.dart';
import 'package:jam_architecture/product/widgets/description_text.dart';
import 'package:jam_architecture/product/widgets/title_text.dart';
import 'package:lottie/lottie.dart';

import '../../constants/color_constants.dart';
import '../../constants/edgeInsents_constants.dart';
import '../../constants/text_constants.dart';
import '../../widgets/project_back_button.dart';
import '../../widgets/skip_button.dart';

part './widgets/onboard_bottom_bar.dart';
part './widgets/onboard_card.dart';
part './widgets/onboard_image.dart';
part './widgets/onboard_tab_indicator.dart';

@RoutePage()
class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends OnboardViewModel{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [
            Expanded(
              flex: 14,
              child: PageView.builder(
                controller: onBoardPageController,
                onPageChanged: (value) {
                  setSelectedPage(value);
                },
                itemCount: OnboardItems.datas.length,
                itemBuilder: (context, index) {
                  return _OnboardCard(index: index,onboard: OnboardItems.datas[index],);
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: _OnboardBottomBar(
                isLastItem: isLastItem,
                index: currentIndex,
                onPressButton: (){incrementSelectedPage();}
              ),
            )
          ],
        )
      );
  }

  AppBar _appBar() {
    return AppBar(
        backgroundColor: ColorConstants.transparent,
        actions: [
          ValueListenableBuilder(
            valueListenable: isBackEnable, 
            builder: (context, value, child) {
              return value? const SkipButton() : const SizedBox();
            }
          )
        ],
        leading: isFirstItem? null : ProjectBackButton(onPressed: (){reductiomSelectedPage();}),
      );
  }
}

