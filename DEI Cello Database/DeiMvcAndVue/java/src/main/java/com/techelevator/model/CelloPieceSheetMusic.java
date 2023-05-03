package com.techelevator.model;

public class CelloPieceSheetMusic {
    private int sheetMusicId;
    private int pieceId;
    private String sheetMusicUrl;

    public CelloPieceSheetMusic(int sheetMusicId, int pieceId, String sheetMusicUrl) {
        this.sheetMusicId = sheetMusicId;
        this.pieceId = pieceId;
        this.sheetMusicUrl = sheetMusicUrl;
    }

    public CelloPieceSheetMusic(){

    }

    public int getSheetMusicId() {
        return sheetMusicId;
    }

    public void setSheetMusicId(int sheetMusicId) {
        this.sheetMusicId = sheetMusicId;
    }

    public int getPieceId() {
        return pieceId;
    }

    public void setPieceId(int pieceId) {
        this.pieceId = pieceId;
    }

    public String getSheetMusicUrl() {
        return sheetMusicUrl;
    }

    public void setSheetMusicUrl(String sheetMusicUrl) {
        this.sheetMusicUrl = sheetMusicUrl;
    }

    // Constructors, getters, and setters
}