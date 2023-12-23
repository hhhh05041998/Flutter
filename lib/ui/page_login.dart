import 'package:connection/providers/loginViewModel.dart';
import 'package:connection/ui/AppConstant.dart';
import 'package:connection/ui/custom_control.dart';
import 'package:connection/ui/page_forgot_pass.dart';
import 'package:connection/ui/page_main.dart';
import 'package:connection/ui/page_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageLogin extends StatelessWidget {
  PageLogin({super.key});
  static String routeName = '/login';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<LoginViewModel>(context);
    final size = MediaQuery.of(context).size;
    if (viewmodel.status == 3) {
      Future.delayed(
        Duration.zero,
        () {
          Navigator.popAndPushNamed(context, PageMain.routeName);
        },
      );
    }

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(235, 246, 246, 243),
                Color.fromARGB(255, 213, 185, 63)
              ],
              stops: [0.25, 0.75],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppLogo(),
                            const SizedBox(
                              height: 20,
                            ),
                            // ignore: avoid_unnecessary_containers
                            Text(
                              "Mừng Quay Lại",
                              style: AppConstant.textFancyheader,
                            ),
                            Text(
                              "Tôi Rất Nhớ Bạn!",
                              style: AppConstant.textFancyheader,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomTextField(
                              hintText: "Username",
                              textController: _emailController,
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              textController: _passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .popAndPushNamed(
                                          PageForgotPass.routeName),
                                  child: Text(
                                    "Quên mật khẩu?",
                                    style: AppConstant.textLink,
                                  ),
                                ),
                              ],
                            ),
                            viewmodel.status == 2
                                ? Text(
                                    viewmodel.errorMessage,
                                    style: const TextStyle(color: Colors.red),
                                  )
                                : const Text(""),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                String username = _emailController.text.trim();
                                String password =
                                    _passwordController.text.trim();
                                viewmodel.login(username, password);
                              },
                              child: const CustomButton(
                                textButton: "Đăng nhập",
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Chưa có tài khoản? ",
                                    style: AppConstant.textLink),
                                GestureDetector(
                                  onTap: () => Navigator.popAndPushNamed(
                                      context, PageRegister.routeName),
                                  child: Text("Đăng ký",
                                      style: AppConstant.textLink),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      viewmodel.status == 1
                          ? CustomSpinner(size: size)
                          : Container()
                    ],
                  ),
                ),
              ),
            )));
  }
}
