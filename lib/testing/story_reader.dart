// import 'package:flutter/material.dart';

// import 'package:wordbud/core/src/enums.dart';
// import 'package:wordbud/core/src/model_layer/encoding_decoding/encoding_decoding_protocols.dart';

// import 'package:wordbud/screens/learn/story_feed.dart';
// import 'package:wordbud/screens/reader/widgets/popup_preview/popup_word_preview.dart';

// import 'package:wordbud/screens/quizzes/wordbud_quiz/pages/quiz_begin.dart';

// import './widgets/reader_refresh.dart';
// import 'dart:ui';
// import 'dart:async';

// class StoryReader extends StatefulWidget {
//   static const routeName = 'story-reader';

//   StoryReader();

//   @override
//   _StoryReaderState createState() => _StoryReaderState();
// }

// class _StoryReaderState extends State<StoryReader> {
//   bool isRefresh = false;
//   List<InlineSpan> _getSpans(
//     String text,
//     List<DecodedTokenData> decodedTokens,
//     TextStyle orangeStyle,
//     TextStyle greenStyle,
//   ) {
//     List<InlineSpan> spans = [];
//     // int spanBoundary = 0;

//     for (var i = 0; i < decodedTokens.length; i++) {
//       DecodedTokenData token = decodedTokens[i];
//       EdgeInsetsGeometry lineMargin = EdgeInsets.fromLTRB(0, 2, 0, 2);
//       TextStyle style = TextStyle(
//         fontFamily: 'Noto Sans SC',
//         height: 1,
//         fontSize: 18,
//       );

//       if (token.isNewlineChar) {
//         spans.add(TextSpan(
//             text: token.bareToken,
//             style: TextStyle(
//               fontFamily: 'Noto Sans SC',
//               fontSize: 18,
//             )));
//         continue;
//       }
//       if (token.tokenWordbudData.isNotEmpty) {
//         Color bgColor;
//         EdgeInsetsGeometry wordbudPadding;

