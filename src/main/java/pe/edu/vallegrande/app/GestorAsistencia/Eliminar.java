package pe.edu.vallegrande.app.GestorAsistencia;

import pe.edu.vallegrande.app.service.CrudGestorAsistenciaService;

public class Eliminar {

    public static void main(String[] args) {
        try {
            // Datos
            String id = "6";
            // Proceso
            CrudGestorAsistenciaService GestorAsistenciaService = new CrudGestorAsistenciaService();
            GestorAsistenciaService.delete(id);
            System.out.println("Registro eliminado.");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

}
