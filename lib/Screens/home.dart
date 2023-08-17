import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thebrand/Model/dataModel.dart';
import 'package:thebrand/Screens/productDetail.dart';
import 'package:thebrand/Utils/custom_theme.dart';
import 'package:thebrand/Utils/data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<BrandData> brandItems = [];

getBrandData() async{
    var map = brandData;
    var itemList = map;
    brandItems.clear();
    itemList.forEach((element) {
        brandItems.add(BrandData(
            id: element['id'],
            title: element['title'],
            slug: element['slug'],
            keywords:element['keywords'],
            categoryId: element['category_id'],
            // ignore: prefer_interpolation_to_compose_strings
            imageDefault: element['image_default'] == null ? 'https://www.thebrand.ai/i/uploads/logo/logo_62a4de26e93f0.png': 'https://www.thebrand.ai/i/'+ element['image_default'],
            imageSmall:  element['image_small'] == null ? 'https://www.thebrand.ai/i/uploads/logo/logo_62a4de26e93f0.png' : 'https://www.thebrand.ai/i/'+ element['image_small'],
            createdAt: DateTime.parse(element['created_at']),
            categoryName: element['category_name'],
            categorySlug: element['category_slug'],            
            ));      
    });

  }

@override
  void initState() {
    getBrandData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: const Text("The Brand"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Text("Unleash Your Online Success. Say goodbye to lackluster results and hello to a world of increased website traffic, soaring conversions, and unprecedented growth. With BuzzBoost Pro, you'll harness the power of cutting-edge SEO techniques and expert CRO str",
              style: Theme.of(context).textTheme.bodyLarge,),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: brandItems.length,
                  itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: EdgeInsets.only(left: 0, right: 0, top: 20, bottom: 40),
                  decoration: CustomTheme.getCardDecoration(),
                    child: ListTile(
                      leading: Container(
                        width: 100,
                        height: 250,
                        child: CachedNetworkImage(imageUrl: "${brandItems[index].imageDefault}"),
                      ),
                      title: Container(
                        child: Text(brandItems[index].title),
                      ),
                      trailing: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductScreen(
                            image: brandItems[index].imageDefault, categoryName: brandItems[index].categoryName,
                            createdAt: brandItems[index].createdAt, title: brandItems[index].title,keywords: brandItems[index].keywords,)));
                        },
                        child: Icon(Icons.arrow_forward_ios_outlined)),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
    );
  }
}