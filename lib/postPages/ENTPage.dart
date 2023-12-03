import 'package:capstonedesign_23_2/providers/Answer.dart';
import 'package:capstonedesign_23_2/providers/PostList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:capstonedesign_23_2/providers/Post.dart';
import '../providers/User.dart';

class ENTPage extends StatefulWidget {
  const ENTPage({Key? key}) : super(key: key);

  @override
  State<ENTPage> createState() => _ENTPageState();
}

class _ENTPageState extends State<ENTPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          '               이비인후과',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        ),
      ),
      body: ENTPanel(),
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

class ENTPanel extends StatefulWidget {
  const ENTPanel({Key? key}) : super(key: key);

  @override
  State<ENTPanel> createState() => _ENTPanelState();
}

class _ENTPanelState extends State<ENTPanel> {

  TextEditingController Search = TextEditingController();

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    context.read<PostList>().updateENTPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: Search,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF9F9FB),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      labelText: "검색할 내용을 입력하세요."
                  ),
                ),
                flex: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                  width: 80,
                  height: 47,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<PostList>().searchENTPostList(Search.text);
                    },
                    child: Text("검색"),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Consumer<PostList>(
            builder: (context, postList, child) {
              return ListView.builder(
                itemCount: postList.allENTList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text(postList.allENTList[index].title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(postList.allENTList[index].question, style: TextStyle(fontSize: 18), maxLines: 2, overflow: TextOverflow.ellipsis,),
                              Row(
                                children: [
                                  Text(postList.allENTList[index].category, style: TextStyle(color: Colors.grey),),
                                  Text(" | "),
                                  Text(
                                    postList.allENTList[index].answer == null ? "답변 전" : "답변 완료",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => Container(
                                height: MediaQuery.of(context).size.height * 0.9,
                                child: PostDetail(post: postList.allENTList[index]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
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
                color: Color(0xFFF2F3F6),
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
                  Post savePost = Post(category: 'ENT', title: TitleController.text, question: QuestionController.text, docName: null, answer: null);
                  var postList = Provider.of<PostList>(context, listen: false);
                  await postList.addPostList(user.Id!, savePost);

                  context.read<PostList>().updatePostList();
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

                  context.read<PostList>().updatePostList();
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