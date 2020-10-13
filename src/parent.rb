class Parent
    def initialize(controller)
        @controller = controller
    end

    def execute(args = [])
        raise '404: command not found'
    end
end