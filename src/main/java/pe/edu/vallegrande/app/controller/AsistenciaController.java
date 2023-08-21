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
import pe.edu.vallegrande.app.service.CrudAsistenciaService;
import pe.edu.vallegrande.app.service.CrudEstudianteService;


@WebServlet({ "/Asistencia","/AsistenciaBuscar", "/AsistenciaBuscar2","/AsistenciaEliminar","/AsistenciaListar","/Asistenciamodificar","/AsistenciRegistrar"})
public class AsistenciaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CrudAsistenciaService service = new CrudAsistenciaService();
	private CrudEstudianteService estudianteService = new CrudEstudianteService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/AsistenciaBuscar":
			buscar(request, response);
			break;
		case "/Asistencia":
			crear(request, response);
			break;
		case "/AsistenciaBuscar2":
			buscar2(request, response);
			break;
		case "/AsistenciaEliminar":
			eliminar(request, response);
			break;
		case "/AsistenciaListar":
			listarTodo(request, response);
			break;
		case "/Asistenciamodificar":
			modificar(request, response);
			break;
		case "/AsistenciRegistrar":
			Registrar(request, response);
			break;
		}
	}

	private void listarTodo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		// Datos
		System.out.print("iniciando" );
		List<Asistencia> lista = service.getAll();
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		// Responde
		ControllerUtil.responseJson(response, data);
	}
	
	private void eliminar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Datos
		String id = request.getParameter("id");
		System.out.print("controller id:" + id);
		service.delete(id);
		ControllerUtil.responseJson(response, "ok");
	}
	
	
	private void crear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Datos
		String Fecha = request.getParameter("fecha");
		String Tipo = request.getParameter("tipo");
		String IdEstudiante = request.getParameter("idEstudiante");
		String IdGestorAsistencia = request.getParameter("idGestorAsistencia");
		System.out.print(Fecha);
		System.out.print(Tipo);
		System.out.print(IdEstudiante);
		System.out.print(IdGestorAsistencia);
		Asistencia bean = new Asistencia();
		bean.setFecha(Fecha);
		bean.setTipo(Tipo);
		bean.setIdEstudiante(IdEstudiante);
		bean.setIdGestorAsistencia(IdGestorAsistencia);
		service.insert(bean);
	}
	
private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Datos
		String Fecha = request.getParameter("Fecha");
		String Tipo = request.getParameter("Tipo");
		String IdEstudiante = request.getParameter("IdEstudiante");
		String IdGestorAsistencia = request.getParameter("IdGestorAsistencia");
		Integer id = Integer.valueOf(request.getParameter("id"));
		Asistencia bean = new Asistencia();
		bean.setFecha(Fecha);
		bean.setTipo(Tipo);
		bean.setIdEstudiante(IdEstudiante);
		bean.setIdGestorAsistencia(IdGestorAsistencia);
		bean.setId(id);
		service.update(bean);
		ControllerUtil.responseJson(response, "Modificacion correcta ok.");
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Datos
		String apellido = request.getParameter("apellido");
		String nombre = request.getParameter("nombre");
		// Proceso
		Asistencia bean = new Asistencia();
		List<Asistencia> lista = service.get(bean);
		Gson gson = new Gson();
        String data = gson.toJson(lista);
		// Reporte
        
        ControllerUtil.responseJson(response, data);
        
		//request.setAttribute("listado", lista);
		//RequestDispatcher rd = request.getRequestDispatcher("GestorAsistencia.jsp");
		//rd.forward(request, response);
	}
	
	private void buscar2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Datos
		String apellido = request.getParameter("apellido");
		String nombre = request.getParameter("nombre");
		// Proceso
		Asistencia bean = new Asistencia();

		List<Asistencia> lista = service.get(bean);
		// Preparando el JSON
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		// Reporte
		ControllerUtil.responseJson(response, data);
	}
	
	
private void Registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Datos
		String Fecha = request.getParameter("Fecha");
		String Tipo = request.getParameter("Tipo");
		String IdEstudiante = request.getParameter("IdEstudiante");
		String IdGestorAsistencia = request.getParameter("IdGestorAsistencia");
		Asistencia bean = new Asistencia();
		bean.setFecha(Fecha);
		bean.setTipo(Tipo);
		bean.setIdEstudiante(IdEstudiante);
		bean.setIdGestorAsistencia(IdGestorAsistencia);
		service.insert(bean);
		ControllerUtil.responseJson(response, "Proceso ok.");
	}

}