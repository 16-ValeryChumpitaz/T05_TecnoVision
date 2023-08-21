package pe.vallegrande.edu.app.pruebaJustificacion;

import pe.edu.vallegrande.app.model.Justificacion;
import pe.edu.vallegrande.app.service.CrudJustificacionService;

public class Crear {
    
    public static void main(String[] args) {
        try {
            // Datos
            Justificacion bean = new Justificacion();
            bean.setDates("2023-06-29");
            bean.setDescripcion("demo");
            bean.setAttendance_id("1");
            // Proceso
            CrudJustificacionService JustificacionService = new CrudJustificacionService();
            JustificacionService.insert(bean);
            System.out.println(bean);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
    
}
