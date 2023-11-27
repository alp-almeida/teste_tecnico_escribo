
bool ehDivisivel(int num, int divisor){
  return num%divisor == 0;
}


int contarMultiplosDe3e5(int entrada){
  if(entrada <=0 ) return 0;
  int retorno = 0;
  for (int j = 1; j < entrada; j++){
    if(ehDivisivel(j, 3) || ehDivisivel(j,5)) retorno += j;
  }
  return retorno;
}

void main() {
  var res10 = contarMultiplosDe3e5(10);
  print("Teste com 10 $res10");
  var res11 = contarMultiplosDe3e5(11);
  print("Teste com 11 $res11");
}
