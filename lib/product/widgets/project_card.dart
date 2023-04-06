import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 170, height: 50, color: Colors.red,),
                const SizedBox(width: 170,child: Text("data"),),
                SizedBox(width: 170,child: const Text("data"))
              ],
            ),
          ),
        )
    );
  }
}
