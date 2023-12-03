import 'package:capstonedesign_23_2/providers/Hospital.dart';
import 'package:capstonedesign_23_2/providers/UserDetail.dart';
import 'package:flutter/material.dart';
import 'Hospitals.dart';
import 'providers/User.dart';
import 'package:provider/provider.dart';
import 'providers/Chat.dart';
import 'detailPages/AgeGenderJob.dart';
import 'apis/chatAPI.dart';

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

class _ChatPanelState extends State<ChatPanel> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  bool isLoading = false;

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _handleSubmitted(String text, String role) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      role: role,
    );
    setState(() {
      _messages.add(message);
    });
    _scrollToBottom();
  }

  void _scrollToBottom() { // Add this
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  Widget _buildTextComposer() {
    var user = Provider.of<User>(context);
    var detail = Provider.of<Details>(context);
    bool detailsIsNull = detail.age == '';

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
                onSubmitted: (String text) {
                  _handleSubmitted(text, user.userName);
                },
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
              onPressed: () async {
                if (!detailsIsNull) {
                  String text = _textController.text;
                  _handleSubmitted(text, user.userName);

                  setState(() {
                    isLoading = true;
                  });

                  String ans = await ChatAPI.saveChat(user, text); // API 통신
                  print(ans);

                  setState(() {
                    isLoading = false; // Clear loading state
                  });

                  _handleSubmitted(ans, "챗봇");
                }
              },
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
              reverse: false,
              itemBuilder: (_, int index) {
                if (index < _messages.length) {
                  return _messages[index];
                } else if (isLoading) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("답변을 생성 중입니다 "),
                      Center(child: Image.asset("assets/images/loading.gif")),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
              itemCount: _messages.length + 1,
              controller: _scrollController,
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
  ChatMessage({required this.text, required this.role});

  final String text;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(role, style: Theme.of(context).textTheme.subtitle1),

                  Container(
                    width: 600,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F3F6),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(text, softWrap: true, overflow: TextOverflow.visible, style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(height: 7,),
                  // Add this
                  if (role == "챗봇") ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Wrap(
                          spacing: 20.0, // gap between chips
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Hospitals()));
                              },
                              child: Chip(
                                label: Text('병원 추천 바로가기'),
                                backgroundColor: Color(0xffe4f5d9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        )
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
