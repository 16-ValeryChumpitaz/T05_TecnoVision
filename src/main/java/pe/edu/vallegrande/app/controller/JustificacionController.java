package pe.edu.vallegrande.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import pe.edu.vallegrande.app.model.Asistencia;
import pe.edu.vallegrande.app.model.Justificacion;
import pe.edu.vallegrande.app.service.CrudAsistenciaService;
import pe.edu.vallegrande.app.service.CrudEstudianteService;
import pe.edu.vallegrande.app.service.CrudJustificacionService;


@WebServlet({ "/Justificacion",})
public class JustificacionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CrudJustificacionService service = new CrudJustificacionService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/Justificacion":
			crear(request, response);
			break;
		}
	}
	
	private void crear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Datos
		String Fecha = request.getParameter("dates");
		String Tipo = request.getParameter("descripcion");
		String Idregistro = request.getParameter("idAsistencia");
		Justificacion bean = new Justificacion();
		bean.setDates(Fecha);
		bean.setDescripcion(Tipo);
		bean.setAttendance_id(Idregistro);
		service.insert(bean);
	}
	

}