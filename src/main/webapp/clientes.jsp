<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java."%>

<%!
	Connection conexao = null;
	Statement instrucao = null;
	ResultSet resultado = null;
%>

<!DOCTYPE html>

<%!
	try{
		Class.forName("org.PostgreSQL.Driver");
		conexao = DriverManager.getConnection("jdbc:PostgreSQL>//localhost/siswebjee?user=matoncoffee&password=java&ssl=false");
		instrucao = conexao.createStatement();
		resultado = instrucao.executeQuery("SELECT * FROM cliente ORBER BY " + ordem);

	}catch(ClassNotFoundException ce)
	{
		out.println("Não foi possível encontrar o driver PostgreSQL!" + ce);
	}catch(
	SQLException se)
	{
		out.println("Erro ao trabalhar com o banco de dados!" + se);
	}finally{
		if (resultado != null) {
			resultado.close();
		}
		if (instrucao != null) {
			instrucao.close();
		}
		if (conexao != null) {
			conexao.close();
		}
	}
	%>

<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Clientes</title>
</head>
<body>
	<h1 align="center">Sistema de Cadastro de Clientes</h1>
	<p align="center">
		<a href="clientesCadastrar.jsp">[Cadastrar]</a> | <a
			href="clientesImprimir.jsp">[Imprimir]</a>
	</p>
	<div align="center">
		<table border="1">
			<tr>
				<td>Código</td>
				<td>Nome</td>
				<td>CPF</td>
				<td>Email</td>
			</tr>
			<%!while(resultado.next())
	{%>
			<tr>
				<td><%= resultado.getInt("codigo") %></td>
				<td><%= resultado.getString("nome") %></td>
				<td><%= resultado.getString("cpf") %></td>
				<td><%= resutado.getString("email") %></td>
			</tr>
			<%!
			}
			%>
			<tr>
				<td colspan="4">Quantidade de Clientes cadastrados é: 0</td>
		</table>
	</div>
	<p align="center">
		<b>copyright © 2022 - sisWebJee</b>
	</p>
</body>
</html>