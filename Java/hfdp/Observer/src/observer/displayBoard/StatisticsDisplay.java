package observer.displayBoard;

import observer.DisplayElement;
import subject.WeatherData;

import java.util.Observable;
import java.util.Observer;

public class StatisticsDisplay implements DisplayElement, Observer {

    private float temperature;
    private float avgTemperature;
    private float maxTemperature;
    private float minTemperature;
    Observable observable;

    public StatisticsDisplay(Observable observable) {
        this.observable = observable;
        observable.addObserver(this);
    }

    @Override
    public void display() {
        System.out.printf("Avg/Max/Min temperature = %.2f/%.2f/%.2f\n",
                this.avgTemperature, this.maxTemperature, this.minTemperature);
    }


    @Override
    public void update(Observable obs, Object arg) {
        if (obs instanceof WeatherData) {
            WeatherData weatherData = (WeatherData) obs;

            float temp = weatherData.getTemperature();

            this.avgTemperature = this.temperature == 0 ? temp : (this.temperature + temp) / 2;
            this.maxTemperature = Math.max(temp, this.maxTemperature);
            this.minTemperature = this.minTemperature == 0 ? temp : Math.min(temp, this.minTemperature);
            this.temperature = temp;

            display();
        }
    }
}
