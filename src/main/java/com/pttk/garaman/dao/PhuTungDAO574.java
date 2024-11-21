package com.pttk.garaman.dao;

import com.pttk.garaman.model.DichVu574;
import com.pttk.garaman.model.PhuTung574;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Objects;

public class PhuTungDAO574 extends DAO574 {
    public PhuTungDAO574() {
        super();
    }
    public ArrayList<PhuTung574> timKiemPhuTungTheoTen(String key){
        ArrayList<PhuTung574> phuTungList = new ArrayList<>();
        if (Objects.nonNull(key)) {
            String sql = "select * from tblPhuTung574 where ten like ?";
            try {
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, "%" + key + "%");
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    PhuTung574 phuTung = new PhuTung574();
                    phuTung.setId(resultSet.getInt("id"));
                    phuTung.setTen(resultSet.getString("ten"));
                    phuTung.setGia(Float.parseFloat(resultSet.getString("gia")));
                    phuTung.setSlCon(Integer.parseInt(resultSet.getString("slCon")));
                    phuTungList.add(phuTung);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return phuTungList;
    }
    public PhuTung574 layChiTietPhuTungTheoId(Integer id) {
        PhuTung574 phuTung = new PhuTung574();
        if (Objects.nonNull(id)) {
            String sql = "select * from tblPhuTung574 where id = ?";
            try {
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, id);
                ResultSet resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    phuTung.setId(resultSet.getInt("id"));
                    phuTung.setTen(resultSet.getString("ten"));
                    phuTung.setGia(Float.parseFloat(resultSet.getString("gia")));
                    phuTung.setMoTa(resultSet.getString("moTa"));
                    phuTung.setSlCon(resultSet.getInt("slCon"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return phuTung;
    }

}
