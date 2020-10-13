require_relative 'src/parent.rb'
require_relative 'src/controller.rb'
require_relative 'src/parking_slot.rb'
require_relative 'src/car.rb'
require_relative 'src/commands.rb'

class ParkingLot

	def initialize(path = 0)
		@path = path
		@controller = Controller.new
		@commands = {
			'create_parking_lot' => CreateParkingLot.new(@controller),
			'park' => Park.new(@controller),
			'leave' => Leave.new(@controller),
			'status' => Status.new(@controller),
			'registration_numbers_for_cars_with_colour' => RegistrationNumbersForCarsWithColour.new(@controller),
			'slot_numbers_for_cars_with_colour' => SlotNumbersForCarsWithColour.new(@controller),
			'slot_number_for_registration_number' => SlotNumberForRegistrationNumber.new(@controller)
		}
	end

	def read_and_execute(str)
		args = str.gsub(/\\n/, "").split(' ')
		cmd_name = args[0]
		cmd_args = args[1..args.length]
		@commands[cmd_name].execute(cmd_args)
	end

	def call(file = 0)
		case @path
			when 0  #Intractive mode
				while true
					cmd = gets().strip
					break if cmd == 'exit' #exit to stop
					read_and_execute(cmd)
				end
			when 1  #contents of file mode
				cmds = File.readlines(file)
				cmds.each {|cmd| read_and_execute(cmd.strip)}
			else
				puts 'Unknown Input Mode'
		end
	end
end

#for @path:
file = ARGV[0]
unless file.nil?
    ParkingLot.new(1).call(file)
else
    ParkingLot.new(0).call
end