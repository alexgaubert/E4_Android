package com.ppe4.starsup;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
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

import java.util.HashMap;
import java.util.Map;

public class LoginActivity extends AppCompatActivity {
    private static final String URL = "http://192.168.1.88/stars_up/user_control.php";
    private EditText ETnomUtilisateur, ETMDP;
    private Button Bconnexion;
    private RequestQueue fileRequete;
    private StringRequest requete;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        ETnomUtilisateur = (EditText) findViewById(R.id.ETnomUtilisateur);
        ETMDP = (EditText) findViewById(R.id.ETMDP);
        Bconnexion = (Button) findViewById(R.id.Bconnexion);
        fileRequete = Volley.newRequestQueue(this);

        Bconnexion.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                requete = new StringRequest(Request.Method.POST, URL, new Response.Listener<String>() {
                    @Override
                    public void onResponse(String reponse) {
                        try {
                            JSONObject objetJSON = new JSONObject(reponse);
                            if (objetJSON.names().get(0).equals("succes")) {
                                Toast.makeText(getApplicationContext(), objetJSON.getString("succes"), Toast.LENGTH_SHORT).show();
                                startActivity(new Intent(getApplicationContext(), ListeActivity.class));
                            }
                            else {
                                Toast.makeText(getApplicationContext(), objetJSON.getString("erreur"), Toast.LENGTH_SHORT).show();
                            }
                        }
                        catch (JSONException exception) {
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
                        dictionnaire.put("nomUtilisateur", ETnomUtilisateur.getText().toString());
                        dictionnaire.put("MDP", ETMDP.getText().toString());

                        return dictionnaire;
                    }
                };
                fileRequete.add(requete);
            }
        });
    }
}
