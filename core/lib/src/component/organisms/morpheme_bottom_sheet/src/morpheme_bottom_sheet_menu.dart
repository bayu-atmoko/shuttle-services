import 'package:core/core.dart';
import 'package:core/src/component/organisms/morpheme_bottom_sheet/src/morpheme_menu_icon_item.dart';
import 'package:flutter/material.dart';

class MorphemeBottomSheetMenu extends StatelessWidget {
  final String tittle;
  final bool? isLineTopVisible;
  final IconPosition? closePosition;
  final List<BottomSheetMenuModel> menuList;

  const MorphemeBottomSheetMenu({
    super.key,
    required this.tittle,
    this.isLineTopVisible,
    this.closePosition,
    required this.menuList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MorphemeHeaderBottomSheet(
            title: tittle,
            iconPosition: IconPosition.start,
          ),
          Column(
            children: _menuList(context),
          ),
        ],
      ),
    );
  }

  /// menu list
  List<Widget> _menuList(BuildContext context) {
    List<Widget> list = <Widget>[];
    menuList.asMap().forEach((i, element) {
      list.add(
        MorphemeMenuIconItem(
          tittle: element.name,
          colorText: element.colorText ?? context.color.grey,
          imageAssets: element.imageAssets,
          onTap: () {
            element.onTap();
          },
        ),
      );
    });

    return list;
  }
}

class BottomSheetMenuModel {
  BottomSheetMenuModel({
    required this.name,
    this.colorImage,
    this.colorText,
    required this.imageAssets,
    required this.onTap,
  });

  String name;
  Color? colorImage;
  Color? colorText;
  IconData imageAssets;
  Function onTap;
}
