package com.pttk.garaman.dao;

import com.pttk.garaman.model.TKKhachHang574;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

public class TKKhachHangDAO574 extends DAO574 {
    public TKKhachHangDAO574(){
        super();
    }
    public ArrayList<TKKhachHang574> layTKKhachHangTheoDoanhThu(LocalDate ngayBatDau, LocalDate ngayKetThuc){
        ArrayList<TKKhachHang574> danhSachKhachHang = new ArrayList<>();
        String sql = "SELECT kh.id, kh.username, kh.hoTen, kh.soDienThoai, SUM(hd.tongTien) AS doanhThu , count(hd.id) as soLuong " +
                "FROM tblHoaDonThanhToan574 hd " +
                "LEFT JOIN tblThanhVien574 kh " +
                "ON hd.khachHangId = kh.id " +
                "WHERE hd.thoiGian BETWEEN ? AND ? " +
                "GROUP BY kh.id";
        try{
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setDate(1, java.sql.Date.valueOf(ngayBatDau));
            preparedStatement.setDate(2, Date.valueOf(ngayKetThuc));
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                TKKhachHang574 khachHang = new TKKhachHang574();
                khachHang.setId(rs.getInt("id"));
                khachHang.setUsername(rs.getString("username"));
                khachHang.setHoTen(rs.getString("hoTen"));
                khachHang.setSoDienThoai(rs.getString("soDienThoai"));
                khachHang.setDoanhThu(rs.getFloat("doanhThu"));
                khachHang.setSoLuong(rs.getInt("soLuong"));
                danhSachKhachHang.add(khachHang);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return danhSachKhachHang;
    }

}
