class Controller


    def initialize
        @parking_lot_size = 0
        @parking_slots = [] #Array for parking slots in parkingLot
    end


    def create_parking_lot(size)
        @parking_lot_size = size
        size.to_i.times do |i|
            @parking_slots << ParkingSlot.new(i+1)
        end
        puts "Created a parking lot with #{size} slots\n"
    end


    def create_car_and_park(reg_num, colour)
        car = Car.new(reg_num, colour)
        slot = @parking_slots.find{|slot| slot.car.nil?} #first nil slot
        return puts "Sorry, parking lot is full\n" if slot.nil?
        puts "Allocated slot number: #{slot.slot_num}\n"
        slot.car = car
        car.parking_slot = slot
    end


    # get empty slot 
    def empty_parking_slot(slot_num)
        puts "Slot number #{slot_num} is free\n"
        @parking_slots[slot_num-1] = ParkingSlot.new(slot_num)
    end


    # parkingLot status 
    def status
        puts "Slot No.    Registration No    Colour\n"
        @parking_slots.each do |slot|
          unless slot.car.nil?
            puts "#{slot.slot_num}      #{slot.car.registration_num}      #{slot.car.colour}\n"
          end
        end
    end


    # to find all car's registration number from there colour
    def registration_numbers_for_cars_with_colour(colour)
        puts @parking_slots.map{|slot| slot.car.registration_num if slot.car.colour == colour}.compact.join(', ') + "\n"
    end
    

    # to find all slot numbers of cars of some specific colour
    def slot_numbers_for_cars_with_colour(colour)
        puts @parking_slots.map{|slot| slot.slot_num if slot.car.colour == colour}.compact.join(', ') + "\n"
    end
    

    # get slot number from a car's registration number
    def slot_number_for_registration_number(reg_num)
        slot = @parking_slots.find{|slot| slot.car.registration_num == reg_num}
        puts slot.nil? ?  "Not found\n" : slot.slot_num.to_s + "\n"
    end
end
  