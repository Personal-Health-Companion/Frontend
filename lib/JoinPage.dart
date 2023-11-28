import 'package:flutter/material.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '                       Join',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF101522),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            height: 0.08,
          ),
        ),
      ),
      body: JoinPanel(),
    );
  }
}

class JoinPanel extends StatelessWidget {
  const JoinPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: ListView(
        children: [
          Text("  필수 입력", style: TextStyle(color: Colors.grey),),
          SizedBox(
            height: 5,
          ),
          TextField(
            // controller: IDController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.account_circle_outlined),
                labelText: "사용하실 아이디를 입력하세요"
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            // controller: PWController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                labelText: "사용하실 비밀번호를 입력하세요"
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text("  선택 입력", style: TextStyle(color: Colors.grey),),
          SizedBox(
            height: 5,
          ),
          TextField(
            // controller: PWController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF9F9FB),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                  borderRadius: BorderRadius.circular(24),
                ),
                prefixIcon: const Icon(Icons.person_2),
                labelText: "이름을 입력해주세요"
            ),
          ),

          SizedBox(
            height: 15,
          ),

          Container(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(context: context, builder: (context) => GetLocation());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFF9F9FB)),
                ),
                child: Text(
                    "거주 중인 지역을 선택해주세요",
                  style: TextStyle(color: Colors.black87),
                ),
            ),
          ),

          SizedBox(
            height: 40,
          ),

          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("회원가입 완료")
          ),
        ]
      ),
    );
  }
}

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  State<GetLocation> createState() => _getLocationState();
}

