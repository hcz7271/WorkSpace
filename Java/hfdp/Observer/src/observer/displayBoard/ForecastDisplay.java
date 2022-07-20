package observer.displayBoard;

import observer.DisplayElement;
import subject.WeatherData;

import java.util.Observable;
import java.util.Observer;

public class ForecastDisplay implements DisplayElement, Observer {

    private float pressure;
    private String msg;
    Observable observable;

    public ForecastDisplay(Observable observable) {
        this.observable = observable;
        observable.addObserver(this);
    }

    @Override
    public void display() {
        System.out.printf("Forecast: %s\n", this.msg);
    }


    @Override
    public void update(Observable obs, Object arg) {
        if (obs instanceof WeatherData) {
            WeatherData weatherData = (WeatherData) obs;

            msg = weatherData.getPressure() == this.pressure ? "More of the same" :
                    weatherData.getPressure() > this.pressure ? "Improving weather on the way!" :
                            "Watch out for cooler, rainy weather";
            this.pressure = weatherData.getPressure();
            display();
        }
    }
}
