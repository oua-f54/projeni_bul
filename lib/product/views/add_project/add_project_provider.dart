import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/app_base_view_provider.dart';
import '../../../models/project.dart';

class AddProjectFormChangeNotifier extends BaseChangeNotifier{
  
  final formKey = GlobalKey<FormState>();

  Project project = Project(id: "", author: "", description: "", image: "", name: "", skill: "");
}

final addProjectNotifier = ChangeNotifierProvider((ref) => AddProjectFormChangeNotifier());