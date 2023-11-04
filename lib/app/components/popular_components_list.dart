import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/app/home/models/design_components.dart';
import 'package:flutter_components/main.dart';

class PopularComponentListView extends StatefulWidget {
  const PopularComponentListView({super.key});


  
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
      padding: const EdgeInsets.only(top: 15),
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 0.8,
              ),
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
                    callback: (){
                      if (index == 0) {
                           Navigator.pushNamed(context, '/listScreen');
                            } else if(index ==1) {
                           Navigator.pushNamed(context, '/lardScreen');
                          }

    },
                    category: Category.popularComponentList[index],
                    animation: animation,
                    animationController: animationController,
  
                  );
                },
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
                height: 380,
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
                                      child:  Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, left: 16, right: 16),
                                            child: Text(
                                              category!.title,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20,
                                                letterSpacing: 0.27,
                                                color: DesignComponentAppTheme
                                                    .darkerText,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 28,
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
                                                Text(
                                                  category!.lessonCount.toString(),
                                                  textAlign: TextAlign.left,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 18,
                                                    letterSpacing: 0.27,
                                                    color:
                                                        DesignComponentAppTheme
                                                            .grey,
                                                  ),
                                                ),
                                                Icon(category!.icon,color: 
                                                            DesignComponentAppTheme.nearlyBlue)
                                                // Container(
                                                //   child: const Row(
                                                //     children: <Widget>[
                                                //       Icon(
                                                //         Icons.star,
                                                //         color:
                                                //             DesignComponentAppTheme
                                                //                 .nearlyBlue,
                                                //         size: 20,
                                                //       ),
                                                //     ],
                                                //   ),
                                                // )
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
                    // Container(
                    //   child: Padding(
                    //     padding:
                    //         const EdgeInsets.only(top: 24, right: 16, left: 16),
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //         borderRadius:
                    //             const BorderRadius.all(Radius.circular(16.0)),
                    //         boxShadow: <BoxShadow>[
                    //           BoxShadow(
                    //               color: DesignComponentAppTheme.grey
                    //                   .withOpacity(0.1),
                    //               offset: const Offset(0.0, 0.0),
                    //               blurRadius: 6.0),
                    //         ],
                    //       ),
                    //       child: const ClipRRect(
                    //         borderRadius:
                    //             BorderRadius.all(Radius.circular(16.0)),
                    //         child: AspectRatio(
                    //           aspectRatio: 1.28,
                    //           child: Icon(
                    //             Icons.play_circle_outline,
                    //             color: DesignComponentAppTheme.nearlyBlue,
                    //             size: 50,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                 
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

enum CategoryType {
  lists ,
  buttons,
  cards
}

class Category {
  Category({
    this.title = '',
    this.icon,
    this.lessonCount = 0,
    this.rating = 0.0,
    this.categoryType
  });

   String title;
  int lessonCount;
 CategoryType? categoryType;

  double rating;
  IconData? icon;

  static List<Category> categoryList = <Category>[
    Category(
      icon: Icons.list,
      title: 'LISTS',
      lessonCount: 24,
      rating: 4.3,
      categoryType: CategoryType.lists
    ),
    Category(
      icon: Icons.smart_button,
      title: 'User interface Design',
      lessonCount: 22,
      rating: 4.6,
      categoryType: CategoryType.buttons
    ),
    Category(
      icon: Icons.input,
      title: 'User interface Design',
      lessonCount: 24,
      rating: 4.3,
      categoryType: CategoryType.cards
    ),
    Category(
      icon: Icons.navigation,
      title: 'User interface Design',
      lessonCount: 22,
      rating: 4.6,
      categoryType: CategoryType.lists
    ),
  ];

  static List<Category> popularComponentList = <Category>[
    Category(
      icon: Icons.list,
      title: 'lists',
      lessonCount: 12,
      rating: 4.8,
      categoryType: CategoryType.lists
    ),
    Category(
      icon: Icons.radio_button_checked,
      title: 'buttons',
      lessonCount: 28,
      rating: 4.9,
      categoryType: CategoryType.buttons
    ),
    Category(
      icon: Icons.grid_4x4,
      title: 'Grid view',
      lessonCount: 12,
      rating: 4.8,
      categoryType: CategoryType.cards
    ),
    Category(
      icon: Icons.card_membership,
      title: 'cards',
      lessonCount: 28,
      rating: 4.9,
      categoryType: CategoryType.lists
    ),
  ];
}
