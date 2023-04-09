import 'package:flutter/material.dart';
import 'package:jam_architecture/product/constants/project_colors.dart';
import "package:kartal/kartal.dart";

class PrimaryElevatedButton extends StatefulWidget {
  const PrimaryElevatedButton({Key? key, required this.text, required this.onPressed, this.isLoading = false}) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  State<PrimaryElevatedButton> createState() => _PrimaryElevatedButtonState();
}

class _PrimaryElevatedButtonState extends State<PrimaryElevatedButton> {

  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = widget.isLoading;
  }

  @override
  void didUpdateWidget(covariant PrimaryElevatedButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.isLoading != oldWidget.isLoading){
      isLoading = widget.isLoading;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.45),
      child: ElevatedButton(onPressed: (){
        widget.onPressed();
      }, 
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: ProjectColors.canvasColor
            ),
          ),
          widget.isLoading?
          Container(
            padding: context.onlyLeftPaddingLow,
            width: 28, height: 20, child: const CircularProgressIndicator(color: Colors.white,)
          )
          :const SizedBox()
        ],
      )
      ),
    );
  }
}