class _getLocationState extends State<GetLocation> {
  String selectedCategory = '강원';
  List<String> itemsForSecondDropdown = ['강릉시', '원주시', '춘천시', '삼척시', '속초시', '영원군', '원주시', '동해시', '태백시', '동해시'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(140, 50, 140, 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                  if (selectedCategory == '강원') {
                    itemsForSecondDropdown = ['강릉시', '원주시', '춘천시', '삼척시', '속초시', '영월군', '동해시', '태백시', '태백시', '홍천군', '정선군', '양구군', '인제군', '철원군', '횡성군', '평창군', '화천군', '고성군', '양양군'];
                  } else if (selectedCategory == '경기') {
                    itemsForSecondDropdown = ['안산단원구', '성남분당구', '부천시', '수원영통구', '안양동안구', '용인처인구', '수원팔달구', '의정부시', '용인기흥구', '수원장안구', '안성시', '이천시', '파주시', '포천시', '광명시', '고양일산동구', '안산상록구', '남양주시', '성남수정구', '성남중원구', '오산시', '군포시', '평택시', '시흥시', '수원권선구', '화성시', '고양덕양구', '김포시', '안양만안구', '고양일산서구', '광주시', '구리시', '용인수지구', '양주시', '양평군', '하남시', '가평군', '동두천시', '여주시', '의왕시', '연천군', '과천시'];
                  } else if(selectedCategory == '경남') {
                    itemsForSecondDropdown = ['진주시', '양산시', '창원마산회원구', '김해시', '창원마산합포구', '창원성산구', '통영시', '창원진해구', '거제시', '창원의창구', '고성군', '거창군', '밀양시', '사천시', '합천군', '함안군', '의령군', '남해군', '창녕군', '함양군', '하동군', '산청군'];
                  } else if(selectedCategory == '경북') {
                    itemsForSecondDropdown = ['김천시', '안동시', '포항북구', '구미시', '경주시', '상주시', '포항남구', '영천시', '영주시', '경산시', '문경시', '봉화군', '영덕군', '예천군', '울진군', '의성군', '칠곡군', '청도군', '영양군', '성주군', '고령군', '청송군', '울릉군'];
                  } else if(selectedCategory == '광주') {
                    itemsForSecondDropdown = ['광주동구', '광주광산구', '광주남구', '광주북구', '광주서구'];
                  } else if(selectedCategory == '대구') {
                    itemsForSecondDropdown = ['대구중구', '대구달서구', '대구남구', '대구북구', '대구수성구', '대구동구', '대구서구', '대구달성군', '대구군위군'];
                  } else if(selectedCategory == '대전') {
                    itemsForSecondDropdown = ['대전중구', '대전대덕구', '대전동구', '대전서구', '대전유성구'];
                  } else if(selectedCategory == '부산') {
                    itemsForSecondDropdown = ['부산서구', '부산진구', '부산북구', '부산동래구', '부산기장군', '부산연제구', '부산남구', '부산수영구', '부산영도구', '부산해운대구', '부산사상구', '부산동구', '부산중구', '부산강서구', '부산사하구', '부산금정구'];
                  } else if(selectedCategory == '서울') {
                    itemsForSecondDropdown = ['종로구', '광진구', '동대문구', '구로구', '강남구', '서대문구', '양천구', '송파구', '동작구', '성북구', '서초구', '성동구', '영등포구', '은평구', '강동구', '중구', '노원구', '중랑구', '강서구', '용산구', '관악구', '강북구', '도봉구', '금천구', '마포구'];
                  } else if(selectedCategory == '세종시') {
                    itemsForSecondDropdown = ['세종시'];
                  } else if(selectedCategory == '울산') {
                    itemsForSecondDropdown = ['울산동구', '울산울주군', '울산남구', '울산북구', '울산중구'];
                  } else if(selectedCategory == '인천') {
                    itemsForSecondDropdown = ['인천부평구', '인천남동구', '인천중구', '인천연수구', '인천서구', '인천강화군', '인천동구', '인천미추홀구', '인천계양구', '인천옹진군'];
                  } else if(selectedCategory == '전남') {
                    itemsForSecondDropdown = ['화순군', '광양시', '순천시', '나주시', '목포시', '여수시', '영광군', '장흥군', '무안군', '고흥군', '해남군', '구례군', '함평군', '담양군', '영암군', '보성군', '완도군', '진도군', '곡성군', '신안군', '장성군', '강진군'];
                  } else if(selectedCategory == '전북') {
                    itemsForSecondDropdown = ['익산시', '전주덕진구', '부안군', '군산시', '전주완산구', '고창군', '정읍시', '남원시', '김제시', '진안군', '임실군', '완주군', '순창군', '무주군', '장수군'];
                  } else if(selectedCategory == '제주') {
                    itemsForSecondDropdown = ['제주시', '서귀포시'];
                  } else if(selectedCategory == '충남') {
                    itemsForSecondDropdown = ['천안동남구', '당진시', '서산시', '아산시', '논산시', '천안서북구', '예산군', '보령시', '공주시', '홍성군', '금산군', '계룡시', '서천군', '부여군', '청양군', '태안군'];
                  } else if(selectedCategory == '충북') {
                    itemsForSecondDropdown = ['청주서원구', '충주시', '진천군', '청주상당구', '제천시', '옥천군', '청주흥덕구', '청주청원구', '음성군', '괴산군', '보은군', '영동군', '단양군', '증평군'];
                  }

                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: '강원',
                  child: Text('강원'),
                ),
                DropdownMenuItem<String>(
                  value: '경기',
                  child: Text('경기'),
                ),
                DropdownMenuItem<String>(
                  value: '경남',
                  child: Text('경남'),
                ),
                DropdownMenuItem<String>(
                  value: '경북',
                  child: Text('경북'),
                ),
                DropdownMenuItem<String>(
                  value: '광주',
                  child: Text('광주'),
                ),
                DropdownMenuItem<String>(
                  value: '대구',
                  child: Text('대구'),
                ),
                DropdownMenuItem<String>(
                  value: '대전',
                  child: Text('대전'),
                ),
                DropdownMenuItem<String>(
                  value: '부산',
                  child: Text('부산'),
                ),
                DropdownMenuItem<String>(
                  value: '서울',
                  child: Text('서울'),
                ),
                DropdownMenuItem<String>(
                  value: '세종시',
                  child: Text('세종시'),
                ),
                DropdownMenuItem<String>(
                  value: '울산',
                  child: Text('울산'),
                ),
                DropdownMenuItem<String>(
                  value: '인천',
                  child: Text('인천'),
                ),
                DropdownMenuItem<String>(
                  value: '전남',
                  child: Text('전남'),
                ),
                DropdownMenuItem<String>(
                  value: '전북',
                  child: Text('전북'),
                ),
                DropdownMenuItem<String>(
                  value: '제주',
                  child: Text('제주'),
                ),
                DropdownMenuItem<String>(
                  value: '충남',
                  child: Text('충남'),
                ),
                DropdownMenuItem<String>(
                  value: '충북',
                  child: Text('충북'),
                ),
              ],
            ),
            DropdownButton<String>(
              value: itemsForSecondDropdown.first,
              onChanged: (value) {
                setState(() {
                  // 두 번째 DropdownButton에서 선택한 값에 따라 필요한 동작 수행
                });
              },
              items: itemsForSecondDropdown
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
