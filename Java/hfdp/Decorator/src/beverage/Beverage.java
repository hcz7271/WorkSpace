package beverage;

public abstract class Beverage {

    String description = "Unknown Beverage";
    protected final static int TALL = 1;
    protected final static int GRANDE = 2;
    protected final static int VENTI = 3;
    private int size;

    public String getDescription() {
        return description;
    }

    public abstract double cost();

    public int getSize() {
        return this.size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}