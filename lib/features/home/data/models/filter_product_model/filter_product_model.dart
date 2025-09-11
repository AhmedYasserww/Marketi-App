class FilterProductsRequest {
  final int limit;
  final String? search;
  final String? brand;
  final String? category;
  final String? rating;
  final String? price;
  final String discount;
  final bool? popular;

  FilterProductsRequest({
    this.limit = 20,
    this.search,
    this.brand,
    this.category,
    this.rating,
    this.price,
    this.discount = "down",
    this.popular,
  });

  Map<String, dynamic> toJson() {
    return {
      "limit": limit,
      "search": search,
      "brand": brand,
      "category": category,
      "rating": rating,
      "price": price,
      "discount": discount,
      "popular": popular,
    };
  }
}
