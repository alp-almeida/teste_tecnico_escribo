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
  int res10 = contarMultiplosDe3e5(10);
  print("Entrada 10 , Saída $res10");
  int res11 = contarMultiplosDe3e5(11);
  print("Entrada 11 , Saída $res11");
}
