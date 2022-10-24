
class Filtro{
   String? paramentro;
   int? pagina = 0;
   int ? itensPorPagina = 8;
   int?  totalregistro;

   @override
  String toString() {
    return 'Filtro{paramentro: $paramentro, pagina: $pagina, itensPorPagina: $itensPorPagina, totalregistro: $totalregistro}';
  }
}

