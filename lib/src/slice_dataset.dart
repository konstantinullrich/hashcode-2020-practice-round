class SliceDataset {
  final int slicesMax;
  final int differentTypes;
  final List<int> pizzas;

  SliceDataset(this.slicesMax, this.differentTypes, this.pizzas);

  List<int> get indexRange {
    var range = <int>[];
    List.generate(pizzas.length, (index) => range.add(index));
    return range;
  }

  Map<String, dynamic> toMap() => {
        'slicesMax': slicesMax,
        'differentTypes': differentTypes,
        'pizzas': pizzas
      };
}
