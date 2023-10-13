import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/app/home/models/design_components.dart';
import 'package:flutter_components/main.dart';

class PopularComponentListView extends StatefulWidget {
  const PopularComponentListView({Key? key, this.callBack}) : super(key: key);

  final Function()? callBack;
  @override
  _PopularComponentListViewState createState() =>
      _PopularComponentListViewState();
}

class _PopularComponentListViewState extends State<PopularComponentListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return GridView(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List<Widget>.generate(
                Category.popularComponentList.length,
                (int index) {
                  final int count = Category.popularComponentList.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: animationController!,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  animationController?.forward();
                  return CategoryView(
                    callback: widget.callBack,
                    category: Category.popularComponentList[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 32.0,
                crossAxisSpacing: 32.0,
                childAspectRatio: 0.8,
              ),
            );
          }
        },
      ),
    );
  }
}

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key,
      this.category,
      this.animationController,
      this.animation,
      this.callback})
      : super(key: key);

  final VoidCallback? callback;
  final Category? category;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: callback,
              child: SizedBox(
                height: 280,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16.0)),
                                // border: new Border.all(
                                //     color: DesignComponentAppTheme.notWhite),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 16, left: 16, right: 16),
                                            child: Text(
                                              'title',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                letterSpacing: 0.27,
                                                color: DesignComponentAppTheme
                                                    .darkerText,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 16,
                                                right: 16,
                                                bottom: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                const Text(
                                                  ' lesson',
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 12,
                                                    letterSpacing: 0.27,
                                                    color:
                                                        DesignComponentAppTheme
                                                            .grey,
                                                  ),
                                                ),
                                                Container(
                                                  child: const Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            DesignComponentAppTheme
                                                                .nearlyBlue,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 48,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 48,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 24, right: 16, left: 16),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: DesignComponentAppTheme.grey
                                      .withOpacity(0.2),
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: const ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                            child: AspectRatio(
                              aspectRatio: 1.28,
                              child: Icon(
                                Icons.play_circle_outline,
                                color: DesignComponentAppTheme.nearlyBlue,
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Category {
  Category({
    this.title = '',
    this.icon,
    this.lessonCount = 0,
    this.rating = 0.0,
  });

  String title;
  int lessonCount;

  double rating;
  IconData? icon;

  static List<Category> categoryList = <Category>[
    Category(
      icon: Icons.list,
      title: 'User interface Design',
      lessonCount: 24,
      rating: 4.3,
    ),
    Category(
      icon: Icons.smart_button,
      title: 'User interface Design',
      lessonCount: 22,
      rating: 4.6,
    ),
    Category(
      icon: Icons.input,
      title: 'User interface Design',
      lessonCount: 24,
      rating: 4.3,
    ),
    Category(
      icon: Icons.navigation,
      title: 'User interface Design',
      lessonCount: 22,
      rating: 4.6,
    ),
  ];

  static List<Category> popularComponentList = <Category>[
    Category(
      icon: Icons.navigation,
      title: 'App Design Component',
      lessonCount: 12,
      rating: 4.8,
    ),
    Category(
      icon: Icons.input,
      title: 'Web Design Component',
      lessonCount: 28,
      rating: 4.9,
    ),
    Category(
      icon: Icons.dashboard_customize,
      title: 'App Design Component',
      lessonCount: 12,
      rating: 4.8,
    ),
    Category(
      icon: Icons.data_array,
      title: 'Web Design Component',
      lessonCount: 28,
      rating: 4.9,
    ),
  ];
}
