import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nop_station_api/core/providers.dart';

final _carouselIndexProvider = StateProvider<int>((ref) => 0);

class BannerWidget extends ConsumerWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banners = ref.watch(bannerProvider);

    return banners.when(
      data: (data) => SizedBox(
        height: 300,
        width: double.infinity,
        child: data.isEmpty
            ? Center(child: Text('No banners available'))
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  CarouselSlider.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index, realIndex) => Padding(
                      key: Key(data[index].id.toString()),
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          imageUrl: data[index].imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      viewportFraction: 0.90,
                      onPageChanged: (index, reason) {
                        ref.read(_carouselIndexProvider.notifier).state = index;
                      },
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      data.length,
                      (index) => Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}