//         if (decodedTokens[i].tokenWordbudData[0].wordbud.wbType ==
//             WordbudType.newWB) {
//           bgColor = Color(0xFFFFC792); // #FFC792
//           wordbudPadding = EdgeInsets.fromLTRB(4, 4, 4, 4);
//         } else if ([
//           "WordbudType.growingWBpriorityHigh",
//           "WordbudType.growingWBpriorityMedium",
//           "WordbudType.growingWBpriorityLow",
//         ].contains(
//             decodedTokens[i].tokenWordbudData[0].wordbud.wbType.toString())) {
//           bgColor = Color(0xFFADEFA7); // #ADEFA7
//           wordbudPadding = EdgeInsets.fromLTRB(4, 4, 4, 4);
//         } else {
//           bgColor = Colors.transparent;
//           wordbudPadding = EdgeInsets.fromLTRB(0, 4, 0, 4);
//         }
//         if (token.potentialLineBreakIndices.isEmpty) {
//           spans.add(
//             WidgetSpan(
//               child: GestureDetector(
//                 onTap: () => showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       print(token.tokenWordbudData[0].wordbud.wbType);
//                       return PopupWordPreview(
//                         // collected: [
//                         //   WordbudType.newWB,
//                         //   WordbudType.growingWBpriorityHigh,
//                         //   WordbudType.growingWBpriorityMedium,
//                         //   WordbudType.growingWBpriorityLow,
//                         // ].contains(token.tokenWordbudData[0].wordbud.wbType)
//                         //     ? true
//                         //     : false,
//                         status:
//                             token.tokenWordbudData[0].wordbud.wbType.toString(),
//                         definitions: [
//                           {
//                             'partOfSpeech': 'v.',
//                             'translation':
//                                 '撕; 撕破; 拉掉; 使分裂; 左右为难; 撕裂; 撕开; 飞跑; 疾驰',
//                           },
//                           {
//                             'partOfSpeech': 'n.',
//                             'translation': '裂缝',
//                           },
//                         ],
//                         ipa: 'ipa',
//                         lemma: decodedTokens[i].bareToken,
//                       );
//                     }),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Container(
//                       padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
//                       margin: lineMargin,
//                       child: Text(
//                         token.leadingString,
//                         style: style,
//                       ),
//                     ),
//                     Container(
//                       padding: wordbudPadding,
//                       margin: lineMargin,
//                       decoration: BoxDecoration(
//                           color: bgColor,
//                           borderRadius: BorderRadius.circular(4)),
//                       child: Text(
//                         token.bareToken,
//                         style: style,
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
//                       margin: lineMargin,
//                       child: Text(
//                         token.trailingString,
//                         style: style,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         } else {
//           spans.add(
//             WidgetSpan(
//               child: GestureDetector(
//                 onTap: () => showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return PopupWordPreview(
//                         // collected: [
//                         //   WordbudType.newWB,
//                         //   WordbudType.growingWBpriorityHigh,
//                         //   WordbudType.growingWBpriorityMedium,
//                         //   WordbudType.growingWBpriorityLow,
//                         // ].contains(token.tokenWordbudData[0].wordbud.wbType)
//                         //     ? true
//                         //     : false,
//                         status:
//                             token.tokenWordbudData[0].wordbud.wbType.toString(),
//                         definitions: [
//                           {
//                             'partOfSpeech': 'v.',
//                             'translation':
//                                 '撕; 撕破; 拉掉; 使分裂; 左右为难; 撕裂; 撕开; 飞跑; 疾驰',
//                           },
//                           {
//                             'partOfSpeech': 'n.',
//                             'translation': '裂缝',
//                           },
//                         ],
//                         ipa: 'ipa',
//                         lemma: decodedTokens[i].bareToken,
//                       );
//                     }),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Container(
//                       padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
//                       margin: lineMargin,
//                       child: Text(
//                         token.leadingString,
//                         style: style,
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.fromLTRB(4, 4, 0, 4),
//                       margin: lineMargin,
//                       decoration: BoxDecoration(
//                         color: bgColor,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(3),
//                           bottomLeft: Radius.circular(3),
//                         ),
//                       ),
//                       child: Text(
//                         token.bareToken
//                             .substring(0, token.potentialLineBreakIndices[0]),
//                         style: style,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//           for (var i = 1; i < token.potentialLineBreakIndices.length - 1; i++) {
//             spans.add(
//               WidgetSpan(
//                 child: GestureDetector(
//                   onTap: () => showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return PopupWordPreview(
//                           // collected: [
//                           //   WordbudType.newWB,
//                           //   WordbudType.growingWBpriorityHigh,
//                           //   WordbudType.growingWBpriorityMedium,
//                           //   WordbudType.growingWBpriorityLow,
//                           // ].contains(token.tokenWordbudData[0].wordbud.wbType)
//                           //     ? true
//                           //     : false,
//                           status: token.tokenWordbudData[0].wordbud.wbType
//                               .toString(),
//                           definitions: [
//                             {
//                               'partOfSpeech': 'v.',
//                               'translation':
//                                   '撕; 撕破; 拉掉; 使分裂; 左右为难; 撕裂; 撕开; 飞跑; 疾驰',
//                             },
//                             {
//                               'partOfSpeech': 'n.',
//                               'translation': '裂缝',
//                             },
//                           ],
//                           ipa: 'ipa',
//                           lemma: decodedTokens[i].bareToken,
//                         );
//                       }),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Container(
//                         padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
//                         margin: lineMargin,
//                         decoration: BoxDecoration(
//                           color: bgColor,
//                           // borderRadius: BorderRadius.only(
//                           //   topRight: Radius.circular(3),
//                           //   bottomRight: Radius.circular(3),
//                           // ),
//                         ),
//                         child: Text(
//                           token.bareToken.substring(
//                               token.potentialLineBreakIndices[i],
//                               token.potentialLineBreakIndices[i + 1]),
//                           style: style,
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
//                         margin: lineMargin,
//                         child: Text(
//                           token.trailingString,
//                           style: style,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }
//           spans.add(
//             WidgetSpan(
//               child: GestureDetector(
//                 onTap: () => showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return PopupWordPreview(
//                         // collected: [
//                         //   WordbudType.newWB,
//                         //   WordbudType.growingWBpriorityHigh,
//                         //   WordbudType.growingWBpriorityMedium,
//                         //   WordbudType.growingWBpriorityLow,
//                         // ].contains(token.tokenWordbudData[0].wordbud.wbType)
//                         //     ? true
//                         //     : false,
//                         status:
//                             token.tokenWordbudData[0].wordbud.wbType.toString(),
//                         definitions: [
//                           {
//                             'partOfSpeech': 'v.',
//                             'translation':
//                                 '撕; 撕破; 拉掉; 使分裂; 左右为难; 撕裂; 撕开; 飞跑; 疾驰',
//                           },
//                           {
//                             'partOfSpeech': 'n.',
//                             'translation': '裂缝',
//                           },
//                         ],
//                         ipa: 'ipa',
//                         lemma: decodedTokens[i].bareToken,
//                       );
//                     }),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Container(
//                       padding: EdgeInsets.fromLTRB(0, 4, 4, 4),
//                       margin: lineMargin,
//                       decoration: BoxDecoration(
//                         color: bgColor,
//                         borderRadius: BorderRadius.only(
//                           topRight: Radius.circular(3),
//                           bottomRight: Radius.circular(3),
//                         ),
//                       ),
//                       child: Text(
//                         token.bareToken
//                             .substring(token.potentialLineBreakIndices.last),
//                         style: style,
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
//                       margin: lineMargin,
//                       child: Text(
//                         token.trailingString,
//                         style: style,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }

