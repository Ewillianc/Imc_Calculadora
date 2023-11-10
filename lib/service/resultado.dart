class Situacao {
  String situacao(imc) {
    String resultado;

    if (imc < 16.0) {
      resultado = 'Magreza extrema';
    } else if (imc < 17.0) {
      resultado = 'Magreza grave';
    } else if (imc < 18.5) {
      resultado = 'Magreza moderada';
    } else if (imc < 25.0) {
      resultado = 'Peso normal';
    } else if (imc < 30.0) {
      resultado = 'Sobrepeso';
    } else if (imc < 35.0) {
      resultado = 'Obesidade grau I';
    } else if (imc < 40.0) {
      resultado = 'Obesidade grau II';
    } else if (imc <= 40.0) {
      resultado = 'Obesidade grau III';
    } else {
      resultado = 'ERRO DE CALCULO';
    }
    return resultado;
  }
}
