import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/product/constants/edgeInsents_constants.dart';
import 'package:jam_architecture/product/constants/image_constants_enum.dart';
import 'package:jam_architecture/repositories/user_repository.dart';
import 'package:kartal/kartal.dart';

import '../../../widgets/project_card.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: context.width,
        child: Column(
          children: [
            Container(
                padding: EdgeInsetsConstants.exploreSizeBoxPadding,
                width: context.dynamicWidth(0.5),
                child: TextButton(
                    onPressed: () {},
                    child: Image.asset(ImageConstants.defaultPp.toPath))),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: Text(
                      "Ahmet",
                      style: context.textTheme.titleLarge,
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsConstants.textEmailPadding,
                    child: Text(
                      ref.read(userRepositoryNotifer).auth.currentUser?.email ??
                          "",
                      style:
                          context.textTheme.bodySmall?.copyWith(fontSize: 15),
                    ),
                  ),
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
                      padding: EdgeInsetsConstants.textProjectPadding,
                      child: Text(
                        "Your Projects",
                        style: context.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsetsConstants.rowBottomPadding,
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
            )
          ],
        ),
      ),
    ));
  }
}
