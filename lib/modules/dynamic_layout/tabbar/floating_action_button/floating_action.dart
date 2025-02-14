import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/icons/icon_picker.dart' deferred as defer_icon;
import 'package:inspireui/inspireui.dart' show DeferredWidget;

import '../../config/app_config.dart';
import '../../config/tab_bar_config.dart';
import '../../config/tab_bar_floating_config.dart';
import '../../config/tab_bar_indicator_config.dart';
import '../mixins/floating_shape.dart';
import '../tabbar_icon.dart';

class IconFloatingAction extends StatelessWidget with TabbarFloatingShape {
  final TabBarFloatingConfig config;
  final Function? onTap;
  final TabBarMenuConfig item;
  final int totalCart;
  const IconFloatingAction({
    super.key,
    required this.onTap,
    required this.item,
    required this.config,
    required this.totalCart,
  });

  @override
  Widget build(BuildContext context) {
    Widget icon = Builder(
      builder: (context) {
        var iconColor = Colors.white;
        final iconSize = config.sizeIcon;
        var isImage = item.icon.contains('/');

        return isImage
            ? FluxImage(
                imageUrl: item.icon,
                color: item.showOriginalColor ? null : iconColor,
                width: iconSize ?? 24,
              )
            : DeferredWidget(
                defer_icon.loadLibrary,
                () => Icon(
                  defer_icon.iconPicker(
                    item.icon,
                    item.fontFamily,
                  ),
                  color: iconColor,
                  size: iconSize ?? 22,
                ),
              );
      },
    );

    if (item.layout == 'cart') {
      icon = IconCart(
        icon: icon,
        totalCart: totalCart,
        config: TabBarConfig(
          tabBarFloating: config,
          tabBarIndicator: TabBarIndicatorConfig(),
        ),
      );
    }

    return Padding(
      padding: config.margin ?? EdgeInsets.zero,
      child: RawMaterialButton(
        elevation: config.elevation ?? 4.0,
        shape: getShapeBorder(config),
        fillColor: config.color ?? Theme.of(context).primaryColor,
        onPressed: () => onTap!(),
        constraints: BoxConstraints.tightFor(
          width: config.width ?? 50.0,
          height: config.height ?? 50.0,
        ),
        child: icon,
      ),
    );
  }
}