//         continue;
//       }
//       spans.add(
//         WidgetSpan(
//           child: Container(
//             padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
//             margin: lineMargin,
//             child: Text(
//               token.leadingString,
//               style: style,
//             ),
//           ),
//         ),
//       );
//       spans.add(
//         WidgetSpan(
//           child: Container(
//             padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
//             margin: lineMargin,
//             child: Text(
//               token.bareToken,
//               style: style,
//             ),
//           ),
//         ),
//       );
//       spans.add(
//         WidgetSpan(
//           child: Container(
//             padding: EdgeInsets.fromLTRB(0, 1, 0, 4),
//             margin: lineMargin,
//             child: Text(
//               token.trailingString,
//               style: style,
//             ),
//           ),
//         ),
//       );
//     }

//     return spans;
//   }

//   ScrollController _controller = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     // Timer(
//     //     Duration(microseconds: 0),
//     //     () => _controller.jumpTo(
//     //           _controller.position.maxScrollExtent,
//     //           // curve: Curves.easeOut,
//     //           // duration: const Duration(microseconds: 1),
//     //         ));
//     Size size = MediaQuery.of(context).size;
//     final StoryArgs args = ModalRoute.of(context).settings.arguments;

//     final decodableTextObject = args.decodableText;
//     final title = args.title;
//     final decodedTextDataWithWordbudsList =
//         decodableTextObject.getDecodedTextDataWithWordbudsList();

//     final String decodedText =
//         decodedTextDataWithWordbudsList.decodedTextData.decodedText;
//     final List<DecodedTokenData> decodedTokens =
//         decodedTextDataWithWordbudsList.decodedTextData.decodedTokens;

//     final newWbList = decodedTextDataWithWordbudsList.wbList
//         .where((wordbud) => wordbud.wbType == WordbudType.newWB)
//         .toList();

//     // USE THIS newWbList VARIABLE TO DO STUFF LIKE BUILD NEW WORDBUDS LIST, ETC.

//     final orangeStyle = TextStyle(backgroundColor: Colors.orange);
//     final greenStyle = TextStyle(backgroundColor: Colors.green);

