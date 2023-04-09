import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/product/constants/color_constants.dart';
import 'package:jam_architecture/product/constants/edgeInsents_constants.dart';
import 'package:jam_architecture/product/constants/text_constants.dart';
import 'package:jam_architecture/repositories/project_repository.dart';
import 'package:jam_architecture/repositories/skill_repository.dart';
import 'package:kartal/kartal.dart';

import '../../widgets/project_card.dart';

class ExploreView extends ConsumerWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillist = ref.watch(skillRepositoryNotifer).skillList;
    final projectList = ref.watch(projectRepositoryNotifer).projectList;

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
              scrollDirection: Axis.vertical,
              child: SizedBox(
                width: 500,
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: skillist.length,
                  itemBuilder: (context, index) {
                    return SingleFilterButton(name: skillist[index].name ?? "");
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsConstants.exploreTittlePadding,
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      padding: context.paddingNormal,
                      child: Text(
                        TextConstants.popularProjects,
                        style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SizedBox(
                        width: context.dynamicWidth(1),
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: projectList.length,
                          itemBuilder: (context, index) {
                            return ProjectCard(project: projectList[index]);
                          },
                        ),
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
                      padding: context.paddingNormal,
                      child: Text(
                        TextConstants.recentAdded,
                        style: context.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Container(
                    padding: context.onlyBottomPaddingMedium,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          width: context.dynamicWidth(1),
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: projectList.length,
                            itemBuilder: (context, index) {
                              return ProjectCard(
                                project: projectList.reversed.toList()[index],
                              );
                            },
                          ),
                        ),
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
    required this.name,
  });

  final String name;

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
            name,
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
        padding: EdgeInsetsConstants.searchBarexternalPadding,
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
