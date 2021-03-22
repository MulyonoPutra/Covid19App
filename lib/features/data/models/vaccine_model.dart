class VaccineTargetModel {
  int totalsasaran;
  int sasaranvaksinsdmk;
  int sasaranvaksinlansia;
  int sasaranvaksinpetugaspublik;
  int vaksinasi1;
  int vaksinasi2;
  String lastUpdate;

  VaccineTargetModel(
      {this.totalsasaran,
      this.sasaranvaksinsdmk,
      this.sasaranvaksinlansia,
      this.sasaranvaksinpetugaspublik,
      this.vaksinasi1,
      this.vaksinasi2,
      this.lastUpdate});

  VaccineTargetModel.fromJson(Map<String, dynamic> json) {
    totalsasaran = json['totalsasaran'];
    sasaranvaksinsdmk = json['sasaranvaksinsdmk'];
    sasaranvaksinlansia = json['sasaranvaksinlansia'];
    sasaranvaksinpetugaspublik = json['sasaranvaksinpetugaspublik'];
    vaksinasi1 = json['vaksinasi1'];
    vaksinasi2 = json['vaksinasi2'];
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalsasaran'] = this.totalsasaran;
    data['sasaranvaksinsdmk'] = this.sasaranvaksinsdmk;
    data['sasaranvaksinlansia'] = this.sasaranvaksinlansia;
    data['sasaranvaksinpetugaspublik'] = this.sasaranvaksinpetugaspublik;
    data['vaksinasi1'] = this.vaksinasi1;
    data['vaksinasi2'] = this.vaksinasi2;
    data['lastUpdate'] = this.lastUpdate;
    return data;
  }
}