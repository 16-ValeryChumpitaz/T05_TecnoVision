package pe.vallegrande.edu.app.pruebaJustificacion;

import pe.edu.vallegrande.app.model.Justificacion;
import pe.edu.vallegrande.app.service.CrudJustificacionService;

public class Modificar {

    public static void main(String[] args) {
        try {
            // Datos
            Justificacion bean = new Justificacion(7, "Manzo", "Luis", "DNI", "5930485038475", "888888", "jejeje","2");
            // Proceso
            CrudJustificacionService JustificacionService = new CrudJustificacionService();
            JustificacionService.update(bean);
            System.out.println(bean);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
