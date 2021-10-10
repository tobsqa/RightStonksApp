class Analysts {

  final String analystCount;
  final String consensusDate;
  final String marketConsensus;
  final String marketConsensusTargetPrice;

  Analysts({this.analystCount, this.consensusDate, this.marketConsensus,
    this.marketConsensusTargetPrice,});

  factory Analysts.fromJson(Map<String, dynamic> json) {
    return Analysts(
      analystCount: json['analystCount'].toString() as String,
      consensusDate: json['consensusDate'] as String,
      marketConsensus: json['marketConsensus'].toString() as String,
      marketConsensusTargetPrice: json['marketConsensusTargetPrice'].toString() as String,
    );
  }
}