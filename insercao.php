<!DOCTYPE html>
<!-- inclusao.php -->
<html>
	<head>
	  <title>Cadastro de produto - Inclusão</title>
	  <meta charset="utf-8">
	</head>
	<body>
<?php 

  $nome = $_GET["produto"];
  
  include_once "conectabd.inc.php";

  $query = "INSERT INTO tb_produto 
      (Nome_produto) 
	  values ('$nome');";
  if ($result = mysqli_query($link, $query)) {
	  echo "Produto cadastrado com sucesso";
  }
  
  mysqli_close($link);
?>  
 <br>
 <a href="cadastro.php">Ver produtos cadastrados</a>
 
 </body>
</html>

