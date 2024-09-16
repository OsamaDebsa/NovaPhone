import 'package:flutter/material.dart';
import 'package:nova_phone/features/home/presentation/view/widgets/page_indator.dart';

class PageIndicatorListView extends StatelessWidget {
  final int totalPage;
  final int clickedIndex;
  final Function(int) onPageTap;

  const PageIndicatorListView({
    super.key,
    required this.totalPage,
    required this.clickedIndex,
    required this.onPageTap,
  });

  @override
  Widget build(BuildContext context) {
    List<int> createPageList(int num) {
      return List<int>.generate(num, (index) => index + 1);
    }

    final List<int> pageList = createPageList(totalPage);

    return SizedBox(
      height: 60,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: totalPage,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onPageTap(pageList[index]),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: PageIndicator(
                  isSelected: clickedIndex == pageList[index],
                  page: pageList[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
