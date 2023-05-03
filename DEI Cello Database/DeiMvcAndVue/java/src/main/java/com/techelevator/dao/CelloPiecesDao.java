package com.techelevator.dao;

import com.techelevator.model.CelloPiece;

import java.util.List;

public interface CelloPiecesDao {

    List<CelloPiece> getAllCelloPieces();

    CelloPiece getCelloPieceById(int pieceId);

    void createCelloPiece(CelloPiece celloPiece);

    void updateCelloPiece(CelloPiece celloPiece);

    void deleteCelloPiece(int pieceId);

    List<CelloPiece> getCelloPiecesByComposerId(int composerId);
}