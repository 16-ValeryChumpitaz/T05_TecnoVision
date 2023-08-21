package pe.vallegrande.edu.app.pruebaJustificacion;

import pe.edu.vallegrande.app.model.Justificacion;
import pe.edu.vallegrande.app.service.CrudJustificacionService;

public class Consultar {

    public static void main(String[] args) {
        try {
            CrudJustificacionService JustificacionService = new CrudJustificacionService();
            Justificacion bean = JustificacionService.getForId("1");
            System.out.println(bean);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

}
