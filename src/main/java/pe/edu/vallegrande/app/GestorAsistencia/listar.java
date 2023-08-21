package pe.edu.vallegrande.app.GestorAsistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.GestorAsistencia;
import pe.edu.vallegrande.app.service.CrudGestorAsistenciaService;

public class listar {

    public static void main(String[] args) {
        try {

            // Proceso
            CrudGestorAsistenciaService GestorAsistenciaService = new CrudGestorAsistenciaService();
            List<GestorAsistencia> lista = GestorAsistenciaService.getAll();
            System.out.println(lista);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
