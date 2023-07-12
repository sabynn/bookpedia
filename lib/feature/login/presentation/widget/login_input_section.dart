part of '_widget.dart';

class LoginInputSection extends StatefulWidget {
  const LoginInputSection({Key? key}) : super(key: key);

  @override
  State<LoginInputSection> createState() => _LoginInputSectionState();
}

class _LoginInputSectionState extends State<LoginInputSection> {
  late final LoginController controller;

  @override
  void initState() {
    controller = Get.find<LoginController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: BaseColor.neutral100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          BaseTextFormField(
            title: 'Email',
            hintText: 'Your email',
            onTextChanged: (text) {
              controller.email.value = text;
            },
          ),
          BaseTextFormField(
            title: 'Password',
            hintText: 'Your password',
            onTextChanged: (text) {
              controller.password.value = text;
            },
            obscureText: true,
          ),
          Obx(
            () => BaseButton(
              isLoading: controller.loginLoading.value,
              text: 'Login',
              onPressed: () {
                controller.login();
              },
            ),
          )
        ],
      ),
    );
  }
}
