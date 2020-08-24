<!DOCTYPE html>
<!-- cadastro.html -->
<html>
	<head>
	  <title>Cadastro de produto - Exclusão</title>
	  <meta charset="utf-8">
	</head>
	<body><?php //exclusao.php
// efetua a exclusão do produto cujo id seja informado.
  $id = $_GET["id"];
  
  include_once "conectabd.inc.php";

  $query = "delete from tb_produto where Nome_produto=$id;";
  if ($result = mysqli_query($link, $query)) {
	  echo "Produto removido com sucesso";
  }
  
  // fecha a conexão
  mysqli_close($link);
  
 ?>  
 <br>
 <a href="cadastro.php">Ver produtos cadastrados</a>
 
 </body>
</html>
