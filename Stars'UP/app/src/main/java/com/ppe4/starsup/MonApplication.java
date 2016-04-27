package com.ppe4.starsup;

import android.app.Application;

/**
 * Created by Alex on 26/04/2016.
 */
public class MonApplication extends Application{
    private String id_session;

    public String getId_session() {
        return id_session;
    }

    public void setId_session(String id_session) {
        this.id_session = id_session;
    }
}
