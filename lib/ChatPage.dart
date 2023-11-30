import 'package:capstonedesign_23_2/providers/Hospital.dart';
import 'package:flutter/material.dart';
import 'providers/User.dart';
import 'package:provider/provider.dart';
import 'providers/Chat.dart';
import 'detailPages/AgeGender.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatPanel(),
    );
  }
}

class ChatPanel extends StatefulWidget {
  @override
  _ChatPanelState createState() => _ChatPanelState();
}

class _ChatPanelState extends State<ChatPanel> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    var user = Provider.of<User>(context);
    bool detailsIsNull = user.details == null;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              height: 40,
              child: TextField(
                focusNode: detailsIsNull ? AlwaysDisabledFocusNode() : null,
                controller: _textController,
                onSubmitted: _handleSubmitted,
                onTap: () {
                  if (detailsIsNull) {
                    showModalBottomSheet<void>(context: context, builder: (context) => Error());
                  }
                },
                readOnly: detailsIsNull,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF9F9FB),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: "질문하실 내용을 입력해주세요",
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: Icon(Icons.send),
              onPressed: detailsIsNull ? null : () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )),
        Divider(height: 1.0),
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
      ]),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 16.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(user.userName, style: Theme.of(context).textTheme.subtitle1),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(70, 30, 70, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.userName + "님의 정보가 없어요.", style: TextStyle(color: Colors.red),),
            SizedBox(
              height: 10,
            ),
            Text("세부 정보를 입력하시면 증상에 대한 자세한 조언을 드릴 수 있어요."),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgeGender()));
              },
              child: Text('[ 세부 정보 입력 하러 가기 ]',
                style: TextStyle(
                  color: Color(0xFF199A8E),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
