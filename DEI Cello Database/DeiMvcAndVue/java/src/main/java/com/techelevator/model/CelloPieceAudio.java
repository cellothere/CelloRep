package com.techelevator.model;

public class CelloPieceAudio {
    private int audioId;
    private int pieceId;
    private String audioUrl;

    // Constructors, getters, and setters


    public CelloPieceAudio(){

    }

    public CelloPieceAudio(int audioId, int pieceId, String audioUrl) {
        this.audioId = audioId;
        this.pieceId = pieceId;
        this.audioUrl = audioUrl;
    }

    public int getAudioId() {
        return audioId;
    }

    public void setAudioId(int audioId) {
        this.audioId = audioId;
    }

    public int getPieceId() {
        return pieceId;
    }

    public void setPieceId(int pieceId) {
        this.pieceId = pieceId;
    }

    public String getAudioUrl() {
        return audioUrl;
    }

    public void setAudioUrl(String audioUrl) {
        this.audioUrl = audioUrl;
    }
}