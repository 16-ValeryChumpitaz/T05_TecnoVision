package pe.vallegrande.edu.app.pruebaRegistro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.GestorAsistencia.*;
import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Estudiante;
import pe.edu.vallegrande.app.service.CrudEstudianteService;

public class listar {

    public static void main(String[] args) {
        try {

            // Proceso
            CrudEstudianteService EstudianteService = new CrudEstudianteService();
            List<Estudiante> lista = EstudianteService.getAll();
            System.out.println(lista);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
