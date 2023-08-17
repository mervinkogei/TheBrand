import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thebrand/Components/custom_button.dart';
import 'package:thebrand/Utils/custom_theme.dart';

class ProductScreen extends StatefulWidget {
  final String? image;
  ProductScreen({Key? key, this.image}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
                        const Padding(padding: EdgeInsets.only(top: 22),
                        child: Text("Title"),),
                        Padding(padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(children: [
                    Text("MRP: ")  , Text("\$Price")
                    ]),),

                    CustomButton(onPressed: (){}, text: "Add to cart", isLoading: addButtonLead,),
                    Padding(padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text("About the item", style: Theme.of(context).textTheme.headlineMedium,),),
                    Padding(padding: EdgeInsets.only(bottom: 20),
                    child: Text("The item description is a shoe with a lot of classy and its a cost-friendly. Its availble from baby to adult sizes.", style: Theme.of(context).textTheme.bodySmall,),)
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