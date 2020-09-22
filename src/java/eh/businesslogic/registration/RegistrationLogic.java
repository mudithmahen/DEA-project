/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package eh.businesslogic.registration;

import eh.bean.registration.UniOrgBean;
import eh.bean.user.UserBean;
import eh.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author grdul
 */
public class RegistrationLogic {

    public boolean setRegistration(UniOrgBean bean) throws SQLException {
        boolean flag = false;
        Connection con = null;
        try {
            con = new DBConnection().getConnection();
            String query = " INSERT INTO `eh_uni_org` (\n"
                    + "  `uni_org_name`,\n"
                    + "  `uni_org_type`,\n"
                    + "  `email`,\n"
                    + "  `address`,\n"
                    + "  `telephone`,\n"
                    + "  `status_code`\n"
                    + ")\n"
                    + "VALUES\n"
                    + "  ( ?,\n"
                    + "    ?,\n"
                    + "    ?,\n"
                    + "    ?,\n"
                    + "    ?,\n"
                    + "    ?); ";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, bean.getUni_org_name());
            ps.setString(2, bean.getUni_org_type());
            ps.setString(3, bean.getEmail());
            ps.setString(4, bean.getAddress());
            ps.setString(5, bean.getTelephone());
            ps.setString(6, "PENDING");
            System.out.println("ps:" + ps);

            ps.execute();

            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return flag;
    }

    public List<UniOrgBean> getUniOrgList() throws SQLException {

        List<UniOrgBean> appBean = new ArrayList<UniOrgBean>();

        Connection con = null;
        try {
            con = new DBConnection().getConnection();
            String query = " SELECT * FROM `eh_uni_org` WHERE `uni_org_name` != 'EHUB' ";
            //SELECT * FROM appoinment WHERE doctorid = 1
            PreparedStatement ps = con.prepareStatement(query);
            System.out.println("ps:" + ps);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                UniOrgBean b = new UniOrgBean();
                b.setId(rs.getInt("id"));
                b.setUni_org_type(rs.getString("uni_org_type"));
                b.setUni_org_name(rs.getString("uni_org_name"));
                appBean.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
        }
        return appBean;
    }
}
