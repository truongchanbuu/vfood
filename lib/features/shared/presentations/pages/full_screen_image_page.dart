import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../../cores/constants/colors.dart';
import '../widgets/error_image.dart';

class FullScreenImagePage extends StatefulWidget {
  final String collectionId;
  final List<String> imageUrls;
  final int initialPage;

  const FullScreenImagePage({
    super.key,
    this.collectionId = '',
    required this.imageUrls,
    this.initialPage = 0,
  });

  @override
  State<FullScreenImagePage> createState() => _FullScreenImagePageState();
}

class _FullScreenImagePageState extends State<FullScreenImagePage> {
  late int _currentIndex;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            _buildPhotoGallery(),
            Align(
              alignment: Alignment.bottomCenter,
              child: _buildImageIndicator(),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      title: Text(
        '${_currentIndex + 1} / ${widget.imageUrls.length}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  static const double imageIndicatorHeight = 100;
  Widget _buildImageIndicator() {
    return SizedBox(
      height: imageIndicatorHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => _pageController.jumpToPage(index),
          child: Container(
            width: imageIndicatorHeight,
            height: imageIndicatorHeight,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                color: _currentIndex == index
                    ? AppColors.primary
                    : Colors.transparent,
                width: 5,
              ),
            ),
            child: CachedNetworkImage(
              height: imageIndicatorHeight,
              imageUrl: widget.imageUrls[index],
              cacheKey: widget.collectionId,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const ErrorImage(
                width: double.infinity,
                height: imageIndicatorHeight,
              ),
              placeholder: (context, url) =>
                  const CircularProgressIndicator(color: AppColors.primary),
            ),
          ),
        ),
      ),
    );
  }

  static const double scaleRatio = 2;
  Widget _buildPhotoGallery() => PhotoViewGallery.builder(
        onPageChanged: (index) => setState(() => _currentIndex = index),
        pageController: _pageController,
        itemCount: widget.imageUrls.length,
        builder: (context, index) => PhotoViewGalleryPageOptions.customChild(
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: widget.imageUrls[index],
            cacheKey: widget.collectionId,
            placeholder: (context, url) =>
                const CircularProgressIndicator(color: AppColors.primary),
            errorWidget: (context, url, error) => ErrorImage(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 8,
            ),
          ),
          heroAttributes: PhotoViewHeroAttributes(
              tag: '${widget.collectionId}-${widget.imageUrls[index]}-$index'),
          initialScale: PhotoViewComputedScale.contained,
          minScale: PhotoViewComputedScale.contained / scaleRatio,
          maxScale: PhotoViewComputedScale.covered * scaleRatio,
          basePosition: Alignment.center,
        ),
      );
}
