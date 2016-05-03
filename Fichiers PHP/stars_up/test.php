 public class MainActivity extends Activity {
 private String jsonResult;

 @Override
 protected void onCreate(Bundle savedInstanceState) {
  accessWebService();
 }

 // Async Task to access the web
 private class JsonReadTask extends AsyncTask<String, Void, String> {
  @Override
  protected String doInBackground(String... params) {
   HttpClient httpclient = new DefaultHttpClient();
   HttpPost httppost = new HttpPost(params[0]);
   try {
    HttpResponse response = httpclient.execute(httppost);
    jsonResult = inputStreamToString(response.getEntity().getContent()).toString();
   }

   catch (ClientProtocolException e) {
    e.printStackTrace();
   } catch (IOException e) {
    e.printStackTrace();
   }
   return null;
  }

  private StringBuilder inputStreamToString(InputStream is) {
   String rLine = "";
   StringBuilder answer = new StringBuilder();
   BufferedReader rd = new BufferedReader(new InputStreamReader(is));

   try {
    while ((rLine = rd.readLine()) != null) {
     answer.append(rLine);
    }
   }

   catch (IOException e) {
    // e.printStackTrace();
    Toast.makeText(getApplicationContext(),
      "Error..." + e.toString(), Toast.LENGTH_LONG).show();
   }
   return answer;
  }

  @Override
  protected void onPostExecute(String result) {
   ListDrwaer();
  }
 }// end async task

 public void accessWebService() {
  JsonReadTask task = new JsonReadTask();
  // passes values for the urls string array
  task.execute(new String[] { url });
 }

 // build hash set for list view
 public void ListDrwaer() {
  List<Map<String, String>> employeeList = new ArrayList<Map<String, String>>();

  try {
   JSONObject jsonResponse = new JSONObject(jsonResult);
   JSONArray jsonMainNode = jsonResponse.optJSONArray("emp_info");

   for (int i = 0; i < jsonMainNode.length(); i++) {
    JSONObject jsonChildNode = jsonMainNode.getJSONObject(i);
    String name = jsonChildNode.optString("employee name");
    String number = jsonChildNode.optString("employee no");
    String outPut = name + "-" + number;
    employeeList.add(createEmployee("employees", outPut));
   }
  } catch (JSONException e) {
   Toast.makeText(getApplicationContext(), "Error" + e.toString(),
     Toast.LENGTH_SHORT).show();
  }

  SimpleAdapter simpleAdapter = new SimpleAdapter(this, employeeList,
    android.R.layout.simple_list_item_1,
    new String[] { "employees" }, new int[] { android.R.id.text1 });
  listView.setAdapter(simpleAdapter);
  Toast.makeText(getApplication(), "c", Toast.LENGTH_SHORT).show();

 }

 private HashMap<String, String> createEmployee(String name, String number) {
  HashMap<String, String> employeeNameNo = new HashMap<String, String>();
  employeeNameNo.put(name, number);
  return employeeNameNo;
 }
}