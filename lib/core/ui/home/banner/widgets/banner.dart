import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nop_station_api/core/providers.dart';


class BannerWidget extends ConsumerWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banners = ref.watch(bannerProvider);
  // Keep for debugging
    return banners.when(
      data: (data) => SizedBox(
        height: 300,
        child: data.isEmpty
            ? Center(child: Text('No banners available'))
            : Row(
                children: [
                  CarouselSlider.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index, realIndex) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: data[index].imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      viewportFraction: 0.90,
                      reverse: false, // Ensures left-to-right sliding
                      onPageChanged: (index, reason) {
                        ref.read(_carouselIndexProvider.notifier).state = index;
                      },
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      data.length,
                      (index) => Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == ref.watch(_carouselIndexProvider)
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}

final _carouselIndexProvider = StateProvider<int>((ref) => 0);