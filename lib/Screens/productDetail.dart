import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:thebrand/Components/custom_button.dart';
import 'package:thebrand/Utils/custom_theme.dart';

class ProductScreen extends StatefulWidget {
  final String? image;
  final String? title;
  final String? categoryName;
  final String? keywords;
  final DateTime? createdAt;
  ProductScreen({Key? key, this.image, this.categoryName, this.createdAt, this.keywords, this.title}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String dateFormat ="";

  @override
  void initState() {
    DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.parse("${widget.createdAt}"));
print("Format Date: $formattedDate");
setState(() {
  dateFormat = formattedDate;
});
    super.initState();
  }
  bool addButtonLead = false;
 _handleAccept() {
 Navigator.of(context).pop(true); // dialog returns true
}
  void onAddtoCart()async{
setState(() {
  addButtonLead = true;
});

//Add to cart
setState(() {
  addButtonLead = false;
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Stack(
                children: [
                    SizedBox(height: 300, width: double.infinity,
                child: CachedNetworkImage( fit:BoxFit.cover,
                  imageUrl: '${widget.image}',),),
                  Positioned(
                    top: 35, right: 35,
                    child: Container(
                      decoration:  const ShapeDecoration(
                      color: CustomTheme.yellow,
                      shape: CircleBorder(),
                      shadows: [BoxShadow(color: CustomTheme.grey, offset: Offset(1,3), blurRadius: 3,)]
                      ),
                      child: IconButton(onPressed: onAddtoCart, icon: Icon(Icons.share)),
                    )),

                    
              
                ],
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DefaultTextStyle(style: Theme.of(context).textTheme.headlineLarge!, child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        SizedBox(height: 22,),
                        const Divider(color: CustomTheme.grey, height: 2, thickness: 2,),
                        Padding(padding: const EdgeInsets.symmetric(vertical: 10),                        
                    child: Container(
                      child: Row(
                        children: [
                      const Text("Title: ")  , Expanded(child: Text("${widget.title}", style: const TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.normal,),))
                      ]),
                    ),),
                        Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(children: [
                    const Text("Category: ")  , Expanded(child: Text("${widget.categoryName}", style: const TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.normal,),))
                    ]),),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(children: [
                    const Text("Keywords: ")  , Text("${widget.keywords}", style: const TextStyle(color: Colors.blueGrey, fontSize: 20, fontWeight: FontWeight.normal,),)
                    ]),),

                    // CustomButton(onPressed: (){}, text: "Add to cart", isLoading: addButtonLead,),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("More Details:", style: Theme.of(context).textTheme.headlineMedium,),),
                    Padding(padding: const EdgeInsets.only(bottom: 20),
                    child: Text("${widget.title}", style: Theme.of(context).textTheme.bodyLarge,),),
                    CustomButton(onPressed: (){}, text: "Created at: $dateFormat", isLoading: addButtonLead,),
                      ],
                    )),),
                    
              ],
            ),
          )
        , Positioned(top: 35,left: 30, child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [BoxShadow(blurRadius: 3, color: CustomTheme.yellow, offset: Offset(1,3))]
            ),
            child: IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,), 
            onPressed: _handleAccept,),
          )
          ),
        ],
      )),
    );
  }
}