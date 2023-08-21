package pe.edu.vallegrande.app.model;

public class Justificacion {

    private Integer id;
    private String dates;
    private String descripcion;
    private String approval;
    private String parents_id;
    private String attendance_id;

    public Justificacion(Integer id, String dates, String descripcion, String approval, String parents_id, String attendance_id) {
        this.id = id;
        this.dates = dates;
        this.descripcion = descripcion;
        this.approval = approval;
        this.parents_id = parents_id;
        this.attendance_id = attendance_id;
    }
    
 

    public Justificacion() {
    }

    public Justificacion(int i, String manzo, String luis, String dni, String string, String string0, String jejeje, String string1) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDates() {
        return dates;
    }

    public void setDates(String dates) {
        this.dates = dates;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getApproval() {
        return approval;
    }

    public void setApproval(String approval) {
        this.approval = approval;
    }

    public String getParents_id() {
        return parents_id;
    }

    public void setParents_id(String parents_id) {
        this.parents_id = parents_id;
    }

    public String getAttendance_id() {
        return attendance_id;
    }

    public void setAttendance_id(String attendance_id) {
        this.attendance_id = attendance_id;
    }

    @Override
    public String toString() {
        return "Justificacion{" + "id=" + id + ", dates=" + dates + ", descripcion=" + descripcion + ", approval=" + approval + ", parents_id=" + parents_id + ", attendance_id=" + attendance_id + '}';
    }

}
