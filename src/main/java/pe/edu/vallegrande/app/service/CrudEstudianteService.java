package pe.edu.vallegrande.app.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.app.db.AccesoDB;
import pe.edu.vallegrande.app.model.Estudiante;
import pe.edu.vallegrande.app.model.GestorAsistencia;
import pe.edu.vallegrande.app.service.spec.CrudServiceSpec;
import pe.edu.vallegrande.app.service.spec.RowMapper;

public class CrudEstudianteService implements CrudServiceSpec<Estudiante>, RowMapper<Estudiante> {

    // Definiendo cosas
    private final String SQL_SELECT_BASE = "SELECT * FROM student WHERE State = '1' ";
    private final String SQL_INSERT = "INSERT INTO student(id, name, last_name, type_document, number_document, cellphone, grade, parents_id, State) VALUES(?,?,?,?,?,?,?,?,?)";
    private final String SQL_DELETE = "DELETE student WHERE ID=?";
    private final String SQL_UPDATE = "UPDATE student SET  name = ?, last_name = ?,  type_document = ?, number_document = ?, cellphone =?, grade = ?, parents_id = ? WHERE id = ?";
    private final String SQL_UPDATE_STATE = "UPDATE student SET State = 0 where id = ? ";
    private final String SQL_UPDATE_STATE_ACTIVE = "UPDATE student SET State = 1 where id = ? ";
    private final String SQL_SELECT_WHERE_STATE = "SELECT * FROM student WHERE State = ? ";
    
    @Override
    public List<Estudiante> getAll() {
        // Variables
        Connection cn = null;
        List<Estudiante> lista = new ArrayList<>();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Estudiante bean;
        // Proceso
        try {
            cn = AccesoDB.getConnection();
            pstm = cn.prepareStatement(SQL_SELECT_BASE);
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
    public Estudiante getForId(String id) {
        // Variables
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Estudiante bean = null;
        String sql;
        // Proceso
        try {
            cn = AccesoDB.getConnection();
            sql = SQL_SELECT_BASE + " AND id=?";
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
    public List<Estudiante> get(Estudiante bean) {
  	  // Variables
      Connection cn = null;
      PreparedStatement pstm = null;
      ResultSet rs = null;
      Estudiante item = null;
      List<Estudiante> lista = new ArrayList<>();
      String sql;
      // Proceso
      System.out.print(bean);
      try {
          cn = AccesoDB.getConnection();
          sql = SQL_SELECT_BASE + "AND (name = ? or  ? IS NULL ) AND (last_name = ? or  ? IS NULL ) AND (number_document = ? or  ? IS NULL )";
          pstm = cn.prepareStatement(sql);
			pstm.setString(1, bean.getNombre());
			pstm.setString(2, bean.getNombre());
			pstm.setString(3, bean.getApellido());
			pstm.setString(4, bean.getApellido());
			pstm.setString(5, bean.getNumeroDocumento());
			pstm.setString(6, bean.getNumeroDocumento());
			rs = pstm.executeQuery();
			while (rs.next()) {
				item = mapRow(rs);
				lista.add(item);
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
    public void insert(Estudiante bean) {
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
            sql = "SELECT MAX(ID) as id FROM student ";
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
            pstm.setString(2, bean.getNombre());
            pstm.setString(3, bean.getApellido());
            pstm.setString(4, bean.getTipoDocumento());
            pstm.setString(5, bean.getNumeroDocumento());
            pstm.setString(6, bean.getCelular());
            pstm.setString(7, bean.getGrado());
            pstm.setString(8, bean.getIdPadre());
            pstm.setString(9, "1");

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
    public void update(Estudiante bean) {
        // TODO Auto-generated method stub
        Connection cn = null;
        String sql = null;
        PreparedStatement pstm = null;
        ResultSet rs;
        try {
            // Iniciar la Tx
            cn = AccesoDB.getConnection();
            pstm = cn.prepareStatement(SQL_UPDATE);
            pstm.setString(1, bean.getNombre());
            pstm.setString(2, bean.getApellido());
            pstm.setString(3, bean.getTipoDocumento());
            pstm.setString(4, bean.getNumeroDocumento());
            pstm.setString(5, bean.getCelular());
            pstm.setString(6, bean.getGrado());
            pstm.setString(7, bean.getIdPadre());
            pstm.setString(8, bean.getId() + "");
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
    public void delete(String id) {
        // TODO Auto-generated method stub
        Connection cn = null;
        String sql = null;
        PreparedStatement pstm = null;
        ResultSet rs;
        try {
            // Iniciar la Tx
            cn = AccesoDB.getConnection();
            pstm = cn.prepareStatement(SQL_UPDATE_STATE);
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
    public Estudiante mapRow(ResultSet rs) throws SQLException {
        Estudiante bean = new Estudiante();
        // Columnas: id, apellido, nombre, direccion, email
        bean.setId(rs.getInt("id"));
        bean.setApellido(rs.getString("last_name"));
        bean.setNombre(rs.getString("name"));
        bean.setCelular(rs.getString("cellphone"));
        bean.setNumeroDocumento(rs.getString("number_document"));
        bean.setGrado(rs.getString("grade"));
        bean.setIdPadre(rs.getString("parents_id"));
        bean.setTipoDocumento(rs.getString("type_document"));
        return bean;
    }

    @Override
    public void activate(String id) {
        Connection cn = null;
        String sql = null;
        PreparedStatement pstm = null;
        ResultSet rs;
        try {
            // Iniciar la Tx
            cn = AccesoDB.getConnection();
            pstm = cn.prepareStatement(SQL_UPDATE_STATE_ACTIVE);
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
	public List<Estudiante> getAllbyState(int state) {
		   // Variables
        Connection cn = null;
        List<Estudiante> lista = new ArrayList<>();
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Estudiante bean;
        // Proceso
        try {
            cn = AccesoDB.getConnection();
            pstm = cn.prepareStatement(SQL_SELECT_WHERE_STATE);
            pstm.setInt(1, state);
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
}
