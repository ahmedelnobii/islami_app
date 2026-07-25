import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/app_images.dart';
import 'package:islami_app/core/theme/App_Colors.dart';
import 'package:islami_app/screens/hadeth_screen.dart';
import 'package:islami_app/widgets/indecator_.dart';

class HadethItemBuilder extends StatefulWidget {
  int index;
  HadethItemBuilder({required this.index});

  @override
  State<HadethItemBuilder> createState() => _HadethItemBuilderState();
}

class _HadethItemBuilderState extends State<HadethItemBuilder> {
  String? title;
  bool isHadithReady = false;
  List<String>? content;

  @override
  Widget build(BuildContext context) {
    double screenHieght = MediaQuery.sizeOf(context).height;
    if (title == null || content == null) getHadeth();
    return GestureDetector(
      onTap: () {
        if (isHadithReady) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => HadethScreen(title: title!, content: content!),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: isHadithReady
              ? Column(
                  children: [
                    SizedBox(
                      height: screenHieght * .09,
                      child: Row(
                        mainAxisAlignment: .spaceBetween,
                        children: [
                          Image.asset(
                            AppImages.leftCornerImage,
                            color: AppColors.blackColor,
                            fit: .contain,
                          ),
                          Expanded(
                            child: Text(
                              title!,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: AppColors.blackColor,
                                    fontSize: 22,
                                  ),
                              textAlign: .center,
                            ),
                          ),
                          Image.asset(
                            AppImages.rightCornerImage,
                            color: AppColors.blackColor,
                            fit: .scaleDown,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.hadethBackGround),
                            fit: .contain,
                          ),
                        ),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: content?.length,
                          itemBuilder: ((context, index) => Text(
                            content![index],
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: AppColors.blackColor),
                            textAlign: .center,
                          )),
                        ),
                      ),
                    ),
                    Image.asset(
                      AppImages.bottomDecorationImage,
                      color: AppColors.blackColor,
                      fit: .fill,
                    ),
                  ],
                )
              : LoadingIndicator(),
        ),
      ),
    );
  }

  void getHadeth() async {
    String hadithFile = await rootBundle.loadString(
      'assets/text/hadeth_content/h${widget.index + 1}.txt',
    );
    List<String> hadithContentList = hadithFile.split('\r\n');
    title = hadithContentList[0];
    hadithContentList.removeAt(0);
    content = hadithContentList;
    isHadithReady = true;
    setState(() {});
  }
}
