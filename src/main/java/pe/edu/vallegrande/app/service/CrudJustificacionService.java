package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Estudiante;
import pe.edu.vallegrande.app.model.Justificacion;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.app.service.spec.RowMapper;

public class CrudJustificacionService implements CrudServiceSpec<Justificacion>, RowMapper<Justificacion> {

    // Definiendo cosas
    private final String SQL_SELECT_BASE = "SELECT * FROM justification  ";
    private final String SQL_INSERT = "INSERT INTO justification (id, descripcion, dates, attendance_id) VALUES(?,?,?,?)";
    private final String SQL_DELETE = "DELETE justification WHERE ID=?";
    private final String SQL_UPDATE = "UPDATE justification SET  descripcion = ?, dates = ?,  attendance_id = ?, WHERE id = ?";


    @Override
    public void insert(Justificacion bean) {
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
            sql = "SELECT MAX(ID) as id FROM justification ";
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
            pstm.setString(2, bean.getDescripcion());
            pstm.setDate(3, java.sql.Date.valueOf(bean.getDates()));
            pstm.setString(4, bean.getAttendance_id());
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
    public Justificacion mapRow(ResultSet rs) throws SQLException {
        Justificacion bean = new Justificacion();
        // Columnas: id, apellido, nombre, direccion, email
        bean.setId(rs.getInt("id"));
        bean.setDates(rs.getString("dates"));
        bean.setDescripcion(rs.getString("descripcion"));
        bean.setApproval(rs.getString("approval"));
        bean.setAttendance_id(rs.getString("attendance_id"));
        return bean;
    }

    @Override
    public List<Justificacion> getAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Justificacion> getAllbyState(int state) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public Justificacion getForId(String id) {
        // Variables
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Justificacion bean = null;
        String sql;
        // Proceso
        try {
            cn = AccesoDB.getConnection();
            sql = SQL_SELECT_BASE + " where id=?";
            pstm = cn.prepareStatement(sql);
            pstm.setInt(1, Integer.parseInt(id));
            rs = pstm.executeQuery();
            if (rs.next()) {
                bean = mapRow(rs);
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
        return bean;
    }

   @Override
    public void delete(String id) {
        // TODO Auto-generated method stub
        Connection cn = null;
        String sql = null;
        PreparedStatement pstm = null;
        ResultSet rs;
        try {
            // Iniciar la Tx
            cn = AccesoDB.getConnection();
            pstm = cn.prepareStatement(SQL_DELETE);
            pstm.setString(1, id);
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
    public void update(Justificacion bean) {
        // TODO Auto-generated method stub
        Connection cn = null;
        String sql = null;
        PreparedStatement pstm = null;
        ResultSet rs;
        try {
            // Iniciar la Tx
            cn = AccesoDB.getConnection();
            pstm = cn.prepareStatement(SQL_UPDATE);
            pstm.setString(1, bean.getDescripcion());
            pstm.setString(2, bean.getDates());
            pstm.setString(3, bean.getAttendance_id());
            pstm.setString(4, bean.getParents_id());
            pstm.setString(5, bean.getApproval());
            pstm.setString(6, bean.getId() + "");
            pstm.executeUpdate();
            pstm.close();
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
    public List<Justificacion> get(Justificacion bean) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


    @Override
    public void activate(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

