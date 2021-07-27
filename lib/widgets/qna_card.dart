import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:parenteach/controllers/qna_controller.dart';
import 'package:parenteach/routes/route_name.dart';

import '../utils/theme.dart';

class QnaCard extends StatelessWidget {
  final QnaController _qnaController = Get.find();
  final String titleCard;
  final String? answer;
  final String idQna;

  QnaCard({
    Key? key,
    required this.titleCard,
    required this.idQna,
    this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: false,
                  hasIcon: true,
                  expandIcon: LineIcons.chevronCircleDown,
                  collapseIcon: LineIcons.chevronCircleUp,
                  iconColor: pinkColor,
                ),
                header: Text(
                  titleCard,
                  style: blackTextBold.copyWith(
                    fontSize: 14,
                  ),
                ),
                collapsed: Container(),
                expanded: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          answer == null ? "" : answer!,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            right: 8,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _qnaController.loadText(titleCard, answer!);
                              Get.toNamed(
                                routeName.reverse[RouteName.ADMINADDQNAPAGE]!,
                                arguments: idQna,
                              );
                            },
                            child: Text(
                              "Edit",
                              style: pinkText,
                            ),
                          ),
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
    );
  }
}
