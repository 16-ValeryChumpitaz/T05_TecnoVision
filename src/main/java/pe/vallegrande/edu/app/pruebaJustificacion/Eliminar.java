package pe.vallegrande.edu.app.pruebaJustificacion;

import pe.edu.vallegrande.app.service.CrudJustificacionService;

public class Eliminar {

    public static void main(String[] args) {
        try {
            // Datos
            String id = "7";
            // Proceso
            CrudJustificacionService JustificacionService = new CrudJustificacionService();
            JustificacionService.delete(id);
            System.out.println("Registro eliminado.");
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

}
