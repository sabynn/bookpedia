part of '_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              'Join us and explore\nthe book world',
              style: BaseTextStyle.header3Semibold(color: BaseColor.primary),
            ),
          ),
          const InputSection(),
          GestureDetector(
            onTap: () {
              Get.toNamed(BaseRouter.login);
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 80,
              ),
              child: Text(
                'Have an account? Log In',
                style: BaseTextStyle.paragraph1Regular(
                  color: BaseColor.neutral700,
                ).copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
