module space_age;

class SpaceAge
{
    public:

        this(immutable ulong seconds)
        {
            this.seconds = seconds;
        }

        final float on_earth() const
        {
            return this.seconds / this.seconds_in_year;
        }

        final float on_mercury() const
        {
            return this.on_earth() / 0.2408467;
        }
        
        final float on_venus() const
        {
            return this.on_earth() / 0.61519726;
        }
        
        final float on_mars() const
        {
            return this.on_earth() / 1.8808158;
        }
        
        final float on_jupiter() const
        {
            return this.on_earth() / 11.862615;
        }
        
        final float on_saturn() const
        {
            return this.on_earth() / 29.447498;
        }
        
        final float on_uranus() const
        {
            return this.on_earth() / 84.016846;
        }
        
        final float on_neptune() const
        {
            return this.on_earth() / 164.79132;
        }

    private:
        immutable float seconds_in_year = 31_557_600;
        immutable long seconds;
}