package pe.vallegrande.edu.app.pruebaRegistro;

import pe.edu.vallegrande.app.model.Estudiante;
import pe.edu.vallegrande.app.service.CrudEstudianteService;

public class Crear {

    public static void main(String[] args) {
        try {
            // Datos
            Estudiante bean = new Estudiante(0, "Manzo", "Luis", "DNI", "193827304", "954126630", "002","1","1");
            // Proceso
            CrudEstudianteService estudianteService = new CrudEstudianteService();
            estudianteService.insert(bean);
            System.out.println(bean);
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

}
