part of '_widget.dart';

class ListBook extends StatefulWidget {
  const ListBook({Key? key}) : super(key: key);

  @override
  State<ListBook> createState() => _ListBookState();
}

class _ListBookState extends State<ListBook> {
  late final HomeController controller;

  @override
  void initState() {
    controller = Get.find<HomeController>();
    controller.getBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.getBookLoading.isTrue) {
          return const Padding(
            padding: EdgeInsets.only(top: 40),
            child: Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: BaseCircularLoading(),
              ),
            ),
          );
        }

        final listBooks = controller.listBooks.value;
        if (listBooks.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.illustration1,
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 12),
                Text(
                  'Book is Empty.\n Start Add Your Books',
                  style: BaseTextStyle.paragraph1Regular(
                    color: BaseColor.primary,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                'Enjoy the reads!',
                style: BaseTextStyle.paragraph1Semibold(
                  color: BaseColor.darkPrimary,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: CarouselSlider(
                items: List.generate(listBooks.length, (index) {
                  final book = listBooks[index];
                  return BookCard(
                    book: book,
                    onDeletePressed: controller.deleteBook,
                  );
                }),
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  height: min(ScreenSize.height(context),
                          ScreenSize.width(context)) -
                      100,
                  viewportFraction:
                      ScreenSize.height(context) >= ScreenSize.width(context)
                          ? 0.8
                          : 0.5,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {},
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
