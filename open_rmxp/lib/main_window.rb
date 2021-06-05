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

      sash_form(:border) {
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
          composite {
            row_layout {
              type :horizontal
            }
            tool_bar {
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\new.png')
              }
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\open.png')
              }
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\save.png')
              }
            }
            tool_bar {
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\cut.png')
              }
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\copy.png')
              }
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\paste.png')
              }
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\delete.png')
              }
            }
            tool_bar {
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\undo.png')
              }
            }
            tool_bar {
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\layer1.png')
              }
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\layer2.png')
              }
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\layer3.png')
              }
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\layerE.png')
              }
            }
            tool_bar {
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\draw.png')
              }
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\rectangle.png')
              }
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\circle.png')
              }
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\fill.png')
              }
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\select.png')
              }
            }
            tool_bar {
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\zoom1-1.png')
              }
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\zoom1-2.png')
              }
              tool_item(:radio) {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\zoom1-4.png')
              }
            }
            tool_bar {
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\database.png')
              }
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\resources.png')
              }
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\scripts.png')
              }
              tool_item {
                image('G:\Github-stuff\Open-RMXP\open_rmxp\Graphics\menu\soundtest.png')
              }
            }
          }
        }
      }
    }
  end

  def show
    @shell.show
  end
end
