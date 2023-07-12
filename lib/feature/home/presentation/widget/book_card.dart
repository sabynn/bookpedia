part of '_widget.dart';

class BookCard extends StatelessWidget {
  final Function onDeletePressed;
  final Book book;

  const BookCard({
    Key? key,
    required this.onDeletePressed,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: min(
                  ScreenSize.height(context),
                  ScreenSize.width(context),
                ) -
                100,
            child: InkWell(
              onTap: () {
                Get.toNamed(BaseRouter.detailBook,
                    arguments: {'book': book.toJson()});
              },
              child: Hero(
                tag: '${book.id}',
                child: Card(
                  color: BaseColor.info100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  onDeletePressed(book);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: BaseColor.danger700,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(BaseRouter.updateBook,
                                      arguments: {'book': book.toJson()});
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: BaseColor.success700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                book.title ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: BaseTextStyle.header3Semibold(
                                    color: BaseColor.primary),
                              ),
                              Text(
                                book.subtitle ?? '',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: BaseTextStyle.paragraph1Semibold(
                                    color: BaseColor.primary),
                              ),
                              Text(
                                'Created by ${book.author ?? ''}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: BaseTextStyle.paragraph2Regular(
                                    color: BaseColor.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
