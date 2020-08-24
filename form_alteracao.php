
<!DOCTYPE html>
<!-- form_alteracao.html -->
<?php
 $id = $_GET["id"];
 //$curso = urldecode($_GET["curso"]);
 
  include_once "conectabd.inc.php";

  echo "<h1>Produtos Cadastrados</h1>";
  
  // nome do produto cadastrado - código adaptado do 
  // programa cadastro.php
  //
  $query = "SELECT Nome_produto    
            FROM tb_produto 
			where id_curso = $id;";
  if ($result = mysqli_query($link, $query)) {
	  // busca os dados lidos do banco de dados
	  while ($row = mysqli_fetch_assoc($result)) {
		  $nome = $row["Nome_produto"];
		 
	  }
  }

 
 
 
 
?>

<html>
	<head>
	  <title>Cadastro de produto</title>
	  <meta charset="utf-8">
	</head>
	<body>
		<h1>Atualizar produto</h1>
		<form action="alteracao.php" 
		      method="GET">
			  
			<input type="hidden" 
			       name="id" 
			       value="<?php echo $id;?>">
			<label for="Nome_produto">
			Curso:
			</label>
			<input type="text" 
			       name="produto" 
			       id="Nome produto" 
				   value="<?php echo $produto;?>">
			<br>
			
			<input type="submit" value="Ok">
		</form>
	</body>
</html>

