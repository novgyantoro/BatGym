package Controller;

import Database.DBConnection;
import Model.MemberBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;
    static String sql;

    public MemberDAO() {
       DBConnection db = new DBConnection();
       conn = db.setConnection();
    }

    public static int simpan(MemberBean mb) {
        int status = 0;
       
        String sql = "INSERT INTO tbl_member (username, password, paket, email, program) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, mb.getUsername());
            ps.setString(2, mb.getPassword());
            ps.setString(3, mb.getPaket());
            ps.setString(4, mb.getEmail());
            ps.setString(5, mb.getProgram());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int update(MemberBean mb) {
        int status = 0;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = new DBConnection().setConnection(); // Sesuaikan dengan metode koneksi yang benar
            String query = "UPDATE tbl_member SET username=?, email=?, paket=?, program=? WHERE id=?";
            ps = conn.prepareStatement(query);

            ps.setString(1, mb.getUsername());
            ps.setString(2, mb.getEmail());
            ps.setString(3, mb.getPaket());
            ps.setString(4, mb.getProgram());
            ps.setInt(5, mb.getId());

            status = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Update failed with exception: " + ex.getMessage());
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return status;
    }
   
    public static int delete(MemberBean mb) {
        int status = 0;
        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("delete from tbl_member where id=?");
            ps.setInt(1, mb.getId());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return status;
    }

   public static MemberBean getRecordById(int id) {
        MemberBean mb = null;
        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("select * from tbl_member where id=?");
            ps.setInt(1, id);
            ResultSet rsu;
            rsu = ps.executeQuery();
            while (rsu.next()) {
                mb = new MemberBean();
                mb.setId(rsu.getInt("id"));
                mb.setUsername(rsu.getString("username"));
                mb.setPassword(rsu.getString("password"));
                mb.setEmail(rsu.getString("email"));
                mb.setPaket(rsu.getString("paket"));
                mb.setProgram(rsu.getString("program"));
                
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return mb;
    }
   
   public static List<MemberBean> getAllRecords() {
        List<MemberBean> list = new ArrayList<>();

        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("select * from tbl_member");
            ResultSet rsu;
            rsu = ps.executeQuery();
            while (rsu.next()) {
                MemberBean mb = new MemberBean();
               mb.setId(rsu.getInt("id"));
                mb.setUsername(rsu.getString("username"));
                mb.setPassword(rsu.getString("password"));
                mb.setEmail(rsu.getString("email"));
                mb.setPaket(rsu.getString("paket"));
                mb.setProgram(rsu.getString("program"));
               
                list.add(mb);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
   
}

