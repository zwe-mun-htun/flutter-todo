part of 'widgets.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.fontSize,
    this.heightButton,
    this.widthButton,
    this.customColor,
    this.textColor,
  });
  final String text;
  final VoidCallback? onPressed;
  final double? fontSize;
  final double? widthButton;
  final double? heightButton;
  final Color? customColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthButton,
      height: heightButton,
      child: TextButton(
          style: ButtonStyle(

              //padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(15)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  customColor ?? AppColors.primaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      // side: BorderSide(
                      //     color: customColor ?? AppColors.primaryColor)
                          ))
                          ),
          onPressed: onPressed,
          child: Text(text,
              style: TextStyle(
                  fontSize: fontSize ?? 18,
                  fontWeight: FontWeight.w700,
                  color: textColor ?? AppColors.white))),
    );
  }
}
