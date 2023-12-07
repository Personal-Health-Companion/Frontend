import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:capstonedesign_23_2/providers/ChatsList.dart';

class MyChatPage extends StatefulWidget {
  final int userId;

  MyChatPage({required this.userId});

  @override
  _MyChatPageState createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ChatsList>(context, listen: false)
        .updateUserChatList(widget.userId);
  }

  void _showDetails(BuildContext context, String requestText, String responseText) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '질문',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 4),
                Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F3F6),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: Text(requestText, style: TextStyle(fontSize: 18),)
                ),
                SizedBox(height: 30),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '답변 ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(height: 4),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F3F6),
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Text(responseText, style: TextStyle(fontSize: 18),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: Consumer<ChatsList>(
        builder: (ctx, chatData, _) => ListView.builder(
          itemCount: chatData.allChatList.length,
          itemBuilder: (ctx, i) => Card(
            child: ListTile(
              title: Text(
                chatData.allChatList[i].requestText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                chatData.allChatList[i].responseText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => _showDetails(context, chatData.allChatList[i].requestText, chatData.allChatList[i].responseText),
            ),
          ),
        ),
      ),
    );
  }
}
