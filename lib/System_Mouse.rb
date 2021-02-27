
#==============================================================================
# ** Mouse
#------------------------------------------------------------------------------
# This is the Mouse Input Class, Custom Mouse controls may be set here.
# I really only made this so you could call Mouse.Held lmao
#==============================================================================
require 'ruby2d'
class Mouse
    #--------------------------------------------------------------------------
    # * Public Instance Variables
    #--------------------------------------------------------------------------
    attr_accessor :held #   Is the middle mouse held?
    attr_accessor :clicktoggle #  Toggle per click
    attr_accessor :moving #   Is the mouse moving?
    attr_accessor :delta_x #   Delta_X
    attr_accessor :delta_y #   Delta_Y
    
    #--------------------------------------------------------------------------
    # * Object Initialization
    #--------------------------------------------------------------------------
    def initialize
        @held = false
        @clicktoggle = false
        @moving = false
        @delta_x = 0
        @delta_y = 0
    end
    
    
    #--------------------------------------------------------------------------
    # * Update
    #--------------------------------------------------------------------------
    def update
        @moving = false
        Window.on :mouse_down do |event|
            case event.button
            when :middle
                @held = true
                if !@downonce #!Added this to make it not hold the input and rapid spam code inside
                    @uponce = false
                    @downonce = true
                    # Code here for single click
                    @clicktoggle = !@clicktoggle
                end
            end
        end
        
        Window.on :mouse_up do |event|
            case event.button
            when :middle
                @held = false
                if !@uponce #!Added this to make it not hold the input and rapid spam code inside
                    @uponce = true
                    @downonce = false
                    # Code here for single click

                end
            end
        end
        
        Window.on :mouse_move do |event|
            @moving = true
            @delta_x = event.delta_x
            @delta_y = event.delta_y
        end
    end

end