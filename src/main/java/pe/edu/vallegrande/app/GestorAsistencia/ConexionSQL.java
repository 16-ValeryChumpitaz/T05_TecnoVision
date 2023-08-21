package pe.edu.vallegrande.app.GestorAsistencia;

import java.sql.Connection;

import pe.edu.vallegrande.app.db.AccesoDB;

public class ConexionSQL {
	
	public static void main(String[] args) {
		try {
			Connection cn = AccesoDB.getConnection();
			System.out.println("Conectado a SQL con exito.");
			cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
