import 'package:flutter/material.dart';
import 'package:jam_architecture/product/constants/color_constants.dart';
import 'package:jam_architecture/product/constants/edgeInsents_constants.dart';
import 'package:jam_architecture/product/constants/text_constants.dart';
import 'package:kartal/kartal.dart';

import '../../../widgets/project_card.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsetsConstants.exploreGeneralPadding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Expanded(flex: 8, child: SearcBar()),
                  Expanded(flex: 1, child: FilterButton()),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  SingleFilterButton(),
                  SingleFilterButton(),
                  SingleFilterButton(),
                  SingleFilterButton(),
                  SingleFilterButton(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsetsConstants.exploreTittlePadding,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsetsConstants.paddingMedium,
                      child: Text(
                        TextConstants.popularProjects,
                        style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: const [
                          ProjectCard(),
                          ProjectCard(),
                          ProjectCard(),
                          ProjectCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsetsConstants.exploreSizeBoxPadding,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: EdgeInsetsConstants.paddingMedium,
                      child: Text(
                        TextConstants.recentAdded,
                        style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      child: Row(
                        children: const [
                          ProjectCard(),
                          ProjectCard(),
                          ProjectCard(),
                          ProjectCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: EdgeInsetsConstants.horizontalPaddingNone,
          fixedSize: const Size(20, 20),
          side: const BorderSide(color: Color.fromARGB(59, 0, 0, 0))),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(TextConstants.commingSoon)));
      },
      child: Center(
          child: Icon(
        Icons.sort_outlined,
        color: ColorConstants.appGreen,
      )),
    ));
  }
}

class SingleFilterButton extends StatelessWidget {
  const SingleFilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsConstants.horizantalPaddingMedium,
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(TextConstants.commingSoon)));
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsetsConstants.singlerFilterButtonPadding, backgroundColor: ColorConstants.appYellow),
          child: Text(
            "Flutter",
            style: context.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ));
  }
}

class SearcBar extends StatelessWidget {
  const SearcBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsetsConstants.externalPadding,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsetsConstants.searchBarInnerPadding,
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: ColorConstants.appGreen,
                label: Text(TextConstants.search),
                border: customOutline(),
                focusedBorder: customOutline(),
                enabledBorder: customOutline(),
              ),
            ));
  }

  OutlineInputBorder customOutline() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(color: Color.fromARGB(59, 0, 0, 0)),
    );
  }
}
