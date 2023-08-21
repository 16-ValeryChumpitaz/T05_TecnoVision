package pe.vallegrande.edu.app.pruebaEstudiante;

import pe.edu.vallegrande.app.model.Estudiante;
import pe.edu.vallegrande.app.service.CrudEstudianteService;

public class Modificar {

    public static void main(String[] args) {
        try {
            // Datos
            Estudiante bean = new Estudiante(7, "Manzo", "Luis", "DNI", "5930485038475", "888888", "jejeje","2");
            // Proceso
            CrudEstudianteService EstudianteService = new CrudEstudianteService();
            EstudianteService.update(bean);
            System.out.println(bean);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
