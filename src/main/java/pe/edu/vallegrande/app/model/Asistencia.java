package pe.edu.vallegrande.app.model;

public class Asistencia {

	private Integer id;
	private String Fecha;
	private String Tipo;
	private String IdEstudiante;
	private String IdGestorAsistencia;



	public String getFecha() {
		return Fecha;
	}

	public void setFecha(String fecha) {
		Fecha = fecha;
	}

	public String getTipo() {
		return Tipo;
	}

	public void setTipo(String tipo) {
		Tipo = tipo;
	}

	public String getIdEstudiante() {
		return IdEstudiante;
	}

	public void setIdEstudiante(String idEstudiante) {
		IdEstudiante = idEstudiante;
	}

	public String getIdGestorAsistencia() {
		return IdGestorAsistencia;
	}

	public void setIdGestorAsistencia(String idGestorAsistencia) {
		IdGestorAsistencia = idGestorAsistencia;
	}

	public Asistencia(Integer id, String Fecha, String Tipo, String IdEstudiante, String IdGestorAsistencia) {
		this.id = id;
		this.Fecha = Fecha;
		this.Tipo = Tipo;
		this.IdEstudiante = IdEstudiante;
		this.IdGestorAsistencia = IdGestorAsistencia;
	}

	public Asistencia() {
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Asistencia [id=" + id + ", Fecha=" + Fecha + ", Tipo=" + Tipo + ", IdEstudiante=" + IdEstudiante
				+ ", IdGestorAsistencia=" + IdGestorAsistencia + "]";
	}

}
