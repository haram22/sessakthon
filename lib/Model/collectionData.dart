import 'dart:ui';

import '../theme/colors.dart';

class CollectionItem {
  CollectionItem({
    required this.image,
    required this.name,
    required this.isCollected,
    required this.color,
    required this.tier,
  });

  String image;
  String name;
  bool isCollected;
  Color color;
  String tier;
}

List<CollectionItem> collection = [
  CollectionItem(
      image: "assets/collection/hetbahn.png",
      name: "햇반용기",
      isCollected: true,
      color: mainColor_green,
      tier: "Easy"),
  CollectionItem(
      image: "assets/collection/vinyl.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Easy"),
  CollectionItem(
      image: "assets/collection/pan.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Easy"),
  CollectionItem(
      image: "assets/collection/tint.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/shoes.png",
      name: "신발",
      isCollected: true,
      color: const Color(0xFFFF8328),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/hanger.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/unknown1.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Hard"),
  CollectionItem(
      image: "assets/collection/battery.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Hard"),
  CollectionItem(
      image: "assets/collection/unknown2.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Hard"),
  // ================== 구분선 ===================
  CollectionItem(
      image: "assets/collection/unknown1.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Easy"),
  CollectionItem(
      image: "assets/collection/vinyl.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Easy"),
  CollectionItem(
      image: "assets/collection/cd.png",
      name: "CD",
      isCollected: true,
      color: const Color(0xFF6764FF),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/tint.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/unknown2.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/hanger.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/unknown1.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Hard"),
  CollectionItem(
      image: "assets/collection/battery.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Hard"),
  CollectionItem(
      image: "assets/collection/unknown2.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Hard"),
  // ================== 구분선 ===================
  CollectionItem(
      image: "assets/collection/unknown1.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Easy"),
  CollectionItem(
      image: "assets/collection/vinyl.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Easy"),
  CollectionItem(
      image: "assets/collection/battery.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/tint.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/unknown2.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/hanger.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Medium"),
  CollectionItem(
      image: "assets/collection/unknown1.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Hard"),
  CollectionItem(
      image: "assets/collection/battery.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Hard"),
  CollectionItem(
      image: "assets/collection/unknown2.png",
      name: "???",
      isCollected: false,
      color: const Color(0xFF242424),
      tier: "Hard"),
];
