import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_feed/util/color_resources.dart';
import 'package:social_feed/util/dimensions.dart';
import 'package:social_feed/util/images.dart';
import 'package:social_feed/util/styles.dart';
import 'package:social_feed/view/comment/comment_screen.dart';
import 'package:social_feed/widgets/custom_toast.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:video_box/video_box.dart';

enum PostType {
  text,
  image,
  audio,
  video,
}

class PostView extends StatefulWidget {
  final int index;
  const PostView({Key? key, required this.index}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> with WidgetsBindingObserver{

  late VideoController vc;
  bool isMusicOn = false;

  String userName = 'Md Kabir Hossain';

  final List<String> _imageList = [AllImages.image1,AllImages.image2,AllImages.image3,AllImages.image4,AllImages.image5,];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    vc = VideoController(
      source: VideoPlayerController.network('https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
    )..initialize();
    super.initState();

  }




  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    vc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          children: [
            _profileView(),

            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 8),
              child: ExpandableText(
                'In publishing and graphic design, Md Kabir Hossain Lorem ipsum is a #placeholder text @Imran Kabir commonly used to #demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.',
                expandText: 'show more',
                expandOnTextTap: true,
                expanded: true,
                maxLines: 2,
                linkColor: ColorResources.getGreyColor(context),
                animation: true,
                collapseOnTextTap: true,
                prefixText: 'Md Kabir Hossain',
                onPrefixTap: () => showCustomToast('Click Md Kabir Hossain'),
                prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
                onHashtagTap: (name) => showCustomToast(name),
                hashtagStyle: const TextStyle(
                  color: Color(0xFF30B6F9),
                ),
                onMentionTap: (userName) => showCustomToast('Click $userName'),
                mentionStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
               // onUrlTap: (url) => launchUrl(Uri.parse(url)),
                urlStyle: const TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),


            if(widget.index.isEven)...[
              StaggeredGridView.countBuilder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 6,
                itemCount: _imageList.length > 5 ? 5 : _imageList.length,
                itemBuilder: (context, idx) => InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: (){},
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          // image: DecorationImage(image: AssetImage(widget.postModel.images![index].fileUrl!), fit: BoxFit.cover, filterQuality: FilterQuality.high)
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.asset(_imageList[idx], height: double.infinity, width: double.infinity, fit: BoxFit.cover,)
                        ),
                      ),
                      idx >= 4 ? Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: _imageList.length - 5 != 0 ? ColorResources.colorBlack.withOpacity(0.4) : Colors.transparent,
                          ),
                          child: Text( _imageList.length - 5 != 0 ? '${_imageList.length - 5}+' : '', style: interBold.copyWith(color: Theme.of(context).cardColor)),
                        ),
                      ) : const SizedBox()
                    ],
                  ),
                ),
                staggeredTileBuilder: (index) => StaggeredTile.count(
                    _imageList.length == 1 ? 7 : _imageList.length == 3 ? 2 :  _imageList.length > 4 ? index == 0 || index == 1 ? 3 : 2 : 3 ,
                    _imageList.length == 1 ? 7 : _imageList.length == 3 ? 2 : 3),
              )
            ]else...[
              Stack( alignment: Alignment.center,
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: vc.videoCtrl.value.aspectRatio,
                      child: VideoBox(controller: vc),
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 9),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
              Row(
                children: [
                  Stack( clipBehavior: Clip.none,
                    children: [
                      Image.asset(AllImages.likeNew, height: 20, width: 20),
                      Positioned(left: 15,child: Image.asset(AllImages.lovePng, height: 20, width: 20)),
                      Positioned(left: 30,child: Image.asset(AllImages.haha, height: 20, width: 20)),
                    ],
                  ),
                  const SizedBox(width: 35,),
                  Text('1.5k', style: interRegular.copyWith(color: ColorResources.colorSecondary, fontSize: Dimensions.fontSizeSmall),),
                ],
              ),
              Text('1.1k Comment', style: interRegular.copyWith(color: ColorResources.colorSecondary, fontSize: Dimensions.fontSizeSmall),),
              Text('500 Repost', style: interRegular.copyWith(color: ColorResources.colorSecondary, fontSize: Dimensions.fontSizeSmall),),
              Text('5.3k views', style: interRegular.copyWith(color: ColorResources.colorSecondary, fontSize: Dimensions.fontSizeSmall),),
            ],),
            Divider(indent: 20,color: ColorResources.COLOR_GREY.withOpacity(0.3), endIndent: 20,),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReactionButton<String>(
                    onReactionChanged: (reaction) {
                      debugPrint('Selected value: $reaction');
                    },
                    reactions: reactions,
                    boxReactionSpacing: 6,
                    boxPadding: const EdgeInsets.fromLTRB(4, 0, 4, 6),
                  ),
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return const PostCommentBottomSheet();
                        },
                      );
                    },
                    child: Row(
                      children: [
                       SvgPicture.asset(AllImages.chatDots, height: 24,width: 24,),
                        const SizedBox(width: 5),
                        Text('Comment', style: interRegular.copyWith(color: ColorResources.colorSecondary, fontSize: Dimensions.fontSizeSmall),),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: ()=> Share.share("https://www.facebook.com/"),
                    child: Row(
                      children: [
                        SvgPicture.asset(AllImages.sharePost, height: 24,width: 24,),
                        const SizedBox(width: 5),
                        Text('Send', style: interRegular.copyWith(color: ColorResources.colorSecondary, fontSize: Dimensions.fontSizeSmall),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           /* Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
              ReactionButton<String>(
                onReactionChanged: (reaction) {
                  debugPrint('Selected value: ${reaction}');
                },
                reactions: reactions,
              ),
              _bottomBar(name: 'React', image: AllImages.heart, onTap: ()=> Get.to(MyAppScreen())),
              _bottomBar(name : 'Comment', image: AllImages.chatDots, onTap: ()=> debugPrint('Images')),
              _bottomBar(name: 'Repost', image: AllImages.repost, onTap: ()=> debugPrint('Community')),
              _bottomBar(name: 'Send', image: AllImages.sharePost, onTap: ()=> debugPrint('Donation')),
            ],),*/
            const SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }




  _profileView(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(AllImages.Rectangle3),
          ),
          const SizedBox(width: 8,),

          Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text('Darlene Robertson', style: interMedium.copyWith(color: ColorResources.getTextColor(context), fontSize: Dimensions.fontSizeLarge),),
            Text('9m', style: interRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: ColorResources.getGreyColor(context)),),
          ],)),

          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: (){},
              child: Image.asset(AllImages.threeDotPng, height: 24, width: 24))
        ],
      ),
    );
  }

  _bottomBar({required String name, required String image, required VoidCallback onTap}){
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      onTap: onTap,
      child: Column(children: [
        SvgPicture.asset(image, height: 32, width: 32,),
        const SizedBox(height: Dimensions.fontSizeOverExtraSmall,),
        Text(name, style: interRegular.copyWith(color: ColorResources.colorSecondary, fontSize: Dimensions.fontSizeSmall),),
      ],),
    );
  }
}




