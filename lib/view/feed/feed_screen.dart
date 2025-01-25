import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_feed/util/color_resources.dart';
import 'package:social_feed/util/dimensions.dart';
import 'package:social_feed/util/images.dart';
import 'package:social_feed/util/styles.dart';
import 'package:social_feed/view/feed/widget/post_view.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  late ScrollController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //  elevation: 1,
        shadowColor: ColorResources.lessBlackColor.withOpacity(0.12),
        bottomOpacity: 0.3,
        toolbarOpacity: 0.4,
        automaticallyImplyLeading: false,
        titleSpacing: 10,
        title: Row(
          children: [
            Image.asset(AllImages.facebookPng, color: ColorResources.COLOR_PRIMARY, height: 24, width: 24,),
            Text("Facebook", style: interSemiBold.copyWith(color: ColorResources.colorLightBlue, fontSize: Dimensions.fontSizeDefault),)
          ],
        ),
        actions: [
          _appMenu(icon: SvgPicture.asset(AllImages.search, height: 24, width: 24,), onTap: () {

          }),
          const SizedBox(width: Dimensions.paddingSizeMediumSmall),
          /// for plus
          _appMenu(icon: SvgPicture.asset(AllImages.plusCircle, height: 24, width: 24,),
              onTap: (){
              }),
          const SizedBox(width: Dimensions.paddingSizeMediumSmall),
          _appMenu(icon: Image.asset(AllImages.chatPng, height: 24, width: 24,), onTap: () {
           }),
          const SizedBox(width: Dimensions.fontSizeLarge),
        ],
      ) ,
      body: SafeArea(
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () async {},
                    child: NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overScroll) {
                        overScroll.disallowIndicator();
                        return false;
                      },
                      child: ListView(
                        shrinkWrap: true,
                        controller: controller,
                        physics: const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 14),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 0.1, spreadRadius: 0.1, offset: const Offset(1,2))]
                            ),
                            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height: 120,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.only(left: 8),
                                    itemCount: 1,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) {

                                      String _userName = '';
                                      if(index == 0){
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          // onTap: () => Get.bottomSheet( const StoryBottomSheet()),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Column(
                                              children: [

                                                // SvgPicture.asset(AllImages.userPlaceholder,height: 90, width: 80,fit: BoxFit.cover),

                                                Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    SvgPicture.asset(AllImages.userPlaceholder,
                                                      width: 90,
                                                      height: 90,
                                                      fit: BoxFit.cover,),
                                                    Positioned(
                                                      bottom: 10,
                                                      right: 10,
                                                      child: Container(
                                                        height: 20, width: 20,
                                                        padding: const EdgeInsets.all(2),
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: const Color(0xFF0077DD),
                                                            border: Border.all(color: Colors.white, width: 1.5)
                                                        ),
                                                        child: SvgPicture.asset(AllImages.storyPlus, width: 6, height: 6,),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                // const SizedBox(height: 1),
                                                Text('My story', style: interRegular.copyWith(color: ColorResources.getTextColor(context),fontSize: Dimensions.fontSizeSmall),),
                                              ],
                                            ),
                                          ),
                                        );
                                      }


                                      /* return InkWell(
                                                    splashColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                   // onTap: () =>  Navigator.of(context).push(CustomRoute(child: StoryAnimateScreen(storyModel: home.newStoryList[index -1]))),
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                                      child: Column(
                                                        children: [
                                                          Stack( alignment: Alignment.center,
                                                            children: [
                                                              const CustomBorder(
                                                                totalSteps: 6,
                                                                currentStep: 6,
                                                                padding: math.pi / 15,
                                                                selectedColor: Colors.blue,
                                                                unselectedColor: Colors.grey,
                                                                selectedStepSize: 2.0,
                                                                unselectedStepSize: 2.0,
                                                                width: 70,
                                                                height: 70,
                                                              ),
                                                              home.newStoryList[index -1].storys != null && home.newStoryList.isNotEmpty
                                                                  ? home.newStoryList[index -1].storys![0].text !=null && home.newStoryList[index -1].storys![0].image == null &&  home.newStoryList[index -1].storys![0].video == null
                                                                  ? Container(
                                                                  alignment: Alignment.center,
                                                                  width: 55,
                                                                  height: 55,
                                                                  padding: const EdgeInsets.all(8),
                                                                  decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    //borderRadius: BorderRadius.circular(4),
                                                                    color: Color(value ?? 0xFF0061FF),
                                                                  ), child: Text(home.newStoryList[index -1].storys![0].text ?? '', style: TextStyle(color: Colors.white, fontSize: Dimensions.fontSizeExtraSmall, fontFamily: fontFamily ?? 'Araboto'),))
                                                                  : home.newStoryList[index -1].storys![0].image != null
                                                                  ? ClipRRect(
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  child: CachedNetworkImage(
                                                                    imageUrl: '${ApiConfig.storyThumnailImage}${home.newStoryList[index -1].storys![0].image}',
                                                                    height: 55,
                                                                    width: 55,
                                                                    fit: BoxFit.cover,
                                                                    placeholder: (context, url) => SvgPicture.asset(
                                                                      AllImages.userPlaceholder,
                                                                      fit: BoxFit.cover,
                                                                      height: 55,
                                                                      width: 55,),
                                                                    errorWidget: (context, url, error) => SvgPicture.asset(AllImages.userPlaceholder,
                                                                      fit: BoxFit.cover,  height: 55,
                                                                      width: 55,),
                                                                  )) : ClipRRect(
                                                                borderRadius: BorderRadius.circular(50),
                                                                child: CachedNetworkImage(
                                                                  imageUrl: '${ApiConfig.storyVideo}${home.newStoryList[index -1].storys![0].thumbnail}',
                                                                  height: 55,
                                                                  width: 55,
                                                                  fit: BoxFit.cover,
                                                                  placeholder: (context, url) => SvgPicture.asset(AllImages.homePlaceholder,fit: BoxFit.cover,  height: 55,
                                                                    width: 55,),
                                                                  errorWidget: (context, url, error) => SvgPicture.asset(AllImages.homePlaceholder,fit: BoxFit.cover,  height: 55,
                                                                    width: 55,),
                                                                ),
                                                              )
                                                                  : const SizedBox(),
                                                            ],
                                                          ),


                                                          const SizedBox(height: 12),
                                                          /// for name
                                                          home.newStoryList[index -1].userId !=null ? Get.find<AuthController>().getUserId() == home.newStoryList[index -1].userId ?
                                                          Text(home.isAdding ? "Adding story..." : _userName, style: interRegular.copyWith(color:  ColorResources.getTextColor(context), overflow: TextOverflow.ellipsis, fontSize: Dimensions.fontSizeSmall), maxLines: 2,)
                                                              : Text(_userName, style: interRegular.copyWith(color:  ColorResources.getTextColor(context), overflow: TextOverflow.ellipsis, fontSize: Dimensions.fontSizeSmall), maxLines: 2,) : const SizedBox(),

                                                        ],
                                                      ),
                                                    ),
                                                  );*/
                                      return SizedBox();
                                    },
                                  ),
                                ),
                                Divider(color: ColorResources.COLOR_GREY.withOpacity(0.3),),
                                const SizedBox(height: Dimensions.paddingSizeDefault),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                                  _itemRow(name: 'Lives', image: AllImages.lives, onTap: ()=> debugPrint('Live')),
                                  _itemRow(name : 'Images', image: AllImages.imageNew, onTap: ()=> debugPrint('Images')),
                                  _itemRow(name: 'Community', image: AllImages.community, onTap: ()=> debugPrint('Community')),
                                  _itemRow(name: 'Donation', image: AllImages.donationPng, onTap: ()=> debugPrint('Donation')),
                                ],),
                                const SizedBox(height: Dimensions.paddingSizeDefault),
                                Divider(color: ColorResources.COLOR_GREY.withOpacity(0.3),),

                                ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                  itemBuilder: (context, index) {
                                    return PostView(index: index,);
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appMenu({Widget? icon, VoidCallback? onTap}){
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: onTap,
        child: icon
    );
  }

  _itemRow({required String name, required String image, required VoidCallback onTap}){
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      child: Column(children: [
        Image.asset(image, height: 32, width: 32,),
        const SizedBox(height: Dimensions.fontSizeOverExtraSmall,),
        Text(name, style: interMedium.copyWith(color: ColorResources.getTextColor(context), fontSize: Dimensions.fontSizeSmall),),
      ],),
    );
  }

  _suggestTile({String? header, String? trailing, required VoidCallback onTap}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row( crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(header ?? '', style: interMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.getTextColor(context)),),
          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: onTap,
              child: Text(trailing ?? '', style: interMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: ColorResources.getPrimaryColor(context)),)),
        ],
      ),
    );
  }
}


class PaintTriangle extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor;

  final double borderThickness;

  PaintTriangle(
      {required this.backgroundColor,
        required this.borderColor,
        this.borderThickness = 4.0});

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height;
    final x = size.width;

    final paint = Paint()..color = backgroundColor;
    final path = Path()
      ..moveTo(0, y)
      ..lineTo((x / 2), (y / y))
      ..lineTo(x, y)
      ..lineTo(0, y); //little modification to draw bottom

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderThickness;
    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class StoryListModel{
  int? id;
  String? profile;
  String? name;
  String? content;
  StoryListModel(this.id, this.profile, this.name, this.content);
}