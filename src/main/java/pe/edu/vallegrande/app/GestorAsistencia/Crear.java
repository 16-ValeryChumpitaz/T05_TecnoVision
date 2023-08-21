package pe.edu.vallegrande.app.GestorAsistencia;

import pe.edu.vallegrande.app.model.GestorAsistencia;
import pe.edu.vallegrande.app.service.CrudGestorAsistenciaService;

public class Crear {

    public static void main(String[] args) {
        try {
            // Datos
            GestorAsistencia bean = new GestorAsistencia(0, "Alejandro", "Antonio", "Alejando@gmail.COM", "DNI", "12345623", "123456781","1","2023-07-07");
            // Proceso
            CrudGestorAsistenciaService assistance_managerService = new CrudGestorAsistenciaService();
            assistance_managerService.insert(bean);
            System.out.println(bean);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }
}
