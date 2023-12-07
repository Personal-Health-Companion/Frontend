import 'package:capstonedesign_23_2/providers/Answer.dart';
import 'package:capstonedesign_23_2/providers/PostList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:capstonedesign_23_2/providers/Post.dart';
import '../providers/User.dart';

class MyPostsPage extends StatefulWidget {
  const MyPostsPage({Key? key}) : super(key: key);

  @override
  State<MyPostsPage> createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          '${user.userName} 님의 게시물',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        ),
      ),
      body: MyPostsPanel(),
    );
  }
}

class MyPostsPanel extends StatefulWidget {
  const MyPostsPanel({Key? key}) : super(key: key);

  @override
  State<MyPostsPanel> createState() => _MyPostsPanelState();
}

class _MyPostsPanelState extends State<MyPostsPanel> {

  TextEditingController Search = TextEditingController();

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    int? userId = context.read<User>().Id;
    context.read<PostList>().updateUserPostList(userId!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Consumer<PostList>(
            builder: (context, postList, child) {
              return ListView.builder(
                itemCount: postList.allUserPostList.length,
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
                          title: Text(postList.allUserPostList[index].title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(postList.allUserPostList[index].question, style: TextStyle(fontSize: 18), maxLines: 2, overflow: TextOverflow.ellipsis,),
                              Row(
                                children: [
                                  Text(postList.allUserPostList[index].category, style: TextStyle(color: Colors.grey),),
                                  Text(" | "),
                                  Text(
                                    postList.allUserPostList[index].answer == null ? "답변 전" : "답변 완료",
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
                                child: PostDetail(post: postList.allUserPostList[index]),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${post.title}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 550,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFFF2F3F6),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
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
              ],
            ) :
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.local_hospital_outlined, color: Colors.red,),
                    SizedBox(width: 6),
                    Text(
                      '${post.docName} 님의 답변',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  width: 550,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFF2F3F6),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    '${post.answer}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}