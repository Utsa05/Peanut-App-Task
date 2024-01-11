import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peanut_app_task/app/constatns/app_size.dart';
import 'package:peanut_app_task/app/theme.dart';
import 'package:peanut_app_task/app/utils.dart';
import 'package:peanut_app_task/controllers/initial-controller.dart';
import 'package:peanut_app_task/controllers/login-controller.dart';
import 'package:peanut_app_task/views/widgets/button.dart';
import 'package:peanut_app_task/views/widgets/text.dart';
import 'package:get/get.dart';
import '../../widgets/text-field.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: size().height,
        width: size().width,
        child: Stack(
          children: [
            Container(
              height: size().height / 2.2,
              decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSize.s30),
                      bottomRight: Radius.circular(AppSize.s30))),
            ),
            //input taken : loign and password
            const InfoArea()
          ],
        ),
      ),
    );
  }
}

class InfoArea extends StatelessWidget {
  const InfoArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: AppSize.s20, right: AppSize.s20, top: size().height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PText(
            text: "Sign In",
            fontSize: AppSize.s24,
            color: AppTheme.whiteColor,
          ),
          box(AppSize.s10),
          PText(
            text: "Sign in to discover amazing things",
            fontSize: AppSize.s12,
            color: AppTheme.whiteColor,
          ),
          box(AppSize.s70),

          //textfield
          const TextFieldArea(),

          box(AppSize.s40),
          Align(
              alignment: Alignment.center,
              child: PText(text: "Not Have an Account Yet? Click"))
        ],
      ),
    );
  }
}

class TextFieldArea extends GetView<LoginController> {
  const TextFieldArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.s20),
      decoration: BoxDecoration(
          color: AppTheme.whiteColor,
          borderRadius: BorderRadius.circular(AppSize.s20)),
      child: Column(
        children: [
          CustomTextField(
            controller: controller.loginEditingController,
            hint: "Login",
            icon: Icons.format_list_numbered,
            keyboarType: TextInputType.number,
          ),
          box(AppSize.s20),
          CustomTextField(
            controller: controller.passwordEditingController,
            hint: "Password",
            icon: Icons.password,
            keyboarType: TextInputType.number,
          ),
          box(AppSize.s30),
          Obx(() {
            return controller.loging.isFalse
                ? ButtonLTD(
                    width: size().width,
                    height: AppSize.s40,
                    onTap: () {
                      Get.find<LoginController>().loginUser();
                    },
                    widget: PText(
                      text: "Sign In",
                      color: AppTheme.whiteColor,
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: themdata().primaryColor,
                    ),
                  );
          })
        ],
      ),
    );
  }
}
