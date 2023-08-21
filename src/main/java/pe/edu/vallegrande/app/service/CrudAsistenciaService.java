package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Asistencia;
import pe.edu.vallegrande.app.model.Estudiante;
import pe.edu.vallegrande.app.model.GestorAsistencia;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.app.service.spec.RowMapper;

public class CrudAsistenciaService implements CrudServiceSpec<Asistencia>, RowMapper<Asistencia> {

    // Definiendo cosas
    private final String SQL_INSERT = "INSERT INTO attendance(id, Date, Type, student_id, assistance_manager_id) VALUES(?,GETDATE(),?,?,?)";
    private final String SQL_DELETE = "DELETE attendance WHERE ID=?";
    private final String SQL_UPDATE = "UPDATE attendance SET Date = ? , Type = ? , student_id = ?, assistance_manager_id = ? WHERE id = ?";
    private final String SQL_SELECT_Justificacion = "SELECT * FROM attendance WHERE Type = 'J' ";

    @Override
	public Asistencia mapRow(ResultSet rs) throws SQLException {
    	Asistencia bean = new Asistencia();
        // Columnas: id, apellido, nombre, direccion, email
        bean.setId(rs.getInt("id"));
        bean.setFecha(rs.getString("date"));
        bean.setTipo(rs.getString("type"));
        bean.setIdEstudiante(rs.getString("student_id"));
        bean.setIdGestorAsistencia(rs.getString("assistance_manager_id"));
        return bean;
	}
	@Override
	public List<Asistencia> getAll() {
		// Variables
        Connection cn = null;
        List<Asistencia> lista = new ArrayList<>();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Asistencia bean;
        // Proceso
        try {
            cn = AccesoDB.getConnection();
            pstm = cn.prepareStatement(SQL_SELECT_Justificacion);
            rs = pstm.executeQuery();
            while (rs.next()) {
                bean = mapRow(rs);
                lista.add(bean);
            }
            rs.close();
            pstm.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                cn.close();
            } catch (Exception e2) {
            }
        }
        return lista;
		
	}
	@Override
	public List<Asistencia> getAllbyState(int state) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Asistencia getForId(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Asistencia> get(Asistencia bean) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void insert(Asistencia bean) {
		// Variables
        Connection cn = null;
        String sql = null;
        PreparedStatement pstm = null;
        ResultSet rs;
        // Proceso
        try {
            // Iniciar la Tx
            cn = AccesoDB.getConnection();
            cn.setAutoCommit(false);
            // Traer contador
            Integer id = 0;
            sql = "SELECT MAX(ID) as id FROM attendance ";
            pstm = cn.prepareStatement(sql);
            rs = pstm.executeQuery();
            if (!rs.next()) {
                rs.close();
                pstm.close();
                throw new SQLException("Cobtador de empleado no existe.");
            }
            id = Integer.parseInt(rs.getString("id"));
            rs.close();
            pstm.close();
            // Actualizar contador
            id++;
            
            // Insertar nuevo student
            pstm = cn.prepareStatement(SQL_INSERT);
            pstm.setString(1, id + "");
            pstm.setString(2, bean.getTipo());
            pstm.setString(3, bean.getIdEstudiante());
            pstm.setString(4, bean.getIdGestorAsistencia());
            pstm.executeUpdate();
            pstm.close();
            // Fin de Tx
            //bean.setId(id);
            cn.commit();
        } catch (SQLException e) {
            try {
                cn.rollback();
                cn.close();
            } catch (Exception e2) {
            }
            throw new RuntimeException(e.getMessage());
        } finally {
            try {
                cn.close();
            } catch (Exception e2) {
            }
        }
    }
		
	@Override
	public void update(Asistencia bean) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void activate(String id) {
		// TODO Auto-generated method stub
		
	}


	}



