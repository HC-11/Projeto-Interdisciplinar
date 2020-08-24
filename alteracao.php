<!DOCTYPE html>
<!-- alteracao.php -->
<html>
	<head>
	  <title>Cadastro de produto - Alteração</title>
	  <meta charset="utf-8">
	</head>
	<body>
<?php 
// efetua alteração do produto informado em form_alteracao.php
  $id = $_GET["id"];
  $nome = $_GET["produto"];
 
  
  include_once "conectabd.inc.php";

  $query = "UPDATE tb_produto 
      SET Nome_produto = '$nome',
	  WHERE id_curso = $id;";
	  echo $query.'<br>';
  if ($result = mysqli_query($link, $query)) {
	  echo "Alteração efetuada com sucesso";
  } else {
	  echo mysqli_error($link);
  }
  
  // fecha a conexão
  mysqli_close($link);
?>  
 <br>
 <a href="cadastro.php">Ver produtos cadastrados</a>
 
 </body>
</html>

