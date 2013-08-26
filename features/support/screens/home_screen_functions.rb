require 'calabash-cucumber/core'
require 'calabash-cucumber/operations'

class HomeScreenFunctions

include Calabash::Cucumber::Operations

    def initialize(world)
      @world = world
      DataMagic.yml_directory = 'config'
      DataMagic.load('neiman_marcus.yml')
      @str_screen = data_for(:store_data)
    end

     def sleep_5sec
         sleep 5
     end

   def verify_elements
      if ENV['DEVICE'] == 'ipad'
        element_exists("view marked:'#{@str_screen['lbl_shopicon']}'")
        element_exists("view marked:'#{@str_screen['lbl_notificon']}'")
        element_exists("view marked:'#{@str_screen['lbl_srchicon']}'")
        wait_for_none_animating
      else
        element_exists("view marked:'#{@str_screen['lbl_menu_btn']}'")
        element_exists("view marked:'#{@str_screen['lbl_shopicon']}'")
        element_exists("view marked:'#{@str_screen['lbl_notificon']}'")
        element_exists("view marked:'#{@str_screen['lbl_srchicon']}'")
        wait_for_none_animating
      end
   end

  def verify_storeclick
      if ENV['DEVICE'] == 'ipad'
      touch("view marked:'#{@str_screen['lbl_strmenu']}'")
      wait_for_none_animating
      else
      wait_for_none_animating
      touch("view marked:'#{@str_screen['lbl_menu_btn']}'")
      sleep_5sec
      touch("view marked:'#{@str_screen['lbl_strmenu']}'")
      wait_for_none_animating
      end
  end

  def verify_networkmsg(arg1)
  wait_for_none_animating
  element_exists("view marked:'#{arg1}'")
  wait_for_none_animating
  raise 'Text may not available'
  end

end