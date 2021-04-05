import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_movies_app/pages/detail%20screen/item_cast_model.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.asset("assets/images/itachi_shinden.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context)
        ],
      ),
    );
  }

  _body(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(
          height: 20,
        ),
        _header(),
        SizedBox(
          height: 20,
        ),
        _cast(),
        SizedBox(
          height: 20,
        ),
        _overview()
      ],
    );
  }

  _header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset("assets/images/itachi_shinden.jpg")),
            flex: 1,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Itachi Shinden",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text("Xuất bản:",
                            style: TextStyle(fontSize: 14, fontFamily: 'd')),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text("05-T3-2021",
                            style: TextStyle(fontSize: 14, fontFamily: 'd')),
                        flex: 4,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text("Thể loại:",
                            style: TextStyle(fontSize: 14, fontFamily: 'd')),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(
                          "Anime, hành động, tâm lý, tình cảm, drama, ngôn tình, viễn tưởng",
                          style: TextStyle(fontSize: 14, fontFamily: 'd'),
                        ),
                        flex: 4,
                      )
                    ],
                  )
                ],
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  _cast() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 160,
            child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: listItemCast.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _itemCast(listItemCast[index]);
                }),
          ),
        ],
      ),
    );
  }

  _itemCast(ItemCast itemCast) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                height: 160,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(itemCast.urlPhoto))),
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            /*itemCast.name*/
            itemCast.name,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCast.character,
            style: TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }

  _overview() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overview",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Câu chuyện xoay quanh cuộc đời bi kịch của người anh hùng Itachi Uchiha khi phát hiện ra những bí mật kinh hoàng của ngôi làng lẫn xung đột của các bộ tộc. Vì chán ghét chiến tranh, muốn bảo vệ cho hòa bình thế giới Itachi đã có những lựa chọn khó khăn nhất, thậm chí từ bỏ ước mơ trở thành Hokage. \n\nKể từ khi gia nhập vào Anbu, đôi tay anh cũng nhuốm đầy máu và phản bội lại cả gia tộc Uchiha. Tuy nhiên không ai biết được sự hi sinh cao cả của anh, kể cả người em trai Sasuke.Trước đó nguyên tác của phim được viết bởi tác giả Takashi Yano, chia thành 2 tập và phát hành lần lượt trong quý 3 năm 2015.\n\nCả hai tập truyện của light novel đều lọt vào top light novel bán chạy nhất trong tháng, thậm chí còn được công ty Viz Media lên kế hoạch mua bản quyền. Các phần light novel ăn theo như Kakashi Hiden, Shikamaru Hiden và Sakura Hiden đã được mua bản quyền, dự định phát hành ở Thị trường Bắc Mỹ vào năm 2016.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
