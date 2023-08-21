package pe.vallegrande.edu.app.pruebaEstudiante;

import pe.edu.vallegrande.app.service.CrudEstudianteService;

public class Activar {

    public static void main(String[] args) {
        try {
            // Datos
            String id = "1";
            // Proceso
            CrudEstudianteService EstudianteService = new CrudEstudianteService();
            EstudianteService.activate(id);
            System.out.println("Registro activado.");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
