# clase padre o superclase
class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location,purpose,hour,min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end
#clases hijas de appointment
class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location,purpose,hour,min,day)
        super(location,purpose,hour,min)
        @day = day
    end
    # def valida si la cita corresponde al dia
    def occurs_on?(day) 
        day == @day
    end
    # def imprime mensaje en pantalla
    def to_s
        "Reunión mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}."
    end
end

class  DailyAppointment < Appointment
    def occurs_on?(hour,min) 
        hour == @hour && min == @min
    end
    def to_s
        "Reunión diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}."
    end
end

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize(location,purpose,hour,min,day,month,year)
        super(location,purpose,hour,min)
        @day = day
        @month = month
        @year = year
    end  
    def occurs_on?(day,month,year) 
        day == @day && month == @month && year == @year

    end
    def to_s
        "Reunión única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}."
    end  
end 
# pruebas
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)




