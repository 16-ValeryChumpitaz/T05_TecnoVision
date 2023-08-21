<%@ page language="java" contentType="text/csv; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<%
    // Establecer la conexión con la base de datos
    String url = "jdbc:sqlserver://localhost:1433;databaseName=To5_TecnoVision;encrypt=true;TrustServerCertificate=True;";
    String username = "sa";
    String password = "FABIO123456";
    Connection con = null;

    try {
        // Establecer la conexión
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection(url, username, password);

        // Consulta SQL para obtener los registros ordenados
        String query = "SELECT id, name, last_name, type_document, number_document, cellphone, grade, parents_id, State FROM student ORDER BY name";

        // Crear el statement y ejecutar la consulta
        Statement statement = con.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        // Generar el contenido del documento CSV
        StringBuilder csvContent = new StringBuilder();
        csvContent.append("ID,Nombre,Apellido,Tipo de Documento,Numero de Documento,Telefono Celular,Grado,Padres ID,Estado\n");

        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String last_name = resultSet.getString("last_name");
            String type_document = resultSet.getString("type_document");
            String number_document = resultSet.getString("number_document");
            String cellphone = resultSet.getString("cellphone");
            String grade = resultSet.getString("grade");
            int parents_id = resultSet.getInt("parents_id");
            String state = resultSet.getString("State");

            csvContent.append(id).append(",")
                    .append(name).append(",")
                    .append(last_name).append(",")
                    .append(type_document).append(",")
                    .append(number_document).append(",")
                    .append(cellphone).append(",")
                    .append(grade).append(",")
                    .append(parents_id).append(",")
                    .append(state).append("\n");
        }

        // Configurar la respuesta HTTP para la descarga del archivo CSV
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=student.csv");

        // Escribir el contenido del documento CSV en el flujo de salida de la respuesta
        response.getWriter().write(csvContent.toString());
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Cerrar la conexión
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>