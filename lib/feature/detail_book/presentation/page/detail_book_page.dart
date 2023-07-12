part of '_page.dart';

class DetailBookPage extends StatefulWidget {
  const DetailBookPage({Key? key}) : super(key: key);

  @override
  State<DetailBookPage> createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  @override
  Widget build(BuildContext context) {
    final Book book = Book.fromJson(Get.arguments['book']);

    Future<void> launchWebsiteUrl() async {
      final Uri url = Uri.parse(book.website ?? '');
      if (!await launchUrl(url)) {
        BaseToast.show(
          text: 'Could not launch $url',
          style: BaseToastStyle.SUCCESS,
        );
        throw Exception('Could not launch $url');
      }
    }

    return BaseScaffold(
      backgroundColor: BaseColor.info100,
      withAppBar: true,
      appBarTitle: 'Book Detail',
      withBackAppBar: true,
      body: Hero(
        tag: '${book.id}',
        child: Center(
          child: ListView(
            children: [
              Text(
                '${book.title}',
                style:
                    BaseTextStyle.paragraph1Semibold(color: BaseColor.primary),
                textAlign: TextAlign.center,
              ),
              Text(
                '${book.subtitle}',
                style: BaseTextStyle.paragraph1Semibold(
                  color: BaseColor.primary.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                Assets.illustration2,
                height: 200,
                width: 200,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailRichText(
                        field: 'Author : ',
                        value: '${book.author}',
                      ),
                      DetailRichText(
                        field: 'ISBN : ',
                        value: '${book.isbn}',
                      ),
                      DetailRichText(
                        field: 'Published Date : ',
                        value: DateFormat('y/MM/dd').format(
                          DateTime.parse(
                            book.published ?? '',
                          ),
                        ),
                      ),
                      DetailRichText(
                        field: 'Pages : ',
                        value: '${book.pages}',
                      ),
                      DetailRichText(
                        field: 'Description : ',
                        value: '${book.description}',
                      ),
                      DetailRichText(
                        field: 'Website : ',
                        value: '${book.website}',
                      ),
                    ],
                  ),
                ),
              ),
              BaseButton(
                text: 'Go to website',
                onPressed: launchWebsiteUrl,
              )
            ],
          ),
        ),
      ),
    );
  }
}
