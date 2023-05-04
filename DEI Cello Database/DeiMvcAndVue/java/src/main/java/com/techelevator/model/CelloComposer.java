package com.techelevator.model;

public class CelloComposer {
    private int composerId;
    private String composerName;
    private String composerBio;
    private String wikipediaLink;

    public CelloComposer() {
    }

    public CelloComposer(int composerId, String composerName, String composerBio, String wikipediaLink) {
        this.composerId = composerId;
        this.composerName = composerName;
        this.composerBio = composerBio;
        this.wikipediaLink = wikipediaLink;
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

    public String getWikipediaLink() {
        return wikipediaLink;
    }

    public void setWikipediaLink(String wikipediaLink) {
        this.wikipediaLink = wikipediaLink;
    }
}