package com.pttk.garaman.dao;

import com.pttk.garaman.model.KhachHang574;
import com.pttk.garaman.model.ThanhVien574;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Objects;

public class ThanhVienDAO574 extends DAO574 {
    public ThanhVienDAO574() {
        super();
    }
    public ThanhVien574 login(ThanhVien574 thanhVien){
        if(Objects.nonNull(thanhVien)){
            String sql = "select * from tblThanhVien574 where username = ? and password = ?";
            try{
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1,thanhVien.getUsername());
                preparedStatement.setString(2,thanhVien.getPassword());
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()){
                   ThanhVien574 thanhVien574 = new ThanhVien574();
                   thanhVien574.setId(resultSet.getInt("id"));
                   thanhVien574.setUsername(resultSet.getString("username"));
                   thanhVien574.setVaiTro(resultSet.getString("vaiTro"));
                   return thanhVien574;
                }
            }catch (Exception e){
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }


}
