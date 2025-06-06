import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heroicons_flutter/heroicons_flutter.dart';
import 'package:nobschat/color_extension.dart';
import 'package:nobschat/common/custom_button.dart';
import 'package:nobschat/reusable_text_widget.dart';

class TestLogin extends StatefulWidget {
  const TestLogin({super.key});

  @override
  State<TestLogin> createState() => _TestLoginState();
}

class _TestLoginState extends State<TestLogin> {
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.White,
      body: Container(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: Tcolor.BACKGROUND_Dark,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    // Get.to(() => NextScreen());
                  },
                  icon: Icon(
                    HeroiconsOutline.arrowLeft,
                    color: Tcolor.Text,
                    size: 32.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            ReuseableText(
              title: "Login",
              style: TextStyle(
                color: Tcolor.Text,
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
                wordSpacing: 2.sp,
              ),
            ),
            SizedBox(height: 10.h),
            ReuseableText(
              title: "Let’s get you back right into your account.",
              style: TextStyle(
                color: Tcolor.TEXT_Label,
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 90.h),
            ReuseableText(
              title: "Phone number",
              style: TextStyle(
                color: Tcolor.TEXT_Body,
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 170.w,
                  height: 110.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: Tcolor.BACKGROUND_Regaular),
                    borderRadius: BorderRadius.circular(20.r),
                    color: Tcolor.BACKGROUND_Regaular,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "lib/images/flag-for-flag-nigeria-svgrepo-com.svg",
                          height: 40.h,
                          width: 40.w,
                        ),
                        SizedBox(width: 14.w),
                        Text(
                          "+234",
                          style: TextStyle(
                            color: Tcolor.TEXT_Label,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: _buildTextInput(
                    "81 343 XXXX",
                    phoneNumberController,
                    // onChanged: (value) => controller.validateForm(),
                  ),
                )
              ],
            ),
            Spacer(),
            CustomButton(
              title: "Login",
              showArrow: false,
              btnColor:
                  // controller.isFormFilled.value
                  // ?
                  Tcolor.Primary_New,
              // : Tcolor.PRIMARY_T4,
              btnHeight: 96.h,
              raduis: 50.r,
              btnWidth: double.infinity,
              textColor:
                  // controller.isFormFilled.value
                  // ?
                  Tcolor.Text,
              //
              //: Tcolor.Text_Secondary,
              fontSize: 32.sp,
              // onTap:
              // controller.isFormFilled.value? () {
              //   widget.next();
              // } : null,
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTextInput(String hintText, TextEditingController controller,
      {void Function(String)? onChanged}) {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        color: Tcolor.BACKGROUND_Regaular,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: 30.sp,
          color: Tcolor.TEXT_Body,
          fontWeight: FontWeight.w600,
        ),
        keyboardType: TextInputType.phone,
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: const Icon(Icons.phone),
          hintText: hintText,
          fillColor: Tcolor.BACKGROUND_Regaular,
          filled: true,
          hintStyle: TextStyle(color: Tcolor.TEXT_Placeholder, fontSize: 30.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 15.r,
          ),
        ),
      ),
    );
  }
}
