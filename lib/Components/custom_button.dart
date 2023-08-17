import 'package:flutter/material.dart';
import 'package:thebrand/Utils/custom_theme.dart';

class CustomButton extends StatefulWidget {
  final String? text;
  final void Function()? onPressed;
  final bool isLoading;
  CustomButton({Key? key, this.isLoading = false, required this.onPressed, required this.text}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: CustomTheme.yellow,
        boxShadow: CustomTheme.buttonShadow
      ),
      child: MaterialButton(onPressed: widget.isLoading ? null : widget.onPressed,
      child: widget.isLoading ? CircularProgressIndicator() : Text("${widget.text}", style: Theme.of(context).textTheme.titleSmall,),),
    );
  }
}