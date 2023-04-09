
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/app/app_router.dart';
import 'package:jam_architecture/product/constants/color_constants.dart';
import 'package:jam_architecture/product/views/add_project/add_project_provider.dart';
import 'package:jam_architecture/product/widgets/custom_back_button.dart';
import 'package:jam_architecture/product/widgets/title_text.dart';
import 'package:jam_architecture/repositories/project_repository.dart';
import 'package:kartal/kartal.dart';


@RoutePage()
class AddProjectView extends ConsumerWidget {
  const AddProjectView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final project = ref.watch(addProjectNotifier).project;
    final formKey = ref.watch(addProjectNotifier).formKey;
    final isLoading = ref.watch(addProjectNotifier).isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          isLoading?
          Container(padding: context.onlyRightPaddingLow, child: const CircularProgressIndicator())
          :const SizedBox()
        ],
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          width: context.width,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Form(
            key: ref.watch(addProjectNotifier).formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(text: "Create New Project"),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        decoration: const InputDecoration(label: Text("Project Name")),
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value.isNullOrEmpty) {
                            return "Bu alan boş bırakılamaz";
                          }
                          return null;
                        },
                        onSaved: (value){
                          project.name = value;
                        },
                      ),
                    ),  
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: TextFormField(
                        minLines: 4, maxLines: 5,decoration: const InputDecoration(labelText: "Project Description", alignLabelWithHint: true),
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          if (value.isNullOrEmpty) {
                            return "Bu alan boş bırakılamaz";
                          }
                          return null;
                        },
                        onSaved: (value){
                          project.description = value;
                        },
                      ),
                    ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: const CustomDropdownButton()
                ),
                ElevatedButton(onPressed: isLoading? null : () async{
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    ref.read(addProjectNotifier).changeLoading();
                    try{
                      await ref.read(projectRepositoryNotifer).addProject(project);
                      await ref.read(projectRepositoryNotifer).getOwnProjects();
                      await ref.read(projectRepositoryNotifer).getAllProjects();
                    }catch(error){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
                      return;
                    }finally{
                      ref.read(addProjectNotifier).changeLoading();
                    }
                    context.replaceRoute(const HomeRoute());
                  }
                }, child: Text("Save", style: context.textTheme.labelLarge,))
              ],
            ),
          ),
        ),
      )
    );
  }
}

class CustomDropdownButton extends ConsumerWidget {
    const CustomDropdownButton({super.key});  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final providerWatch = ref.watch(dropDownProvider);
    final providerRead = ref.read(dropDownProvider);

    return Container(
      padding: const EdgeInsets.only(left:8),
      width: context.dynamicWidth(0.5),
        
      decoration: BoxDecoration(border: Border.all(color: ColorConstants.whiteGrey), borderRadius: BorderRadius.circular(8),),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: providerWatch.dropdownValue,
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (value) {
            providerRead.changeValue(value);
            ref.watch(addProjectNotifier).project.skill = value;
          },
          items: providerWatch.list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class DropDownChangeProvider extends ChangeNotifier{
  List<String> list = <String>['','Flutter', 'Java', 'Pyhthon', 'C'];
  String? dropdownValue = "";

  void changeValue(value){
    dropdownValue = value;
    notifyListeners();
  }
}

final dropDownProvider = ChangeNotifierProvider((ref) => DropDownChangeProvider());