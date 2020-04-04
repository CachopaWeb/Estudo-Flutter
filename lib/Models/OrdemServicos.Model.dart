class OrdemServicos{
  int codigo;
  String programador;
  String ocorrencia;
  String data;
  String laudoProgramacao;
  String cliNome;
  
  OrdemServicos({this.codigo, this.programador, this.ocorrencia, this.data, this.laudoProgramacao, this.cliNome});

  factory OrdemServicos.fromJson(Map<String, dynamic> json) {
    return OrdemServicos(
      codigo: json['codigo'] as int,
      programador: json['programador'] as String,
      ocorrencia: json['ocorrencia'] as String,
       data: json['data'] as String,
       laudoProgramacao: json['laudo_programacao'] as String,
       cliNome: json['cli_nome'] as String
    );
  }
}