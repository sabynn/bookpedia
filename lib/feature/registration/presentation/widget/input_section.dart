part of '_widget.dart';

class InputSection extends StatefulWidget {
  const InputSection({Key? key}) : super(key: key);

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
  late final RegisterController controller;

  @override
  void initState() {
    controller = Get.find<RegisterController>();
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
            title: 'Name',
            hintText: 'Your full name',
            onTextChanged: (text) {
              controller.username.value = text;
            },
          ),
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
          BaseTextFormField(
            title: 'Password Confirmation',
            hintText: 'Repeat Your password',
            onTextChanged: (text) {
              controller.confirmPassword.value = text;
            },
            obscureText: true,
          ),
          Obx(
            () => BaseButton(
              isLoading: controller.registerLoading.value,
              text: 'Register',
              onPressed: () {
                controller.register();
              },
            ),
          )
        ],
      ),
    );
  }
}
