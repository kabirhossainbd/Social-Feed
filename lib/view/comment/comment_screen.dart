import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_feed/util/color_resources.dart';
import 'package:social_feed/util/dimensions.dart';
import 'package:social_feed/util/images.dart';
import 'package:social_feed/util/styles.dart';
import 'package:social_feed/widgets/profile_avatar.dart';


class PostCommentBottomSheet extends StatefulWidget {
  const PostCommentBottomSheet({super.key});


  @override
  State<PostCommentBottomSheet> createState() => _PostCommentBottomSheetState();
}

class _PostCommentBottomSheetState extends State<PostCommentBottomSheet> {

  TextEditingController _commentCon = TextEditingController();
  FocusNode _focusNode = FocusNode();

  var _commentList = [];

  List<bool> _isLike = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {

        });
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.95,
        minChildSize: 0.3,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, controller) {
          return InkWell(
            onTap: () {
              setState(() {

              });
            },
            child: Container(
              // padding: const EdgeInsets.fromLTRB(16,0,16,0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () => Get.back(),
                      child: Align(child: Container(
                            margin:
                            const EdgeInsets.only(top: 8, bottom: 8),
                            height: 2,
                            width: 30,
                            alignment: Alignment.center,
                            color: const Color(0xFF667085),
                          ))),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Text(
                      'Comments',
                      style: interBold.copyWith(
                          fontSize: Dimensions.fontSizeLarge,
                          color: ColorResources.getTextColor(context)),
                    ),
                  ),
                  Expanded(
                    child: NotificationListener<OverscrollIndicatorNotification>(onNotification: (overScroll) {
                      overScroll.disallowIndicator();
                      return true;
                    },
                      child: RefreshIndicator(
                        onRefresh: () async {

                        },
                        child: SingleChildScrollView(
                          controller: controller,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: ListView.builder(
                                itemCount: _commentList.length,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(5),
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, i) {
                                  _isLike.add(false);
                                 return Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                         InkWell(
                                             splashColor: Colors.transparent,
                                             highlightColor: Colors.transparent,
                                             hoverColor: Colors.transparent,
                                             focusColor: Colors.transparent,
                                             onTap: () {

                                             },
                                             child: const ProfileAvatar(
                                               imageUrl: '',
                                               weight: 32,
                                               height: 32,
                                             )),
                                         const SizedBox(
                                           width: 5,
                                         ),
                                         Expanded(
                                             child: InkWell(
                                               child: Container(
                                                 padding:
                                                 const EdgeInsets
                                                     .all(5),
                                                 decoration:
                                                 const BoxDecoration(
                                                   //color: ColorResources.COLOR_WHITE,
                                                     borderRadius: BorderRadius.only(
                                                         topRight:
                                                         Radius.circular(
                                                             12),
                                                         bottomLeft:
                                                         Radius.circular(
                                                             12),
                                                         bottomRight:
                                                         Radius.circular(12))),
                                                 child: Column(
                                                   mainAxisAlignment:
                                                   MainAxisAlignment
                                                       .start,
                                                   crossAxisAlignment:
                                                   CrossAxisAlignment
                                                       .start,
                                                   children: [
                                                     RichText(
                                                         text: TextSpan(
                                                             text: 'John',
                                                             style: interBold.copyWith(
                                                                 color:
                                                                 ColorResources.COLOR_LIGHT_BLACK,
                                                                 fontSize: Dimensions.fontSizeSmall),
                                                             children: [
                                                               TextSpan(
                                                                 text:
                                                                 '   ',
                                                                 style: interRegular.copyWith(
                                                                     color:
                                                                     ColorResources.getGreyColor(context),
                                                                     fontSize: Dimensions.fontSizeExtraSmall),
                                                               ),
                                                               TextSpan(
                                                                 text: 'just now',
                                                                 style: interRegular.copyWith(
                                                                     color:
                                                                     ColorResources.getGreyColor(context),
                                                                     fontSize: Dimensions.fontSizeExtraSmall),
                                                               )
                                                             ])),
                                                     const SizedBox(
                                                       height: 2,
                                                     ),
                                                     ExpandableRichText( _commentList[i],
                                                       expandText:
                                                       'Show more',
                                                       collapseText:
                                                       'Show less',
                                                       expanded:
                                                       false,
                                                       onExpandedChanged: (flag) => {},
                                                       toggleTextColor:
                                                       Colors.black,
                                                       showEllipsis: true,
                                                       toggleTextStyle: interRegular.copyWith(
                                                           color: Colors.grey,
                                                           fontSize:
                                                           Dimensions
                                                               .fontSizeSmall,
                                                           decoration:
                                                           TextDecoration
                                                               .none),
                                                       urlStyle: interRegular.copyWith(
                                                           color: Colors
                                                               .blueAccent,
                                                           fontSize:
                                                           Dimensions
                                                               .fontSizeSmall,
                                                           decoration:
                                                           TextDecoration
                                                               .none),
                                                       onUrlTap:
                                                           (url) {

                                                       },
                                                       hashtagStyle: interRegular.copyWith(
                                                           color: ColorResources
                                                               .getPrimaryColor(
                                                               context),
                                                           fontSize:
                                                           Dimensions
                                                               .fontSizeSmall,
                                                           decoration:
                                                           TextDecoration
                                                               .none),
                                                       mentionStyle: interRegular.copyWith(
                                                           color: ColorResources
                                                               .getPrimaryColor(
                                                               context),
                                                           fontSize:
                                                           Dimensions
                                                               .fontSizeSmall,
                                                           decoration:
                                                           TextDecoration
                                                               .none),
                                                       onMentionTap: (mention) {},
                                                       customTagStyle: const TextStyle(
                                                           fontWeight:
                                                           FontWeight
                                                               .bold,
                                                           fontStyle:
                                                           FontStyle
                                                               .normal,
                                                           fontSize:
                                                           16,
                                                           color: Colors
                                                               .blue,
                                                           backgroundColor:
                                                           Colors
                                                               .transparent,
                                                           decoration:
                                                           TextDecoration.none),
                                                       onCustomTagTap: (tag) {

                                                       },
                                                       expandOnTextTap:
                                                       true,
                                                       collapseOnTextTap:
                                                       true,
                                                       style: interRegular.copyWith(
                                                           color: ColorResources
                                                               .getTextColor(
                                                               context),
                                                           fontSize:
                                                           Dimensions
                                                               .fontSizeSmall,
                                                           decoration:
                                                           TextDecoration
                                                               .none),
                                                       textDirection:
                                                       TextDirection
                                                           .ltr,
                                                       textAlign:
                                                       TextAlign
                                                           .start,
                                                       textScaleFactor:
                                                       1.0,
                                                       maxLines: 10,
                                                       animation:
                                                       true,
                                                       animationDuration:
                                                       const Duration(
                                                           milliseconds:
                                                           200),
                                                       animationCurve:
                                                       Curves
                                                           .fastLinearToSlowEaseIn,
                                                     ),
                                                     const SizedBox(
                                                       height: 5,
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             )),
                                         InkWell(
                                           onTap: (){
                                             setState(() {
                                               _isLike[i] = !_isLike[i];
                                             });
                                           },
                                           child: Column(
                                             children: [
                                               SvgPicture.asset(
                                                 _isLike[i] ? AllImages.like: AllImages.unLike,
                                                 height: 20,
                                                 width: 20,
                                               ),
                                               const SizedBox(
                                                   height: 4),
                                               Text(_isLike[i] ? '1' : '0',
                                                 style: interRegular.copyWith(
                                                     color: ColorResources
                                                         .COLOR_LIGHT_BLACK,
                                                     fontSize:
                                                     Dimensions
                                                         .fontSizeSmall),
                                               ),
                                             ],
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 );
                                }),
                          ),
                        ),
                      ),
                    ),
                  ),



                  Container(
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            ClipOval(
                                child: SvgPicture.asset(
                                    AllImages
                                        .profilePlaceHolder,
                                    height: 38,
                                    width: 38,
                                    fit: BoxFit.scaleDown)),
                            const SizedBox(width: 16),


                            Expanded(child: CupertinoTextField(
                              suffix: InkWell(
                                onTap: () {

                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SvgPicture.asset(AllImages.commentEmoji, width: 24, height: 24,),
                                ),
                              ),
                              autocorrect: true,
                              autofocus: true,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: const Color(0xFFEAECF0)),
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [BoxShadow(
                                      color: Color(0x1018280D),
                                      spreadRadius: 0.5,
                                      blurRadius: 0.5,
                                      offset: Offset(1, 1)
                                  )
                                  ]
                              ),

                              style: const TextStyle(color: Color(0xff252525)),
                              textCapitalization: TextCapitalization.sentences,
                              placeholder: 'Comment to John',
                              placeholderStyle: interRegular.copyWith(color: const Color(0xFF667085).withOpacity(0.8)),
                              focusNode: _focusNode,
                              controller: _commentCon,
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              minLines: 1,
                              cursorColor: ColorResources.COLOR_GREY,
                              cursorWidth: 1,
                              textInputAction: TextInputAction.search,
                              onChanged: (txt) {
                               setState(() {});
                              },
                            )),
                            const SizedBox(width: 12),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _commentList.add(_commentCon.text);
                                  });
                                  _commentCon.clear();
                                },
                                child: SvgPicture.asset(
                                  AllImages.send,
                                  width: 24,
                                  height: 24,
                                  color: _commentCon.text.isNotEmpty ? ColorResources.COLOR_PRIMARY : Colors.grey,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),


                  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Triangle extends CustomPainter {
  final Color bgColor;

  Triangle(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

