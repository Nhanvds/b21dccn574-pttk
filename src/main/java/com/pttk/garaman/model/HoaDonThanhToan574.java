package com.pttk.garaman.model;

import java.util.ArrayList;
import java.util.Date;

public class HoaDonThanhToan574 {
    private Integer id;
    private Date thoiGian;
    private float tongTien;
    private String trangThai;
    private NhanVien574 nvBanHang;
    private KhachHang574 khachHang;
    private Xe574 xe;
    private ArrayList<HoaDonDichVu574> dsHoaDonDichVu;
    private ArrayList<HoaDonPhuTung574> dsHoaDonPhuTung;

    public HoaDonThanhToan574() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getThoiGian() {
        return thoiGian;
    }

    public void setThoiGian(Date thoiGian) {
        this.thoiGian = thoiGian;
    }

    public float getTongTien() {
        return tongTien;
    }

    public void setTongTien(float tongTien) {
        this.tongTien = tongTien;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public NhanVien574 getNvBanHang() {
        return nvBanHang;
    }

    public void setNvBanHang(NhanVien574 nvBanHang) {
        this.nvBanHang = nvBanHang;
    }

    public KhachHang574 getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang574 khachHang) {
        this.khachHang = khachHang;
    }

    public Xe574 getXe() {
        return xe;
    }

    public void setXe(Xe574 xe) {
        this.xe = xe;
    }

    public ArrayList<HoaDonDichVu574> getDsHoaDonDichVu() {
        return dsHoaDonDichVu;
    }

    public void setDsHoaDonDichVu(ArrayList<HoaDonDichVu574> dsHoaDonDichVu) {
        this.dsHoaDonDichVu = dsHoaDonDichVu;
    }

    public ArrayList<HoaDonPhuTung574> getDsHoaDonPhuTung() {
        return dsHoaDonPhuTung;
    }

    public void setDsHoaDonPhuTung(ArrayList<HoaDonPhuTung574> dsHoaDonPhuTung) {
        this.dsHoaDonPhuTung = dsHoaDonPhuTung;
    }
}
