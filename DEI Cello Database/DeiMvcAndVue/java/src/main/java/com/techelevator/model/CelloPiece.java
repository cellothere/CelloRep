package com.techelevator.model;

public class CelloPiece {
    private int pieceId;
    private String pieceName;
    private int composerId;
    private int suzukiBookLevelId;
    private boolean isArrangement;
    private String audioLink;
    private String sheetMusicLink;
    private String publisherInfo;
    private String description;
    private String technicalOverview;
    private boolean isPublicDomain;
    private String whereToBuyOrDownload;
    private String duration;

    public CelloPiece() {
    }

    public CelloPiece(int pieceId, String pieceName, int composerId, int suzukiBookLevelId, boolean isArrangement,
                      String audioLink, String sheetMusicLink, String publisherInfo, String description,
                      String technicalOverview, boolean isPublicDomain, String whereToBuyOrDownload, String duration) {
        this.pieceId = pieceId;
        this.pieceName = pieceName;
        this.composerId = composerId;
        this.suzukiBookLevelId = suzukiBookLevelId;
        this.isArrangement = isArrangement;
        this.audioLink = audioLink;
        this.sheetMusicLink = sheetMusicLink;
        this.publisherInfo = publisherInfo;
        this.description = description;
        this.technicalOverview = technicalOverview;
        this.isPublicDomain = isPublicDomain;
        this.whereToBuyOrDownload = whereToBuyOrDownload;
        this.duration = duration;
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

    public String getAudioLink() {
        return audioLink;
    }

    public void setAudioLink(String audioLink) {
        this.audioLink = audioLink;
    }

    public String getSheetMusicLink() {
        return sheetMusicLink;
    }

    public void setSheetMusicLink(String sheetMusicLink) {
        this.sheetMusicLink = sheetMusicLink;
    }

    public String getPublisherInfo() {
        return publisherInfo;
    }

    public void setPublisherInfo(String publisherInfo) {
        this.publisherInfo = publisherInfo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTechnicalOverview() {
        return technicalOverview;
    }

    public void setTechnicalOverview(String technicalOverview) {
        this.technicalOverview = technicalOverview;
    }

    public boolean isPublicDomain() {
        return isPublicDomain;
    }

    public void setPublicDomain(boolean publicDomain) {
        isPublicDomain = publicDomain;
    }

    public String getWhereToBuyOrDownload() {
        return whereToBuyOrDownload;
    }

    public void setWhereToBuyOrDownload(String whereToBuyOrDownload) {
        this.whereToBuyOrDownload = whereToBuyOrDownload;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

}