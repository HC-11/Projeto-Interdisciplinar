<!DOCTYPE html>
<!-- cadastro.php 
     lista os produtos cadastrados -->
<html>
	<head>
	  <title>Cadastro de produto</title>
	  <meta charset="utf-8">
	</head>
	<body>

	<?php //cadastro.php
// lista p cadastrados  

  include_once "conectabd.inc.php";

  echo "<h1>Produtos Cadastrados</h1>";
  
  // lista produtos já cadastrados
  $query = "SELECT PK_cod_produto, Nome_produto FROM tb_produto;";
  if ($result = mysqli_query($link, $query)) {
	  echo "<table border='1'>";
	  echo '<tr><th>id</th><th>produto</th></tr>';
	  // busca os dados lidos do banco de dados
	  while ($row = mysqli_fetch_assoc($result)) {
		  $id = $row["PK_cod_produto"];
		  $nome = $row["Nome_produto"];
                        
		  echo "<tr>";
		  echo "<td>" . $id . "</td>";
		  echo "<td>" . $nome . "</td>";
		  // cria link para EXCLUSAO do respectivo PK_cod_produto
		  echo '<td><a href="exclusao.php?id='. $row["PK_cod_produto"] . '">Excluir</a></td>';
		  // cria link para ALTERACAO do respectivo PK_cod_produto
		  echo '<td><a href="form_alteracao.php?id='. $row["PK_cod_produto"] . '&curso='.urlencode($nome).'">Alterar</a></td>';
		  
		  echo "</tr>";
		  
	  }
	  echo "</table>";
	  // libera a área de memória onde está o resultado
	  mysqli_free_result($result);
  }
  // fecha a conexão
  mysqli_close($link);
?>  
	<br>
	<a href="cadastro_produto.html">Cadastrar novo produto</a>
	</body>
</html>
