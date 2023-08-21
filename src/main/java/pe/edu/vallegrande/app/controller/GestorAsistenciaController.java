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

import pe.edu.vallegrande.app.model.Estudiante;
import pe.edu.vallegrande.app.model.GestorAsistencia;
import pe.edu.vallegrande.app.service.CrudGestorAsistenciaService;

@WebServlet({ "/GestorAsistencia","/GestorAsistenciaBuscar", "/GestorAsistenciaBuscar2","/GestorAsistenciaEliminar","/GestorAsistenciaListar","/GestorAsistenciamodificar","/GestorAsistenciaActivar"})
public class GestorAsistenciaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CrudGestorAsistenciaService service = new CrudGestorAsistenciaService();

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		switch (path) {
		case "/GestorAsistenciaBuscar":
			buscar(request, response);
			break;
		case "/GestorAsistencia":
			crear(request, response);
			break;
		case "/GestorAsistenciaBuscar2":
			buscar2(request, response);
			break;
		case "/GestorAsistenciaEliminar":
			eliminar(request, response);
			break;
		case "/GestorAsistenciaListar":
			listarTodo(request, response);
			break;
		case "/GestorAsistenciamodificar":
			modificar(request, response);
			break;
		case "/GestorAsistenciaActivar":
			activar(request, response);
			break;
		}
	}

	private void listarTodo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Datos
		String estado = request.getParameter("estado");
		List<GestorAsistencia> lista = service.getAllbyState(Integer.parseInt(estado));
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
	
	private void activar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Datos
		String id = request.getParameter("id");
		System.out.print("controller id:" + id);
		service.activate(id);
		ControllerUtil.responseJson(response, "ok");
	}
	
	private void crear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Datos
		String apellido = request.getParameter("apellido");
		String nombre = request.getParameter("nombre");
		String numerodocumento = request.getParameter("numeroDocumento");
		String celular = request.getParameter("celular");
		String grado = request.getParameter("grado");
		String tipoDocumento = request.getParameter("tipoDocumento");
		String email = request.getParameter("email");
		String fecha = request.getParameter("fecha");
		GestorAsistencia bean = new GestorAsistencia();
		bean.setApellido(apellido);
		bean.setNombre(nombre);
		bean.setNumeroDocumento(numerodocumento);
		bean.setCelular(celular);
		bean.setGrado(grado);
		bean.setTipoDocumento(tipoDocumento);
		bean.setEmail(email);
		bean.setFecha(fecha);
		service.insert(bean);
		ControllerUtil.responseJson(response, "Proceso ok.");
	}
	
private void modificar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Datos
		String apellido = request.getParameter("apellido");
		String nombre = request.getParameter("nombre");
		String numerodocumento = request.getParameter("numeroDocumento");
		String celular = request.getParameter("celular");
		String grado = request.getParameter("grado");
		String tipoDocumento = request.getParameter("tipoDocumento");
		String email = request.getParameter("email");
		String fecha = request.getParameter("fecha");
		Integer id = Integer.valueOf(request.getParameter("id"));
		GestorAsistencia bean = new GestorAsistencia();
		bean.setApellido(apellido);
		bean.setNombre(nombre);
		bean.setNumeroDocumento(numerodocumento);
		bean.setCelular(celular);
		bean.setGrado(grado);
		bean.setTipoDocumento(tipoDocumento);
		bean.setEmail(email);
		bean.setFecha(fecha);
		bean.setId(id);
		service.update(bean);
		ControllerUtil.responseJson(response, "Modificacion correcta ok.");
	}

	private void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Datos
		String apellido= request.getParameter("apellido");
		String nombre = request.getParameter("nombre");
		String numeroDocumento =  request.getParameter("NumeroDocumento");
		
		GestorAsistencia bean = new GestorAsistencia();
		
		if(apellido != "" && apellido != null) {
			bean.setApellido(apellido);
		}
		if(nombre != "" && nombre != null) {
			bean.setNombre(nombre);
		}
		
		if(numeroDocumento != "" && numeroDocumento != null) {
			bean.setNumeroDocumento(numeroDocumento);
		}
		List<GestorAsistencia> lista = service.get(bean);
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
		String NumeroDocumento = request.getParameter("NumeroDocumento");
		// Proceso
		GestorAsistencia bean = new GestorAsistencia();
		bean.setApellido(apellido);
		bean.setNombre(nombre);
		bean.setNumeroDocumento(NumeroDocumento);
		List<GestorAsistencia> lista = service.get(bean);
		// Preparando el JSON
		Gson gson = new Gson();
		String data = gson.toJson(lista);
		// Reporte
		ControllerUtil.responseJson(response, data);
	}

}