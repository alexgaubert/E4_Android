package com.ppe4.starsup;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ListeActivity extends AppCompatActivity {
    private ListView LVvisites;
    private TextView tv;

    private static final String URL = "http://192.168.1.88/stars_up/liste.php";

    private RequestQueue fileRequete;
    private StringRequest requete;
    private JSONObject objetJSON;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_liste);
        tv = (TextView) findViewById(R.id.textView);

        MonApplication mApp = ((MonApplication)getApplicationContext());
        final String id_session = mApp.getId_session();

        LVvisites = (ListView) findViewById(R.id.LVvisites);
        final List<Visite> listeVisites = new ArrayList<>();

        VisiteAdapter adapter = new VisiteAdapter(this, listeVisites);
        LVvisites.setAdapter(adapter);



        fileRequete = Volley.newRequestQueue(this);

        requete = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
            @Override
            public void onResponse(String reponse) {
                try {
                    objetJSON = new JSONObject(reponse);
                    listeVisites.add(new Visite(objetJSON.getString("test1"), objetJSON.getString("test2")));
                    tv.setText(objetJSON.getString("test1"));
                } catch (JSONException exception) {
                    exception.printStackTrace();
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
            }
        }) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                HashMap<String, String> dictionnaire = new HashMap<>();
                dictionnaire.put("idUtilisateur", id_session);

                return dictionnaire;
            }
        };
        fileRequete.add(requete);
    }
}
