package com.pttk.garaman.model;

public class HoaDonDichVu574 {
    private Integer id;
    private float tongTien;
    private int soLuong;
    private DichVu574 dichVu;
    private NhanVien574 nvKyThuat;

    public HoaDonDichVu574() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public float getTongTien() {
        return tongTien;
    }

    public void setTongTien(float tongTien) {
        this.tongTien = tongTien;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public DichVu574 getDichVu() {
        return dichVu;
    }

    public void setDichVu(DichVu574 dichVu) {
        this.dichVu = dichVu;
    }

    public NhanVien574 getNvKyThuat() {
        return nvKyThuat;
    }

    public void setNvKyThuat(NhanVien574 nvKyThuat) {
        this.nvKyThuat = nvKyThuat;
    }
}
