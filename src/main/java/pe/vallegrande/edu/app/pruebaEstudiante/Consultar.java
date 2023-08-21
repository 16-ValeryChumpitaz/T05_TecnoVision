package pe.vallegrande.edu.app.pruebaEstudiante;

import pe.edu.vallegrande.app.GestorAsistencia.*;
import pe.edu.vallegrande.app.model.Estudiante;
import pe.edu.vallegrande.app.service.CrudEstudianteService;

public class Consultar {

	public static void main(String[] args) {
		try {
			CrudEstudianteService EstudianteService = new CrudEstudianteService();
			Estudiante bean = EstudianteService.getForId("5");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
