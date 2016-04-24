package com.ppe4.starsup;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Alex on 24/04/2016.
 */
public class ListeActivity extends Activity{
    ListView LVvisites;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_liste);

        LVvisites = (ListView) findViewById(R.id.LVvisites);

        List<Visite> visites = genererVisites();

        VisiteAdapter adapteur = new VisiteAdapter(this, visites);
        LVvisites.setAdapter(adapteur);
    }

    private List<Visite> genererVisites(){
        List<Visite> visites = new ArrayList<>();
        visites.add(new Visite("Florent", "8"));
        visites.add(new Visite("Kevin", "4"));
        visites.add(new Visite("Logan", "5"));
        visites.add(new Visite("Mathieu", "7"));
        visites.add(new Visite("Willy", "9"));
        return visites;
    }
}
