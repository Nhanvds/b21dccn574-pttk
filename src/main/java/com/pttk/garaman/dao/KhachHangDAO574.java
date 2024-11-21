package com.pttk.garaman.dao;

import com.pttk.garaman.model.KhachHang574;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Objects;

public class KhachHangDAO574 extends DAO574{
    public KhachHangDAO574(){super();}
    public KhachHang574 layThongTinKhachHangTheoId(Integer id){
        if(Objects.nonNull(id)){
            String sql = "select * from tblThanhVien574 where id = ? and vaiTro = ? ";
            try{
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1,id);
                preparedStatement.setString(2,"khachhang");
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()){
                    KhachHang574 khachHang = new KhachHang574();
                    khachHang.setId(resultSet.getInt("id"));
                    khachHang.setUsername(resultSet.getString("username"));
                    khachHang.setHoTen(resultSet.getString("hoTen"));
                    khachHang.setSoDienThoai(resultSet.getString("soDienThoai"));
                    khachHang.setDiaChi(resultSet.getString("diaChi"));
                    khachHang.setVaiTro(resultSet.getString("vaiTro"));
                    return khachHang;
                }
            }catch (Exception e){
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }
}
