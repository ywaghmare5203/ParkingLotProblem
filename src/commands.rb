class CreateParkingLot < Parent
    def execute(args = [])
        size = args[0]
        @controller.create_parking_lot(size)
    end
end

class Leave < Parent
    def execute(args=[])
        slot_num = args[0].to_i
        @controller.empty_parking_slot(slot_num)
    end
end

class Park < Parent
    def execute(args=[])
        reg_number = args[0]
        colour = args[1]
        @controller.create_car_and_park(reg_number, colour)
    end
end
  
class RegistrationNumbersForCarsWithColour < Parent
    def execute(args=[])
        colour = args[0]
        @controller.registration_numbers_for_cars_with_colour(colour)
    end
end

class SlotNumberForRegistrationNumber < Parent
    def execute(args=[])
        reg_num = args[0]
        @controller.slot_number_for_registration_number(reg_num)
    end
end

class SlotNumbersForCarsWithColour < Parent
    def execute(args=[])
        colour = args[0]
        @controller.slot_numbers_for_cars_with_colour(colour)
    end
end

class Status < Parent
    def execute(args = [])
        @controller.status
    end
end
  