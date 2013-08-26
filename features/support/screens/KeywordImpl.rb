# require 'calabash-cucumber/core'
# require 'calabash-cucumber/operations'
# 
# class Keyword
# 
# include Calabash::Cucumber::Operations
# 
    # def initialize(world)
      # @world = world
      # DataMagic.yml_directory = 'config'
      # DataMagic.load('neiman_marcus.yml')
      # @str_screen = data_for(:store_data)
    # end
#     
    # def click_button(arg1)
      # wait_for_none_animating
      # if arg1!=nil
      # touch("view marked:'#{@str_screen[arg1]}'")
      # wait_for_none_animating
      # else 
        # screenshot_and_raise "#{arg1} not able to click/Nil"
      # end
    # end
#     
    # def is_element_present(arg1)
      # wait_for_none_animating
      # puts @str_screen[arg1]
      # unless element_exists("view marked:'#{@str_screen[arg1]}'")
        # screenshot_and_raise "#{arg1} elemnt may not visible/may not available"
      # end
    # end
#     
    # def elemnt_not_exists(arg1)
      # unless element_does_not_exist("view marked:'#{@str_screen['arg1']}'")
        # screenshot_and_raise "#{arg1} elment is visible/ elememt present in the screen"
      # end
    # end
#     
    # def enter_text(arg1)
      # wait_for_none_animating
      # keyborad_enter_text(arg1)
    # end
#     
#     

     # def is_elm_prst(arg1)
      # wait_for_none_animating
      # unless element_exists("view marked:'#{@data[arg1]}'")
        # screenshot_and_raise "#{arg1} elemnt may not visible / may not available"
      # end
    # end
#     
    # def clk_elm(arg1)
      # wait_for_none_animating
      # if arg1!=nil
      # touch("view marked:'#{@data[arg1]}'")
      # wait_for_none_animating
      # else 
        # screenshot_and_raise "#{arg1} not able to click / Nil"
      # end
    # end
    
# end