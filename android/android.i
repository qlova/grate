.android {
import android.app.Activity;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;

import java.io.File;
import java.io.InputStream;
import java.util.Hashtable;

public class MainActivity extends Activity implements SensorEventListener {

    Stack.Array game;
    Stack stack = new Stack();

    static Canvas canvas;
    static Paint paint = new Paint();
    static Context context;

    static float accelX, accelY;

    static int touchx, touchy;
    static boolean touching;
    
    static MyView view;
    
    static float ratio = ((float)55)/((float)160);

    SensorManager sman;
    Sensor accel;

    static boolean AccelerometerControl;

    static Hashtable<String, Drawable> images = new Hashtable<String, Drawable>();

    private static float SENSITIVITY = (float)2.5;

    //Set.i
    static float setting_offsetx, setting_offsety, setting_angle;
    
    @Override
    public void onSensorChanged(SensorEvent event) {
        Sensor s = event.sensor;
        if(s.getType() == Sensor.TYPE_ACCELEROMETER){
            accelX = SENSITIVITY * -event.values[0];
            accelY = SENSITIVITY * event.values[1];
        }
    }

    static private long currentTime;
    static private long lastTime;
    static private long dt;
    static public int delta() {
       return (int)(dt*10);
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {

    }

    static public int rgb(int r, int g, int b) {
		return Color.argb(255, r, g, b);
    }
    
    private View.OnTouchListener handleTouch = new View.OnTouchListener() {

        @Override
        public boolean onTouch(View v, MotionEvent event) {

            touchx = (int) event.getX();
            touchy = (int) event.getY();

            switch (event.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    touching = true;
                    break;
                case MotionEvent.ACTION_MOVE:
                    break;
                case MotionEvent.ACTION_UP:
                    touching = false;
                    break;
            }

            return true;
        }
    };

    static public boolean getInput(int n) {
        if (AccelerometerControl) {
            if (n == 0 && touching) {
                return true;
            }
            switch (n) {
                case 1:
                    if (accelX > 5)
                        return true;
                    return false;
                case -1:
                    if (accelX < -5)
                        return true;
                    return false;
                case 2:
                    if (accelY > 5)
                        return true;
                    return false;
                case -2:
                    if (accelY < -5)
                        return true;
                    return false;
            }
        }
        if (touching) {
            switch (n) {
                case 0:
                    if (touchx > (canvas.getWidth() / 3) * 2)
                        return false;
                    if (touchx < (canvas.getWidth() / 3))
                        return false;
                    if (touchy > (canvas.getHeight() / 3) * 2)
                        return false;
                    if (touchy < (canvas.getHeight() / 3))
                        return false;
                    return true;
                case 1:
                    if (touchx > (canvas.getWidth() / 3) * 2)
                        return true;
                    return false;
                case -1:
                    if (touchx < (canvas.getWidth() / 3))
                        return true;
                    return false;
                case 2:
                    if (touchy > (canvas.getHeight() / 3) * 2)
                        return true;
                    return false;
                case -2:
                    if (touchy < (canvas.getHeight() / 3))
                        return true;
                    return false;
            }
        }
        return false;
    }

    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        view = new MyView(this);
        view.setOnTouchListener(handleTouch);
        
        setContentView(view);

        paint.setTextSize(20);

        context = getApplicationContext();

        AccelerometerControl = true;

        sman = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        accel = sman.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        
        ratio = (float)context.getResources().getDisplayMetrics().xdpi;
        System.out.println(ratio);
    }

    static int rgb(int r, int g, int b, int a) {
        return Color.argb(a, r, g, b);
    }

    static public void loadImage(String p) {
        if (p.contains("/")) {
            p = p.split("/")[1];
        }
        try {
            InputStream is = context.getAssets().open(p);
            images.put(p, Drawable.createFromStream(is, p));
        }catch (Exception e) {
            Log.d("null",p+e.getMessage());
        }
    }

    public class MyView extends View {
        public MyView(Context context) {
            super(context);
            // TODO Auto-generated constructor stub
        }

        @Override
        protected void onDraw(Canvas c) {
            // TODO Auto-generated method stub
            super.onDraw(c);
            
            if (canvas == null) {
				System.out.println(c.getWidth());
				System.out.println(c.getHeight());
            }
            
            canvas = c;
            
            

            //Setup game.
            if (game == null) {
                I.Graphics(stack);
                game = stack.grab();
                
                stack.share(game);
				I.new_m_Graphics(stack);
            } else {
            	canvas.drawPaint(paint);
            }
            
			paint.setColor(Color.BLACK);
			paint.setStyle(Paint.Style.FILL);
			canvas.drawPaint(paint);
			paint.setColor(Color.WHITE);
			
			

            currentTime = System.currentTimeMillis();
            dt = currentTime - lastTime;
            lastTime = currentTime;

            stack.share(game);
            I.draw_m_Graphics(stack);

            stack.share(game);
            I.update_m_Graphics(stack);

            try {
                Thread.sleep(1000/60-dt);
            } catch (Exception e) {

            }
            invalidate();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        sman.registerListener(this, accel, SensorManager.SENSOR_DELAY_NORMAL);
    }

    @Override
    protected void onPause() {
        super.onPause();
        sman.unregisterListener(this);
    }
}
class I \{
}
