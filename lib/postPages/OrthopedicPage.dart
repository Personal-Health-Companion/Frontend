import 'package:capstonedesign_23_2/providers/Answer.dart';
import 'package:capstonedesign_23_2/providers/PostList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:capstonedesign_23_2/providers/Post.dart';
import '../providers/User.dart';

class OrthopedicPage extends StatefulWidget {
  const OrthopedicPage({Key? key}) : super(key: key);

  @override
  State<OrthopedicPage> createState() => _OrthopedicPageState();
}

class _OrthopedicPageState extends State<OrthopedicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          '                정형외과',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        ),
      ),
      body: OrthopedicPanel(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (context) => Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: savePost()
            ),
          );
        },
        backgroundColor: Color(0xFFa9d18e),
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OrthopedicPanel extends StatefulWidget {
  const OrthopedicPanel({Key? key}) : super(key: key);

  @override
  State<OrthopedicPanel> createState() => _OrthopedicPanelState();
}

class _OrthopedicPanelState extends State<OrthopedicPanel> {

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    context.read<PostList>().updateOrthopedicPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostList>(
      builder: (context, postList, child) {
        return ListView.builder(
          itemCount: postList.allOrthopedicList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(postList.allOrthopedicList[index].title, overflow: TextOverflow.ellipsis,),  // 게시물 제목
                subtitle: Text(postList.allOrthopedicList[index].question, overflow: TextOverflow.ellipsis,),  // 게시물 내용
                // 다른 필요한 정보들을 추가로 표시할 수 있습니다.
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: PostDetail(post: postList.allOrthopedicList[index]),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Text(
              '${post.title}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              width: 550,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                '${post.question}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 50),
            (post.docName == null && post.answer == null) ?
            Column(
              children: [
                Text(
                  "아직 답변이 없어요!",
                  style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          child: AnswerDoc(postId: post.Id!),)
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFa9d18e)),
                  ),
                  child: const Text('답변 하기',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ) :
            Column(
              children: [
                Text(
                  '${post.docName} 님의 답변',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '${post.answer}', // 답변 내용
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class savePost extends StatefulWidget {
  savePost({super.key});

  @override
  State<savePost> createState() => _savePostState();
}

class _savePostState extends State<savePost> {
  TextEditingController TitleController = TextEditingController();
  TextEditingController QuestionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("질문 작성하기", style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 30,
            ),
            Text("제목을 입력하세요", style: TextStyle(color: Colors.grey),),
            SizedBox(
              height: 3,
            ),
            TextField(
              controller: TitleController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF9F9FB),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: ""
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text("질문 내용을 입력하세요", style: TextStyle(color: Colors.grey),),
            SizedBox(
              height: 3,
            ),
            TextField(
              controller: QuestionController,
              textAlign: TextAlign.start,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF9F9FB),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: ""
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                if(TitleController.text != "" && QuestionController.text != "") {
                  Post savePost = Post(category: 'Orthopedic', title: TitleController.text, question: QuestionController.text, docName: null, answer: null);
                  var postList = Provider.of<PostList>(context, listen: false);
                  await postList.addPostList(user.Id!, savePost);

                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFa9d18e)),
              ),
              child: const Text('등록',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerDoc extends StatefulWidget {
  final int postId;
  const AnswerDoc({Key? key, required this.postId}) : super(key: key);

  @override
  State<AnswerDoc> createState() => _AnswerDocState();
}

class _AnswerDocState extends State<AnswerDoc> {
  TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50, 30, 50, 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text("  답변을 작성해주세요", style: TextStyle(color: Colors.grey),),
              ],
            ),
            SizedBox(height: 8,),
            TextField(
              controller: answerController,
              textAlign: TextAlign.start,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF9F9FB),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  labelText: ""
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () async {
                if(answerController.text != "") {
                  Answer saveAnswer = Answer(docName: user.userName, answer: answerController.text);
                  var postList = Provider.of<PostList>(context, listen: false);
                  bool response = await postList.answerPostList(user.Id!, widget.postId, saveAnswer);

                  if(response) {
                    Navigator.pop(context);
                  } else {
                    showModalBottomSheet<void>(context: context, builder: (context) => Error());
                  }

                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFa9d18e)),
              ),
              child: const Text('등록',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Error extends StatelessWidget {
  Error({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(100, 30, 100, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("답변 권한이 없습니다", style: TextStyle(color: Colors.red),),
          ],
        ),
      ),
    );
  }
}