final List<Reaction<String>> reactions = [
  Reaction<String>(
    value: 'Like',
    title: _buildEmojiTitle(
      'Like',
    ),
    previewIcon: _buildEmojiPreviewIcon(
      AllImages.likeNew,
    ),
    icon: _buildReactionsIcon(
      AllImages.likeNew,
      const Text(
        'Like',
        style: TextStyle(
          color: Color(0XFF3b5998),
        ),
      ),
    ),
  ),
  Reaction<String>(
    value: 'Love',
    title: _buildEmojiTitle(
      'Love',
    ),
    previewIcon: _buildEmojiPreviewIcon(
      AllImages.lovePng,
    ),
    icon: _buildReactionsIcon(
      AllImages.lovePng,
      const Text(
        'Love',
        style: TextStyle(
          color: Color(0XFF3b5998),
        ),
      ),
    ),
  ),
  Reaction<String>(
    value: 'Haha',
    title: _buildEmojiTitle(
      'Haha',
    ),
    previewIcon: _buildEmojiPreviewIcon(
      AllImages.haha,
    ),
    icon: _buildReactionsIcon(
      AllImages.haha,
      const Text(
        'Haha',
        style: TextStyle(
          color: Color(0XFFed5168),
        ),
      ),
    ),
  ),
  Reaction<String>(
    value: 'Sad',
    title: _buildEmojiTitle(
      'Sad',
    ),
    previewIcon: _buildEmojiPreviewIcon(
      AllImages.sad,
    ),
    icon: _buildReactionsIcon(
      AllImages.sad,
      const Text(
        'Sad',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
  Reaction<String>(
    value: 'Wow',
    title: _buildEmojiTitle(
      'Wow',
    ),
    previewIcon: _buildEmojiPreviewIcon(
      AllImages.wow,
    ),
    icon: _buildReactionsIcon(
      AllImages.wow,
      const Text(
        'Wow',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
  Reaction<String>(
    value: 'Angry',
    title: _buildEmojiTitle(
      'Angry',
    ),
    previewIcon: _buildEmojiPreviewIcon(
      AllImages.angry,
    ),
    icon: _buildReactionsIcon(
      AllImages.angry,
      const Text(
        'Angry',
        style: TextStyle(
          color: Color(0XFFffda6b),
        ),
      ),
    ),
  ),
];

Widget _buildEmojiTitle(String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(.75),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 8,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buildEmojiPreviewIcon(String path) {
  return Image.asset(path, height: 40, width: 40,);
}

Widget _buildReactionsIcon(String path, Text text) {
  return Container(
    color: Colors.transparent,
    child: Row(
      children: <Widget>[
        Image.asset(path, height: 24, width: 24,),
        const SizedBox(width: 5),
        text,
      ],
    ),
  );
}