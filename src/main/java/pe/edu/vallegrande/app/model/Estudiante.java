package pe.edu.vallegrande.app.model;

public class Estudiante {

    private Integer id;
    private String apellido;
    private String nombre;
    private String tipoDocumento;
    private String numeroDocumento;
    private String celular;
    private String grado;
    private String idPadre;
    private String estado;

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Estudiante(Integer id, String apellido, String nombre, String tipoDocumento, String numeroDocumento, String celular, String grado, String idPadre, String estado) {
        this.id = id;
        this.apellido = apellido;
        this.nombre = nombre;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.celular = celular;
        this.grado = grado;
        this.idPadre = idPadre;
        this.estado = estado;
    }

    public Estudiante() {
    }

    public Estudiante(Integer id, String apellido, String nombre, String tipoDocumento, String numeroDocumento, String celular, String grado, String idPadre) {
        this.id = id;
        this.apellido = apellido;
        this.nombre = nombre;
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
        this.celular = celular;
        this.grado = grado;
        this.idPadre = idPadre;
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

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public String getIdPadre() {
        return idPadre;
    }

    public void setIdPadre(String idPadre) {
        this.idPadre = idPadre;
    }

    @Override
    public String toString() {
        return "Estudiante{" + "id=" + id + ", apellido=" + apellido + ", nombre=" + nombre + ", tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento + ", celular=" + celular + ", grado=" + grado + ", idPadre=" + idPadre + '}';
    }

}
