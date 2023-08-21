package pe.edu.vallegrande.app.model;

public class GestorAsistencia {

    private Integer id;
    private String apellido;
    private String nombre;
    private String email;
    private String tipoDocumento;
    private String numeroDocumento;
    private String celular;
    private String estado;
    private String grado;
    private String fecha;

    public GestorAsistencia(Integer id, String apellido, String nombre, String email, String tipoDocumento, String numeroDocumento, String celular, String estado, String fecha) {
        this.id = id;
        this.apellido = apellido;
        this.nombre = nombre;
        this.email = email;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.celular = celular;
        this.estado = estado;
        this.fecha = fecha;
    }

    public String getGrado() {
		return grado;
	}

	public void setGrado(String grado) {
		this.grado = grado;
	}

	public GestorAsistencia() {
    }

    public GestorAsistencia(Integer id, String apellido, String nombre, String email, String tipoDocumento,
            String numeroDocumento, String celular, String fecha) {
        super();
        this.id = id;
        this.apellido = apellido;
        this.nombre = nombre;
        this.email = email;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.celular = celular;
        this.fecha = fecha;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNumeroDocumento() {
        return numeroDocumento;
    }

    public void setNumeroDocumento(String numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getFecha() {
        return fecha;
    }
    
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    @Override
    public String toString() {
        return "GestorAsistencia [id=" + id + ", apellido=" + apellido + ", nombre=" + nombre + ", email=" + email
                + ", tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento + ", celular=" + celular+ ", fecha=" + fecha+ "]";
    }

}
