import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  final IconData? icon ;

  final String? image, svgSrc;
  final List<CategoryModel>? subCategories;

  CategoryModel({
    required this.title,
    this.image,
    this.icon,
    this.svgSrc,
    this.subCategories,
  });
}

final List<CategoryModel> demoCategoriesWithImage = [
  CategoryModel(title: "Woman’s", image: "https://i.imgur.com/5M89G2P.png"),
  CategoryModel(title: "Man’s", image: "https://i.imgur.com/UM3GdWg.png"),
  CategoryModel(title: "Kid’s", image: "https://i.imgur.com/Lp0D6k5.png"),
  CategoryModel(title: "Accessories", image: "https://i.imgur.com/3mSE5sN.png"),
];



final List<CategoryModel> demoCategories = [
  CategoryModel(
    title: "Agriculture Parts & Seeds",
    svgSrc: "assets/icons/Agriculture.svg",
    icon: Icons.grain,
    subCategories: [
      CategoryModel(title: "Animal Feed"),
      CategoryModel(title: "Compost"),
      CategoryModel(title: "Crop Protection"),
      CategoryModel(title: "Farming Tools"),
      CategoryModel(title: "Fertilizers"),
      CategoryModel(title: "Greenhouse Equipment"),
      CategoryModel(title: "Irrigation Equipment"),
      CategoryModel(title: "Livestock"),
      CategoryModel(title: "Organic Farming"),
      CategoryModel(title: "Plant Nutrition"),
      CategoryModel(title: "Pesticides"),
      CategoryModel(title: "Seeds"),
      CategoryModel(title: "Soil Testing Kits"),
      CategoryModel(title: "Tractors & Machinery"),
      CategoryModel(title: "Farm Safety Gear"),
    ],
  ),

  CategoryModel(
    title: "Books Stationery & Sports",
    icon: Icons.book,
    svgSrc: "assets/icons/BooksStationery.svg",
    subCategories: [
      CategoryModel(title: "Art Supplies"),
      CategoryModel(title: "Board Games"),
      CategoryModel(title: "Books"),
      CategoryModel(title: "Calendars & Planners"),
      CategoryModel(title: "Craft Materials"),
      CategoryModel(title: "E-books"),
      CategoryModel(title: "Fitness Gear"),
      CategoryModel(title: "Gaming Accessories"),
      CategoryModel(title: "Musical Instruments"),
      CategoryModel(title: "Notebooks"),
      CategoryModel(title: "Office Supplies"),
      CategoryModel(title: "Pens & Pencils"),
      CategoryModel(title: "School Supplies"),
      CategoryModel(title: "Sports Equipment"),
      CategoryModel(title: "Writing Pads"),
    ],
  ),

  CategoryModel(
    title: "Car Auto Bike Parts & Lubricant",
    svgSrc: "assets/icons/CarAutoBike.svg",
    icon: Icons.directions_car,
    subCategories: [
      CategoryModel(title: "Air Filters"),
      CategoryModel(title: "Battery & Charging"),
      CategoryModel(title: "Brakes & Discs"),
      CategoryModel(title: "Clutch & Transmission"),
      CategoryModel(title: "Engine Parts"),
      CategoryModel(title: "Exhaust Systems"),
      CategoryModel(title: "Fuel System"),
      CategoryModel(title: "Helmet & Riding Gear"),
      CategoryModel(title: "Lights & Indicators"),
      CategoryModel(title: "Lubricants & Fluids"),
      CategoryModel(title: "Mirrors & Accessories"),
      CategoryModel(title: "Spark Plugs & Ignition"),
      CategoryModel(title: "Suspension & Steering"),
      CategoryModel(title: "Tyres & Tubes"),
      CategoryModel(title: "Wheels & Rims"),
    ],
  ),
  CategoryModel(
    title: "Decoration Furniture & Building",
    icon: Icons.chair_rounded,
    svgSrc: "assets/icons/DecorationFurniture.svg", // Add the appropriate SVG path
    subCategories: [
      CategoryModel(title: "Furniture"),
      CategoryModel(title: "Home Decor"),
      CategoryModel(title: "Lighting Fixtures"),
      CategoryModel(title: "Wall Art"),
      CategoryModel(title: "Rugs & Carpets"),
      CategoryModel(title: "Curtains & Blinds"),
      CategoryModel(title: "Outdoor Decor"),
      CategoryModel(title: "Shelving & Storage"),
      CategoryModel(title: "Building Materials"),
      CategoryModel(title: "Paint & Wallpaper"),
    ],
  ),
  CategoryModel(
    title: "Electronic Mobile TV Technology",
    icon: Icons.electrical_services,
    svgSrc: "assets/icons/Electronics.svg",
    subCategories: [
      CategoryModel(title: "Cameras & Photography"),
      CategoryModel(title: "Chargers & Cables"),
      CategoryModel(title: "Drones"),
      CategoryModel(title: "Gaming Consoles"),
      CategoryModel(title: "Headphones & Earphones"),
      CategoryModel(title: "Home Audio Systems"),
      CategoryModel(title: "Laptops & Computers"),
      CategoryModel(title: "Mobile Phones"),
      CategoryModel(title: "Power Banks"),
      CategoryModel(title: "Printers & Scanners"),
      CategoryModel(title: "Smart Home Devices"),
      CategoryModel(title: "Smartwatches & Wearables"),
      CategoryModel(title: "Storage Devices"),
      CategoryModel(title: "Tablets & Accessories"),
      CategoryModel(title: "Television & Home Entertainment"),
    ],
  ),

  CategoryModel(
    title: "Fashion Garments & Footwear",
    icon: Icons.checkroom,
    svgSrc: "assets/icons/Fashion.svg",
    subCategories: [
      CategoryModel(title: "Belts"),
      CategoryModel(title: "Ethnic Wear"),
      CategoryModel(title: "Footwear"),
      CategoryModel(title: "Handbags & Wallets"),
      CategoryModel(title: "Hats & Caps"),
      CategoryModel(title: "Innerwear"),
      CategoryModel(title: "Jewelry"),
      CategoryModel(title: "Kids' Clothing"),
      CategoryModel(title: "Men's Clothing"),
      CategoryModel(title: "Scarves & Ties"),
      CategoryModel(title: "Sportswear"),
      CategoryModel(title: "Sunglasses"),
      CategoryModel(title: "Watches & Accessories"),
      CategoryModel(title: "Winter Wear"),
      CategoryModel(title: "Women's Clothing"),
    ],
  ),

  CategoryModel(
    title: "Grocery Food Fruit & Vegetable",
    icon: Icons.local_grocery_store,
    svgSrc: "assets/icons/Grocery.svg",
    subCategories: [
      CategoryModel(title: "Bakery Products"),
      CategoryModel(title: "Breakfast Cereals"),
      CategoryModel(title: "Canned Goods"),
      CategoryModel(title: "Dairy Products"),
      CategoryModel(title: "Dry Fruits & Nuts"),
      CategoryModel(title: "Fruits"),
      CategoryModel(title: "Frozen Foods"),
      CategoryModel(title: "Grains & Pulses"),
      CategoryModel(title: "Meat & Poultry"),
      CategoryModel(title: "Oils & Ghee"),
      CategoryModel(title: "Organic Produce"),
      CategoryModel(title: "Seafood"),
      CategoryModel(title: "Snacks & Beverages"),
      CategoryModel(title: "Spices & Condiments"),
      CategoryModel(title: "Fresh Vegetables"),
    ],
  ),

  CategoryModel(
    title: "Health & Beauty Cosmetics",
    icon: Icons.health_and_safety,
    svgSrc: "assets/icons/HealthBeauty.svg",
    subCategories: [
      CategoryModel(title: "Anti-aging Products"),
      CategoryModel(title: "Bath & Shower"),
      CategoryModel(title: "Beauty Tools"),
      CategoryModel(title: "Essential Oils"),
      CategoryModel(title: "Fragrances"),
      CategoryModel(title: "Hair Color"),
      CategoryModel(title: "Haircare"),
      CategoryModel(title: "Makeup"),
      CategoryModel(title: "Men's Grooming"),
      CategoryModel(title: "Nail Care"),
      CategoryModel(title: "Oral Care"),
      CategoryModel(title: "Personal Hygiene"),
      CategoryModel(title: "Skincare"),
      CategoryModel(title: "Spa & Wellness"),
      CategoryModel(title: "Sun Care"),
    ],
  ),

  CategoryModel(
    title: "Home Garden & Kitchen",
    icon: Icons.kitchen,
    svgSrc: "assets/icons/HomeGardenKitchen.svg",
    subCategories: [
      CategoryModel(title: "Bedding & Linens"),
      CategoryModel(title: "Bathroom Accessories"),
      CategoryModel(title: "Cookers & Ovens"),
      CategoryModel(title: "Cookware & Bakeware"),
      CategoryModel(title: "Cutlery & Utensils"),
      CategoryModel(title: "Decor Items"),
      CategoryModel(title: "Furniture"),
      CategoryModel(title: "Gardening Tools"),
      CategoryModel(title: "Home Cleaning"),
      CategoryModel(title: "Home Security Systems"),
      CategoryModel(title: "Kitchen Appliances"),
      CategoryModel(title: "Lighting"),
      CategoryModel(title: "Outdoor Furniture"),
      CategoryModel(title: "Storage Solutions"),
      CategoryModel(title: "Water Purifiers"),
    ],
  ),
];





