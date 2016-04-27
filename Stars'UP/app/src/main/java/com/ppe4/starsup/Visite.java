package com.ppe4.starsup;

/**
 * Created by Alex on 27/04/2016.
 */
public class Visite {
    private String nom;
    private String note;

    public Visite(String nom,String note) {
        this.setNom(nom);
        this.setNote(note);
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
