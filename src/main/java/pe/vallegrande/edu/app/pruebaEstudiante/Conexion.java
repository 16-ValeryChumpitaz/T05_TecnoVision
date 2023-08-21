package pe.vallegrande.edu.app.pruebaEstudiante;

import java.sql.Connection;

import pe.edu.vallegrande.app.db.AccesoDB;

public class Conexion {

    public static void main(String[] args) {
        try {
            Connection cn = AccesoDB.getConnection();
            System.out.println("Conectado a SQL.");
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
