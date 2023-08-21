package pe.edu.vallegrande.app.GestorAsistencia;

import pe.edu.vallegrande.app.service.CrudGestorAsistenciaService;

public class Activar {

    public static void main(String[] args) {
        try {
            // Datos
            String id = "6";
            // Proceso
            CrudGestorAsistenciaService GestorAsistenciaService = new CrudGestorAsistenciaService();
            GestorAsistenciaService.activate(id);
            System.out.println("Registro activado.");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

}
