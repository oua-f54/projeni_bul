import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_back_button.dart';

@RoutePage()
class ProjectDetailView extends StatelessWidget {
  const ProjectDetailView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Container(
        color: Colors.red,
      )
    );
  }
}
