require 'calabash-cucumber/core'
require 'calabash-cucumber/operations'

class Nadraj

include Calabash::Cucumber::Operations

    def initialize(world)
      @world = world
      DataMagic.yml_directory = 'config'
      DataMagic.load('neiman_marcus.yml')
      @str_screen = data_for(:store_data)
      #@loading_dialogs = LoadingDialogs.new(self)
    end

     def sleep_5sec
         sleep 5
     end
   def shop_screen
   if ENV['DEVICE'] == 'ipad'
   wait_for_none_animating
   touch("view marked:'#{@str_screen['shop_home']}'")
   wait_for_none_animating
   else
   wait_for_none_animating
   touch("view marked:'#{@str_screen['lbl_menu_btn']}'")
   sleep 5
   touch("view marked:'#{@str_screen['shop_home']}'")
   wait_for_none_animating
   sleep 3
   touch("view marked:'#{@str_screen['lbl_menu_btn']}'")
   wait_for_none_animating   
   end
  end
  def clicksearch
    wait_for_none_animating
    touch("view marked:'#{@str_screen['search_icon']}'")
    wait_for_none_animating
  end
  def verify_keypad
    wait_for_none_animating
    element_exists("KBKeyView")
  end
  def enter_input
    if ENV['DEVICE'] == 'ipad'
    wait_for_none_animating
    touch("view marked:'#{@str_screen['search_icon']}'")
    wait_for_none_animating
    keyboard_enter_text "photon"
    keyboard_enter_char("Return")
    else
    wait_for_none_animating
    keyboard_enter_text "photon"
    keyboard_enter_char("Return")
    end
  end
  def verify_results
    wait_for_none_animating
    sleep 5
    element_exists("view marked:'#{@str_screen['search_verifytext']}'")
  end
  def verify_navigation_icons(table)
    sleep 5
    @result_value = []
    i = 0
    table.hashes.each do |args|
    @result_value[i] = args['icons']
    i=i+1
    end
    for i in 0..@result_value.length-1
    unless element_exists("view marked:'#{@result_value[i]}'")
    raise "not found"
    end
    end
  end
  def enter_validinput
    if ENV['DEVICE'] == 'ipad'
    wait_for_none_animating
    touch("view marked:'#{@str_screen['search_icon']}'")
    wait_for_none_animating
    keyboard_enter_text "product"
    keyboard_enter_char("Return")
    else
    sleep 5
    keyboard_enter_text "product"
    keyboard_enter_char("Return")
    end
  end
  def verify_product_detail(tblName, value)
    sleep 6
        @result_value = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1
     end
      product_verify
  end
  def product_verify
   if ENV['DEVICE'] == 'ipad'
     (0..@result_value.length - 1).each do |i|
       if @result_value[i] == 'Product Brand'
         element_exists('label index:51')
       elsif @result_value[i] == 'Product Name'
         element_exists('label index:52')
         element_exists('label index:57')
       elsif @result_value[i] == 'Price'
         element_exists('label index:53')
         element_exists('label index:58')
       else
        raise 'element not found'
       end
      end
      else
          detailverify_iphone
      end
    end

    def detailverify_iphone
       (0..@result_value.length - 1).each do |i|
        if @result_value[i] == 'Product Brand'
         element_exists('label index:51')
       elsif @result_value[i] == 'Product Name'
         element_exists('label index:52')
         element_exists('label index:57')
       elsif @result_value[i] == 'Price'
         element_exists('label index:53')
         element_exists('label index:58')   
       else
        raise 'element not found'
       end
      end
    end
end