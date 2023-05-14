package com.techelevator.dao;

import com.techelevator.model.CelloComposer;

import java.sql.SQLException;
import java.util.List;

public interface CelloComposerDao {

    List<CelloComposer> getAllComposers() throws SQLException;

    CelloComposer getComposerById(int id) throws SQLException;

    void addComposer(CelloComposer composer) throws SQLException;

    void updateComposer(CelloComposer composer) throws SQLException;

    String getWikipediaArticleByComposerId(int id) throws SQLException;

    void deleteComposer(int id) throws SQLException;

    Integer getComposerIdByComposerName(String name) throws SQLException;
}