import 'package:flutter/material.dart';

class BtnElevated extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const BtnElevated({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,    
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Button Size
      width: width ?? double.infinity,
      height: height ?? 48,
      child: ElevatedButton(
        // Button Clicked
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          // Button Color
          backgroundColor: backgroundColor ?? Colors.orange ,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            // Button Border
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(                
                text,
                style: const TextStyle(
                  // Button Text Style
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
      ),
    );
  }
}

/*
  BtnElevated(text: "Button Elevated", onPressed: _GetTxtControllerValue,height: 40,),
 */