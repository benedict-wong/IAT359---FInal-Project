package com.example.benedictwong_a2;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.TextView;

public class SelectedSensor extends AppCompatActivity implements SensorEventListener {
    String sensorName;
    int sensorId;
    TextView sensorType;
    SensorManager thisManager;
    TextView sensorDetails;
    private Sensor sensor;
    String sensorDetailString;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_selected_sensor);

        sensorType = findViewById(R.id.sensorName);
        sensorDetails = findViewById(R.id.sensorDetails);
        thisManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        Bundle extraInfo = getIntent().getExtras();
        sensorName = extraInfo.getString("SENSOR_NAME");
        sensorType.setText(sensorName);
        sensorId = extraInfo.getInt("SENSOR_TYPE");
        sensor = thisManager.getDefaultSensor(sensorId);

        Log.d("SENSOR_THIS", "sensorId is: "+ sensorId);



    }

    @Override
    protected void onResume() {
        super.onResume();
        thisManager.registerListener(this, sensor, SensorManager.SENSOR_DELAY_NORMAL);
    }

    protected void onPause() {
        thisManager.unregisterListener(this);
        super.onPause();
    }

    @Override
    public void onSensorChanged(SensorEvent event) {


        Log.d("SENSOR_VALUES", Float.toString(event.values[0]));




    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {

    }
}
                                                                                                                                                                                                                                                                                                                                                                          