//     final spans = _getSpans(
//       decodedText,
//       decodedTokens,
//       orangeStyle,
//       greenStyle,
//     );
//     final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: PreferredSize(
//         // sets the size of the AppBar to smaller than standard height
//         preferredSize: Size.fromHeight(40.0),
//         child: AppBar(
//           elevation: 0,
//           titleSpacing: 0,
//           title: Text(
//             args.title.toUpperCase(),
//             style: TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(
//                 Icons.more_horiz,
//               ),
//               onPressed: () => print('afdke eeeee'),
//             ),
//             IconButton(
//               icon: Icon(
//                 Icons.format_size,
//               ),
//               onPressed: () => print('afdke eeeee'),
//             ),
//           ],
//         ),
//       ),
//       endDrawer: Theme(
//         data: Theme.of(context).copyWith(
//           canvasColor: Colors.transparent,
//         ),
//         child: Drawer(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 height: 60,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Color(0xFF05306A),
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
//                 ),
//                 child: SafeArea(
//                   child: Center(
//                     child: Text(
//                       'New Wordbuds',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 color: Color(0xFFFFFFFF),
//                 height: size.height - 60,
//                 child: ListView.separated(
//                     padding: EdgeInsets.all(0),
//                     separatorBuilder: (context, index) => Divider(
//                           indent: 9,
//                           // endIndent: 8,
//                           color: Colors.grey,
//                         ),
//                     itemCount: newWbList.length,
//                     itemBuilder: (ctx, index) {
//                       // print(newWbList[index].getPreferredLemmaDemoForm());
//                       return ListTile(
//                         subtitle: Text(
//                           '吉祥物',
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Color(0xFF8C8C8C),
//                           ),
//                         ),
//                         dense: true,
//                         contentPadding: EdgeInsets.symmetric(
//                           vertical: 0,
//                           horizontal: 16,
//                         ),
//                         leading: Container(
//                           padding: EdgeInsets.all(4),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Color(0xFFE9F4FD),
//                           ),
//                           child: Icon(
//                             Icons.volume_up,
//                             color: Color(0xFF01AAEE),
//                           ),
//                         ),
//                         title: Text(
//                           newWbList[index].getPreferredLemmaDemoForm(),
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontFamily: 'Roboto',
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: RefreshReader(
//         onRefresh: () async {
//           setState(() {
//             isRefresh = true;
//           });
//           Future.delayed(const Duration(milliseconds: 500), () {
//             setState(() {
//               Navigator.of(context).pushNamed(LandingPage.routeName);
//               isRefresh = false;
//             });
//           });
//         },
//         child: Stack(
//           children: <Widget>[
//             ListView(
//               // controller: _controller,
//               // reverse: true,
//               children: <Widget>[
//                 Stack(
//                   overflow: Overflow.visible,
//                   children: <Widget>[
//                     Container(
//                       constraints: BoxConstraints(minWidth: size.width),
//                       decoration: BoxDecoration(
//                         color: Color(0xFFE9F4FD),
//                       ),
//                       // height: size.width * 0.42,
//                       child: Padding(
//                         padding: const EdgeInsets.all(3),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           // mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             Card(
//                               clipBehavior: Clip.antiAlias,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(3),
//                               ),
//                               elevation: 0,
//                               child: Image.asset(
//                                 "assets/images/Marine_Bird.jpg",
//                                 height: size.width * 0.4,
//                                 width: size.width * 0.18,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             SizedBox(width: 15),
//                             Flexible(
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 12),
//                                 child: Column(
//                                   // mainAxisSize: MainAxisSize.min,
//                                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Text(
//                                       title,
//                                       // 'The Gettysburg Address Given by Abraham Lincoln, the 16th President Of the United States\'es l;aksdf af ae ;aek aegj alef aelf alelkjl klje a dalk adlfksjaklds  ad faldk',
//                                       style: TextStyle(
//                                         color: Color(
//                                           0xFF05306A,
//                                         ),
//                                         fontSize: 22,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       "第2 章，共6章",
//                                       style: TextStyle(
//                                           color: Color(0xFF0072DC),
//                                           fontSize: 15,
//                                           fontFamily: 'Noto Sans SC',
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                     Text(
//                                       "Wikipedia",
//                                       style: TextStyle(
//                                         color: Color(0xff393939),
//                                         fontSize: 14,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Positioned.fill(
//                       top: -size.height,
//                       child: Align(
//                         alignment: Alignment.topCenter,
//                         child: Container(
//                           // color: Color.fromRGBO(35, 56, 108, 1),
//                           decoration: BoxDecoration(
//                             color: Color(0xFFE9F4FD),
//                           ),
//                           height: size.height,
//                           width: size.width,
//                           // child to be displayed if pulled down to refresh
//                           // child: Align(
//                           //   alignment: Alignment.bottomCenter,
//                           //   child: Padding(
//                           //     padding: const EdgeInsets.only(bottom: 60.0),
//                           //     child: CircularProgressIndicator(),
//                           //   ),
//                           // ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(
//                       MediaQuery.of(context).size.width * 0.087,
//                       25,
//                       MediaQuery.of(context).size.width * 0.06,
//                       40),
//                   child: Text.rich(
//                     TextSpan(
//                       children: spans,
//                     ),
//                   ),
//                 ),
//                 Stack(
//                   overflow: Overflow.visible,
//                   children: <Widget>[
//                     Container(
//                       constraints: BoxConstraints(minWidth: size.width),
//                       // decoration: BoxDecoration(
//                       //   color: Color(0xFFE9F4FD),
//                       // ),
//                       // height: size.width * 0.42,
//                       child: Padding(
//                         padding: EdgeInsets.all(isRefresh ? 60 : 15),
//                       ),
//                     ),
//                     Positioned.fill(
//                       bottom: -size.height,
//                       child: Align(
//                           alignment: Alignment.topCenter,
//                           child: Container(
//                             height: 90,
//                             padding: EdgeInsets.only(top: 30),
//                             width: MediaQuery.of(context).size.width * .5,
//                             decoration: BoxDecoration(
//                                 color: Color(0xff05306A),
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10))),
//                             // child: Center(
//                             child: Column(
//                               children: <Widget>[
//                                 Text(
//                                   'Release for Quiz',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Icon(
//                                   Icons.keyboard_arrow_down,
//                                   color: Colors.white,
//                                 )
//                               ],
//                             ),
//                             // ),
//                           )
//                           // RefreshProgressIndicator(
//                           //   semanticsLabel: widget.semanticsLabel ??
//                           //       MaterialLocalizations.of(context)
//                           //           .refreshIndicatorSemanticLabel,
//                           //   semanticsValue: widget.semanticsValue,
//                           //   value: showIndeterminateIndicator ? null : _value.value,
//                           //   valueColor: _valueColor,
//                           //   backgroundColor: widget.backgroundColor,
//                           // );

//                           // Container(
//                           //   // color: Color.fromRGBO(35, 56, 108, 1),
//                           //   decoration: BoxDecoration(
//                           //     color: Color(0xFFE9F4FD),
//                           //   ),
//                           //   height: size.height,
//                           //   width: size.width ,
//                           //   // child to be displayed if pulled down to refresh
//                           //   // child: Align(
//                           //   //   alignment: Alignment.bottomCenter,
//                           //   //   child: Padding(
//                           //   //     padding: const EdgeInsets.only(bottom: 60.0),
//                           //   //     child: CircularProgressIndicator(),
//                           //   //   ),
//                           //   // ),
//                           // ),
//                           ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Positioned(
//               bottom: 10,
//               right: 10,
//               child: Align(
//                 alignment: Alignment.bottomRight,
//                 child: GestureDetector(
//                   onTap: () => _scaffoldKey.currentState.openEndDrawer(),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       color: Color(0xFF01AAEE),
//                     ),
//                     child: Image.asset(
//                       'assets/images/vocab_tab_wordbud.png',
//                       height: size.width * 0.12,
//                       width: size.width * 0.12,
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
