import 'package:flatform/widgets/platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformAlert extends PlatformWidgets {

  final String header;
  final List content;
  final String button;

  PlatformAlert(@required this.header,@required this.content,@required  this.button);

  @override
  Widget buildAndroidWidget(BuildContext context) {
      return AlertDialog(
        title: Text(header),
        content: _contentCreator(),
                actions: [],
              );
            }
          
            @override
            Widget buildIOSWidget(BuildContext context) {
            return CupertinoAlertDialog(
                title: Text(header),
                content: _contentCreator(),
                actions: [],
              );
          }
        
          _contentCreator<Widget>() {

          }
}
