package pe.vallegrande.edu.app.pruebaRegistro;

import pe.edu.vallegrande.app.service.CrudEstudianteService;

public class Eliminar {

    public static void main(String[] args) {
        try {
            // Datos
            String id = "10";
            // Proceso
            CrudEstudianteService EstudianteService = new CrudEstudianteService();
            EstudianteService.delete(id);
            System.out.println("Registro eliminado.");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

}
