import 'package:get/get.dart';
import '../../utils/app_exports.dart';

class CustomInput {
  static Widget appTextField({
    required String hint,
    TextEditingController? controller,
    TextInputType tp = TextInputType.text,
    int maxLength = 250,
    bool readOnly = false,
    int maxLine = 1,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? validationMsg,
    Function? validation,
    required Function? onChange,
    required String? errorMessage,
    String? initialValue,
    bool expands = false,
    TextAlignVertical textAlignVertical = TextAlignVertical.center,
    TextInputAction textInputAction = TextInputAction.none,
    ValueChanged<String>? onFieldSubmitted,
    Color focusedBorderColor = const Color(0xFFF8F8FA),
    Color? hintColor,
    FontWeight? fontWeight,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          keyboardType: tp,
          maxLength: maxLength,
          maxLines: maxLine,
          expands: expands,
          readOnly: readOnly,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'[^\x00-\x7F]')),
          ],
          textAlignVertical: textAlignVertical,
          textAlign: TextAlign.center, // Center text horizontally
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: fontWeight ?? FontWeight.w500,
            color: readOnly ? AppColors.white : Colors.white,
            fontFamily: CustomFonts.Poppins,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: hintColor ?? const Color(0xFF6F6E6E),
              fontFamily: CustomFonts.Poppins,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade700),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade700),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: focusedBorderColor, width: 2.0),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
          validator: (value) => validation != null ? validation(value) : null,
          onChanged: (value) => onChange != null ? onChange(value) : null,
          buildCounter:
              (
                context, {
                required currentLength,
                required isFocused,
                maxLength,
              }) => const SizedBox(),
        ),
        if (errorMessage != null && errorMessage.isNotEmpty)
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 4.w),
              child: Text(
                errorMessage.toString(),
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.red,
                  fontFamily: CustomFonts.Poppins,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
