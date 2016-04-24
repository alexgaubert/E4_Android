package com.ppe4.starsup;

import android.app.ListActivity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;

import org.apache.http.NameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Alex on 24/04/2016.
 */
public class ListeActivity extends ListActivity{
    private ProgressDialog pDialog;
    JSONParser jParser = new JSONParser();
    ArrayList<HashMap<String, String>> productsList;
    private static String url_all_products = "http://192.168.1.88/stars_up/recup_liste.php";
    private static final String TAG_SUCCESS = "success";
    private static final String TAG_PRODUCTS = "products";
    private static final String TAG_PID = "pid";
    private static final String TAG_NAME = "name";
    JSONArray products = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_liste);

        productsList = new ArrayList<HashMap<String, String>>();
        new LoadAllProducts().execute();
        ListView lv = getListView();
        lv.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                String pid = ((TextView) view.findViewById(R.id.TVid)).getText().toString();
                Intent in = new Intent(getApplicationContext(), DetailsActivity.class);
                in.putExtra(TAG_PID, pid);
                startActivityForResult(in, 100);
            }
        });
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode == 100) {
            Intent intent = getIntent();
            finish();
            startActivity(intent);
        }
    }



    class LoadAllProducts extends AsyncTask<String, String, String> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            pDialog = new ProgressDialog(ListeActivity.this);
            pDialog.setMessage("Loading products. Please wait...");
            pDialog.setIndeterminate(false);
            pDialog.setCancelable(false);
            pDialog.show();
        }

        protected String doInBackground(String... args) {
            List<NameValuePair> params = new ArrayList<NameValuePair>();
            JSONObject json = jParser.makeHttpRequest(url_all_products, "GET", params);
            Log.d("All Products: ", json.toString());
            try {
                int success = json.getInt(TAG_SUCCESS);

                if (success == 1) {
                    products = json.getJSONArray(TAG_PRODUCTS);
                    for (int i = 0; i < products.length(); i++) {
                        JSONObject c = products.getJSONObject(i);
                        String id = c.getString(TAG_PID);
                        String name = c.getString(TAG_NAME);
                        HashMap<String, String> map = new HashMap<String, String>();
                        map.put(TAG_PID, id);
                        map.put(TAG_NAME, name);
                        productsList.add(map);
                    }
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }
        protected void onPostExecute(String file_url) {
            pDialog.dismiss();
            runOnUiThread(new Runnable() {
                public void run() {
                    ListAdapter adapter = new SimpleAdapter(ListeActivity.this, productsList, R.layout.row_visite, new String[] {
                            TAG_PID,
                            TAG_NAME},
                            new int[] { R.id.TVid, R.id.TVnom });
                    setListAdapter(adapter);
                }
            });
        }
    }
}
