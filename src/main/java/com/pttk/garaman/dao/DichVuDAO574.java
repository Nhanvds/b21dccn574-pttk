package com.pttk.garaman.dao;

import com.pttk.garaman.model.DichVu574;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Objects;

public class DichVuDAO574 extends DAO574 {
    public DichVuDAO574() {
        super();
    }

    public ArrayList<DichVu574> timKiemDichVuTheoTen(String key) {
        ArrayList<DichVu574> dichVuList = new ArrayList<>();
        if (Objects.nonNull(key)) {
            String sql = "select * from tblDichVu574 where ten like ?";
            try {
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setString(1, "%" + key + "%");
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    DichVu574 dichVu = new DichVu574();
                    dichVu.setId(resultSet.getInt("id"));
                    dichVu.setTen(resultSet.getString("ten"));
                    dichVu.setGia(Float.parseFloat(resultSet.getString("gia")));
                    dichVuList.add(dichVu);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dichVuList;
    }

    public DichVu574 layChiTietDichVuTheoId(Integer id) {
        DichVu574 dichVu = new DichVu574();
        if (Objects.nonNull(id)) {
            String sql = "select * from tblDichVu574 where id = ?";
            try {
                PreparedStatement preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, id);
                ResultSet resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    dichVu.setId(resultSet.getInt("id"));
                    dichVu.setTen(resultSet.getString("ten"));
                    dichVu.setGia(Float.parseFloat(resultSet.getString("gia")));
                    dichVu.setMoTa(resultSet.getString("moTa"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return dichVu;
    }


}
