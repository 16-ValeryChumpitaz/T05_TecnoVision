package pe.edu.vallegrande.app.GestorAsistencia;

import pe.edu.vallegrande.app.model.GestorAsistencia;
import pe.edu.vallegrande.app.service.CrudGestorAsistenciaService;

public class Modificar {

    public static void main(String[] args) {
        try {
            // Datos
            GestorAsistencia bean = new GestorAsistencia(6, "Antonio", "Antonio", "Antonio@GMAIL.COM", "DNI", "29183402", "183019372","2023-07-05");
            // Proceso
            CrudGestorAsistenciaService GestorAsistenciaService = new CrudGestorAsistenciaService();
            GestorAsistenciaService.update(bean);
            System.out.println(bean);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
