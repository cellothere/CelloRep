package com.techelevator.model;

public class CelloPiece {
    private int pieceId;
    private String pieceName;
    private int composerId;
    private int suzukiBookLevelId;
    private boolean isArrangement;


    public CelloPiece(){

    }

    public CelloPiece(int pieceId, String pieceName, int composerId, int suzukiBookLevelId, boolean isArrangement) {
        this.pieceId = pieceId;
        this.pieceName = pieceName;
        this.composerId = composerId;
        this.suzukiBookLevelId = suzukiBookLevelId;
        this.isArrangement = isArrangement;
    }

    public int getPieceId() {
        return pieceId;
    }

    public void setPieceId(int pieceId) {
        this.pieceId = pieceId;
    }

    public String getPieceName() {
        return pieceName;
    }

    public void setPieceName(String pieceName) {
        this.pieceName = pieceName;
    }

    public int getComposerId() {
        return composerId;
    }

    public void setComposerId(int composerId) {
        this.composerId = composerId;
    }

    public int getSuzukiBookLevelId() {
        return suzukiBookLevelId;
    }

    public void setSuzukiBookLevelId(int suzukiBookLevelId) {
        this.suzukiBookLevelId = suzukiBookLevelId;
    }

    public boolean isArrangement() {
        return isArrangement;
    }

    public void setArrangement(boolean arrangement) {
        isArrangement = arrangement;
    }
// Constructors, getters, and setters
}