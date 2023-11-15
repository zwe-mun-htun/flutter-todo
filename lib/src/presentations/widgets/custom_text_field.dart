part of 'widgets.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? titleStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? labelText;
  final String? title;
  final bool? obscured;
  final bool? hasPrefixIcon;
  final bool? hasSuffixIcon;
  final bool? hasTitle;
  final bool? hasTitleIcon;
  final Widget? titleIcon;
  final TextInputType? textInputType;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? textFormFieldMargin;
  final int? maxLine;
  final String? initialValue;
  final bool? isRequired;
  final bool? enabled;
  final FocusNode? focusNode;
  final bool? readOnly;
  final Color? backgroundColor;
  final BoxDecoration? decoration;

  const CustomTextField(
      {Key? key,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.textStyle,
      this.hintTextStyle,
      this.labelStyle,
      this.titleStyle,
      this.titleIcon,
      this.hasTitleIcon = false,
      this.title,
      this.contentPadding,
      this.textFormFieldMargin,
      this.hasTitle = false,
      this.border = Borders.primaryInputBorder,
      this.focusedBorder = Borders.focusedBorder,
      this.enabledBorder = Borders.enabledBorder,
      this.hintText,
      this.labelText,
      this.hasPrefixIcon = false,
      this.hasSuffixIcon = false,
      this.obscured = false,
      this.textInputType,
      this.onTap,
      this.onChanged,
      this.onSubmitted,
      this.validator,
      this.inputFormatters,
      this.width,
      this.height,
      this.maxLine,
      this.initialValue,
      this.isRequired,
      this.enabled,
      this.focusNode,
      this.readOnly,
      this.backgroundColor,
      this.decoration})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObsureText = false;

  @override
  void initState() {
    super.initState();
    _isObsureText = widget.obscured!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.textFormFieldMargin,
      decoration: widget.decoration ??
          BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.backgroundColor),
      child: TextFormField(
        focusNode: widget.focusNode,
        style: widget.textStyle,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        onChanged: widget.onChanged,
        enabled: widget.enabled,
        initialValue: widget.initialValue,
        validator: widget.validator,
        onFieldSubmitted: widget.onSubmitted,
        inputFormatters: widget.inputFormatters,
        cursorColor: AppColors.primaryColor.withAlpha(50),
        maxLines: widget.maxLine ?? 1,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          border: widget.border,
          enabledBorder: widget.enabledBorder,
          focusedBorder: Borders.noBorder,
          disabledBorder: Borders.noBorder,
          prefixIcon: widget.hasPrefixIcon! ? widget.prefixIcon : null,
          suffixIcon: widget.hasSuffixIcon! ? widget.suffixIcon : null,
          hintText: widget.hintText,
          hintStyle: widget.hintTextStyle,
        ),
        obscureText: widget.hasSuffixIcon! ? _isObsureText : widget.obscured!,
      ),
    );
  }
}
