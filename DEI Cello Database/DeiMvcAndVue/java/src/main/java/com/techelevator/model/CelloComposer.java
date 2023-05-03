package com.techelevator.model;

public class CelloComposer {
    private int composerId;
    private String composerName;
    private String composerBio;


    public CelloComposer() {
    }

    public CelloComposer(int composerId, String composerName, String composerBio) {
        this.composerId = composerId;
        this.composerName = composerName;
        this.composerBio = composerBio;
    }

    public int getComposerId() {
        return composerId;
    }

    public void setComposerId(int composerId) {
        this.composerId = composerId;
    }

    public String getComposerName() {
        return composerName;
    }

    public void setComposerName(String composerName) {
        this.composerName = composerName;
    }

    public String getComposerBio() {
        return composerBio;
    }

    public void setComposerBio(String composerBio) {
        this.composerBio = composerBio;
    }




}