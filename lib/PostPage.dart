import 'package:capstonedesign_23_2/providers/PostList.dart';
import 'package:flutter/material.dart';
import 'package:capstonedesign_23_2/apis/postAPI.dart';
import 'package:capstonedesign_23_2/providers/Post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          '                  전체 게시물',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 1.5,
          ),
        ),
      ),
      body: PostPanel(),
    );
  }
}

class PostPanel extends StatefulWidget {
  const PostPanel({Key? key}) : super(key: key);

  @override
  State<PostPanel> createState() => _PostPanelState();
}

class _PostPanelState extends State<PostPanel> {

  @override
  void initState() {
    super.initState();
    update();
  }

  void update() {
    context.read<PostList>().updatePostList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostList>(
      builder: (context, postList, child) {
        return ListView.builder(
          itemCount: postList.allPostList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(postList.allPostList[index].title),  // 게시물 제목
                subtitle: Text(postList.allPostList[index].question),  // 게시물 내용
                // 다른 필요한 정보들을 추가로 표시할 수 있습니다.
                onTap: () {
                  showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          child: savePost()
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

class savePost extends StatelessWidget {
  savePost({super.key});

  TextEditingController TitleController = TextEditingController();
  TextEditingController QuestionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF9F9FB),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 150),
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
              onPressed: () {},
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

