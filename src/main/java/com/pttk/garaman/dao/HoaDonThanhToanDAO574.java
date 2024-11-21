package com.pttk.garaman.dao;

import com.pttk.garaman.model.*;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

public class HoaDonThanhToanDAO574 extends DAO574 {
    public HoaDonThanhToanDAO574(){
        super();
    }
    public ArrayList<HoaDonThanhToan574> layDsHoaDonTheoKhachHang(Integer khachHangId, LocalDate ngayBatDau, LocalDate ngayKetThuc){
        ArrayList<HoaDonThanhToan574> danhSachHoaDon = new ArrayList<>();
        String sqlHD = "SELECT hd.* " +
                "FROM tblHoaDonThanhToan574 hd " +
                "LEFT JOIN tblThanhVien574 kh " +
                "ON hd.khachHangId = kh.id " +
                "WHERE kh.id = ? and hd.thoiGian BETWEEN ? AND ? ";
        try{
            PreparedStatement preparedStatement = con.prepareStatement(sqlHD);
            preparedStatement.setInt(1,khachHangId);
            preparedStatement.setDate(2, java.sql.Date.valueOf(ngayBatDau));
            preparedStatement.setDate(3, Date.valueOf(ngayKetThuc));
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                HoaDonThanhToan574 hoaDonThanhToan = new HoaDonThanhToan574();
                hoaDonThanhToan.setId(rs.getInt("id"));
                hoaDonThanhToan.setThoiGian(rs.getTimestamp("thoiGian"));
                hoaDonThanhToan.setTongTien(rs.getFloat("tongTien"));
                hoaDonThanhToan.setTrangThai(rs.getString("trangThai"));
                danhSachHoaDon.add(hoaDonThanhToan);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return danhSachHoaDon;
    }
    public HoaDonThanhToan574 layHoaDonChiTietTheoId(Integer id){
        HoaDonThanhToan574 hoaDonThanhToan = new HoaDonThanhToan574();
        String sqlHD = "select hd.id as id, hd.thoiGian as thoiGian, hd.tongTien as tongTien, hd.trangThai as trangThai, " +
                "xe.id as xeId, xe.bienSo as xeBienSo, xe.moTa as xeMoTa," +
                "kh.id as khId, kh.username as khTK, kh.hoTen as khHoTen," +
                "nv.id as nvId, nv.username as nvTK, nv.hoTen as nvHoTen " +
                "from tblHoaDonThanhToan574 hd " +
                "left join tblXe574 xe on hd.tblXeId = xe.id " +
                "left join tblThanhVien574 kh on hd.khachHangId = kh.id " +
                "left join tblThanhVien574 nv on hd.tblNhanVienId = nv.id " +
                "where hd.id = ?";
        String sqlHDPT = "select hd.id as id, hd.tongTien as tongTien, hd.soLuong as soLuong," +
                "pt.id as ptId, pt.ten as ptTen, pt.gia as ptGia " +
                "from tblHoaDonPhuTung574 hd " +
                "left join tblPhuTung574 pt on hd.tblPhuTungId = pt.id " +
                "where hd.tblHoaDonThanhToanId = ?";
        String sqlHDDV = "select hd.id as id, hd.tongTien as tongTien, hd.soLuong as soLuong," +
                " nv.id as nvId, nv.hoTen as nvHoTen," +
                "dv.id as dvId, dv.ten as dvTen, dv.gia as dvGia " +
                "from tblHoaDonDichVu574 hd " +
                "left join tblThanhVien574 nv on hd.tblThanhVienId = nv.id " +
                "left join tblDichVu574 dv on hd.tblDichVuId = dv.id " +
                "where hd.tblHoaDonThanhToanId = ?";
        try{
            PreparedStatement preparedStatement = con.prepareStatement(sqlHD);
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                hoaDonThanhToan.setId(rs.getInt("id"));
                hoaDonThanhToan.setThoiGian(rs.getTimestamp("thoiGian"));
                hoaDonThanhToan.setTongTien(rs.getFloat("tongTien"));
                hoaDonThanhToan.setTrangThai(rs.getString("trangThai"));
                Xe574 xe = new Xe574();
                xe.setId(rs.getInt("xeId"));
                xe.setBienSo(rs.getString("xeBienSo"));
                xe.setMoTa(rs.getString("xeMoTa"));
                hoaDonThanhToan.setXe(xe);
                KhachHang574 khachHang = new KhachHang574();
                khachHang.setId(rs.getInt("khId"));
                khachHang.setUsername(rs.getString("khTK"));
                khachHang.setHoTen(rs.getString("khHoTen"));
                hoaDonThanhToan.setKhachHang(khachHang);
                NhanVien574 nhanVien = new NhanVien574();
                nhanVien.setId(rs.getInt("nvId"));
                nhanVien.setUsername(rs.getString("nvTK"));
                nhanVien.setHoTen(rs.getString("nvHoTen"));
                hoaDonThanhToan.setNvBanHang(nhanVien);

                // lay danh sach hoa don phu tung
                ArrayList<HoaDonPhuTung574> dsHoaDonPhuTung = new ArrayList<>();
                preparedStatement = con.prepareStatement(sqlHDPT);
                preparedStatement.setInt(1,hoaDonThanhToan.getId());
                ResultSet rsHDPT = preparedStatement.executeQuery();
                while (rsHDPT.next()){
                    HoaDonPhuTung574 hoaDonPhuTung = new HoaDonPhuTung574();
                    hoaDonPhuTung.setId(rsHDPT.getInt("id"));
                    hoaDonPhuTung.setTongTien(rsHDPT.getFloat("tongTien"));
                    hoaDonPhuTung.setSoLuong(rsHDPT.getInt("soLuong"));
                    PhuTung574 phuTung = new PhuTung574();
                    phuTung.setId(rsHDPT.getInt("ptId"));
                    phuTung.setTen(rsHDPT.getString("ptTen"));
                    phuTung.setGia(rsHDPT.getFloat("ptGia"));
                    hoaDonPhuTung.setPhuTung(phuTung);
                    dsHoaDonPhuTung.add(hoaDonPhuTung);
                }
                hoaDonThanhToan.setDsHoaDonPhuTung(dsHoaDonPhuTung);

                // lay danh sach hoa don dich vu
                ArrayList<HoaDonDichVu574> dsHoaDonDichVu = new ArrayList<>();
                preparedStatement = con.prepareStatement(sqlHDDV);
                preparedStatement.setInt(1,hoaDonThanhToan.getId());
                ResultSet rsHDDV = preparedStatement.executeQuery();
                while (rsHDDV.next()){
                    HoaDonDichVu574 hoaDonDichVu = new HoaDonDichVu574();
                    hoaDonDichVu.setId(rsHDDV.getInt("id"));
                    hoaDonDichVu.setTongTien(rsHDDV.getFloat("tongTien"));
                    hoaDonDichVu.setSoLuong(rsHDDV.getInt("soLuong"));
                    NhanVien574 nhanVienKyThuat = new NhanVien574();
                    nhanVienKyThuat.setId(rsHDDV.getInt("nvId"));
                    nhanVienKyThuat.setHoTen(rsHDDV.getString("nvHoTen"));
                    hoaDonDichVu.setNvKyThuat(nhanVienKyThuat);
                    DichVu574 dichVu = new DichVu574();
                    dichVu.setId(rsHDDV.getInt("dvId"));
                    dichVu.setTen(rsHDDV.getString("dvTen"));
                    dichVu.setGia(rsHDDV.getFloat("dvGia"));
                    hoaDonDichVu.setDichVu(dichVu);
                    dsHoaDonDichVu.add(hoaDonDichVu);
                }
                hoaDonThanhToan.setDsHoaDonDichVu(dsHoaDonDichVu);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return hoaDonThanhToan;
    }

}
