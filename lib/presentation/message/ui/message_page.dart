import 'package:e_services/core/config/service_app_color.dart';
import 'package:e_services/core/config/service_screen.dart';
import 'package:e_services/core/static/svg_path.dart';
import 'package:e_services/presentation/message/model/message_user_list_model.dart';
import 'package:flutter/material.dart';

class MassagePage extends StatelessWidget {
  const MassagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ServiceAppColor.scaffoldBgCOlor,
      appBar: AppBar(
        backgroundColor: ServiceAppColor.scaffoldBgCOlor,
        centerTitle: true,
        title: const Text('Messages'),
      ),
      body: Column(
        children: [
          const Divider(
            endIndent: 20,
            indent: 20,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _messageList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  title: Text(
                    _messageList[index].name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: sixteenPx,
                      color: ServiceAppColor.textColor,
                    ),
                  ),
                  subtitle: Text(
                    _messageList[index].message,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: twelvePx,
                      color: ServiceAppColor.hintTextColor,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: twentyFourPx,
                    backgroundImage: AssetImage(_messageList[index].avatarUrl),
                  ),
                  trailing: Text(
                    _messageList[index].time,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: twelvePx,
                      color: ServiceAppColor.hintTextColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

List<MessageUserListModel> _messageList = [
  MessageUserListModel(
    name: 'Jane Cooper',
    message: 'Ok Thanks',
    time: '9:00',
    avatarUrl: SvgPath.img2,
  ),
  MessageUserListModel(
    name: 'Jane Cooper',
    message: 'Ok Thanks',
    time: 'Tuesday',
    avatarUrl: SvgPath.img2,
  ),
  MessageUserListModel(
    name: 'Jane Cooper',
    message: 'Ok Thanks',
    time: 'Tuesday',
    avatarUrl: SvgPath.img2,
  ),
  MessageUserListModel(
    name: 'Jane Cooper',
    message: 'Ok Thanks',
    time: 'Tuesday',
    avatarUrl: SvgPath.img2,
  ),
  MessageUserListModel(
    name: 'Jane Cooper',
    message: 'Ok Thanks',
    time: 'Tuesday',
    avatarUrl: SvgPath.img2,
  ),
  MessageUserListModel(
    name: 'Jane Cooper',
    message: 'Ok Thanks',
    time: 'Tuesday',
    avatarUrl: SvgPath.img2,
  ),
];
