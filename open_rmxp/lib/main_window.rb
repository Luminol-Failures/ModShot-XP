class MainWindow
  include Glimmer

  def initialize
    @presenter = SashFormPresenter.new(10, "horizontal")
    @presenter2 = SashFormPresenter.new(10, "vertical")

    @shell = shell {
      grid_layout 1, false
      minimum_size 640, 480
      text "ModShot XP"

      menu_bar {
        menu {
          text "&File"
          menu_item {
            text "&New"
            accelerator :command, :N

            on_widget_selected {
              message_box {
                text "New"
                message "New file created."
              }.open
            }
          }
          menu_item {
            text "&Open..."
            accelerator :command, :O

            on_widget_selected {
              message_box {
                text "Open"
                message "Opening File..."
              }.open
            }
          }
        }

        menu {
          text "Open &Recent"
          menu_item {
            text "File 1"
            on_widget_selected {
              message_box {
                text "File 1"
                message "File 1 Contents"
              }.open
            }
          }
        }
      }

      @sash_1 = sash_form(:border) {
        layout_data(:fill, :fill, true, true) {
          height_hint 200
        }
        sash_width bind(@presenter, :sash_width)
        orientation bind(@presenter, :orientation_style)
        weights 1, 2

        sash_form(:border) {
          layout_data(:fill, :fill, true, true) { }
          sash_width bind(@presenter2, :sash_width)
          orientation bind(@presenter2, :orientation_style)
          weights 2, 1

          label {
            text "tile picker here"
            background :red
            foreground :white
            font height: 30
          }

          @mapinfos = tree { }
        }
        composite(:border) {
          background :white
          map_bar { }
          map_display
        }
      }

      on_swt_Resize {
 #width = @sash_1.swt_widget.get_client_area.width
               #weights = [
               #  1,
               #  2,
               #] unless weights
               #
               #change = 200 / width.to_f
               #weights[0] = change * 1000.0
               #weights[1] = 1000 - weights[0]
               #
               #STDERR.puts weights
               #
               #@sash_1.swt_widget.setWeights weights[0], weights[1]
        }
    }
  end

  def show
    @shell.show
  end
end
