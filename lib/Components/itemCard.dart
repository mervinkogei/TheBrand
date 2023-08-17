// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:thebrand/Utils/custom_theme.dart';

// class ItemCard extends StatefulWidget {
//   final int index;
//   final Function() onPressed;
//   ItemCard({Key? key, required this.index, required this.onPressed}) : super(key: key);

//   @override
//   State<ItemCard> createState() => _ItemCardState();
// }

// class _ItemCardState extends State<ItemCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: CustomTheme.getCardDecoration(),
//       // margin: widget.index % 2 == 0 ? const EdgeInsets.only(left: 22) : const EdgeInsets.only(right: 22),
//       child: GestureDetector(
//         onTap: widget.onPressed,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(35),
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 7,
//                 child: SizedBox(
//                 width: double.infinity,
//                 child: CachedNetworkImage(
//                   fit: BoxFit.cover,
//                   imageUrl: "https://images.unsplash.com/photo-1603808033192-082d6919d3e1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHNob2VzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
//               )),
//               Expanded(
//                 flex: 3,
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Padding(padding: EdgeInsets.symmetric(vertical: 4),
//                       child: Text("title", style: Theme.of(context).textTheme.headlineSmall,),),
//                       Text("price", style: Theme.of(context).textTheme.headlineSmall,),
//                     ],
//                   ),
//                 ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }