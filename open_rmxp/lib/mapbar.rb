class MapBar
  include Glimmer::UI::CustomWidget
  body {
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
end
