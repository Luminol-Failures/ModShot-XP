require_relative "open_rmxp/requires"
include Glimmer

@presenter = SashFormPresenter.new(10, "horizontal")
@presenter2 = SashFormPresenter.new(10, "vertical")

shell {
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

  sash_form {
    layout_data(:fill, :fill, true, true) {
      height_hint 200
    }
    sash_width bind(@presenter, :sash_width)
    orientation bind(@presenter, :orientation_style)
    weights 1, 2

    sash_form {
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
      label {
        text "mapinfos here"
        background :red
        foreground :white
        font height: 30
      }
    }
    composite {
      cool_bar {
        @tool_bar = tool_bar {
          tool_item {
            set_text "A"
          }
          tool_item {
            set_text "B"
          }
          tool_item {
            set_text "C"
          }
        }
        @tool_bar2 = tool_bar {
          tool_item {
            set_text "Z"
          }
          tool_item {
            set_text "X"
          }
          tool_item {
            set_text "Y"
          }
        }

        @item = cool_item {
          set_control(@tool_bar.swt_widget)

          set_preferred_size(80, 30)
        }

        @item2 = cool_item {
          set_control(@tool_bar2.swt_widget)

          set_preferred_size(80, 30)
        }
      }
    }
  }
}.open
