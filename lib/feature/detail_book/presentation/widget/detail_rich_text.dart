part of '_widget.dart';

class DetailRichText extends StatelessWidget {
  final String field;
  final String value;

  const DetailRichText({Key? key, this.field = '', this.value = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: field,
          style: BaseTextStyle.paragraph1Semibold(
            color: BaseColor.primary,
          ),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: BaseTextStyle.paragraph1Regular(
                color: BaseColor.primary,
              ),
            ),
          ]),
    );
  }
}
