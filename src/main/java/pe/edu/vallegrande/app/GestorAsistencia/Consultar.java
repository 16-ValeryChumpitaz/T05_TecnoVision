package pe.edu.vallegrande.app.GestorAsistencia;

import pe.edu.vallegrande.app.model.GestorAsistencia;
import pe.edu.vallegrande.app.service.CrudGestorAsistenciaService;

public class Consultar {

	public static void main(String[] args) {
		try {
			CrudGestorAsistenciaService gestorasistenciaService = new CrudGestorAsistenciaService();
			GestorAsistencia bean = gestorasistenciaService.getForId("5");
			System.out.println(bean);
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
	}

}
