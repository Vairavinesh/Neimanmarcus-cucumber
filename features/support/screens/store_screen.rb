# encoding: utf-8
class Store

def initialize(world)
      @world = world
      DataMagic.yml_directory = 'config'
      DataMagic.load('neiman_marcus.yml')
      @str_screen = data_for(:store_data)
end

def sleep_5sec
 sleep 5
end

def tap_service
if ENV['DEVICE'] == 'ipad'
  wait_for_none_animating
  touch("view marked:'#{@str_screen['lbl_strmenu']}'")
  wait_for_none_animating
  sleep 5
  touch('button index:4')
  wait_for_none_animating
  touch("view marked:'#{@str_screen['str_listserv']}'")
  wait_for_none_animating
  else
  tap_service_iphone
end
end

def tap_service_iphone
  wait_for_none_animating
  touch("view marked:'#{@str_screen['lbl_menu_btn']}'")
  wait_for_none_animating
  wait_for_none_animating
  touch("view marked:'#{@str_screen['lbl_strmenu']}'")
  wait_for_none_animating
  sleep 5
  touch('tableViewCell index:1')
  wait_for_none_animating
  touch("view marked:'#{@str_screen['str_listserv']}'")
  wait_for_none_animating
end

def verify_service_available
if ENV['DEVICE'] == 'ipad'
wait_for_none_animating
element_exists('tableViewCell index:5')
else
element_exists('tableViewCell index:0')
end
end

def output_service_list
  if ENV['DEVICE'] == 'ipad'
  wait_for_none_animating
  element_exists('button index:4')
  wait_for_none_animating
  else
    wait_for_none_animating
  element_exists('tableViewCell index:0')
  end
end

def verify_service_detail
  element_exists("view marked: '#{@str_screen['str_service_name']}'")
  element_exists("view marked: '#{@str_screen['str_servicelocat']}'")
  element_exists("view marked: '#{@str_screen['str_service_hour']}'")
  element_exists("view marked: '#{@str_screen['str_serviceph']}'")
  element_exists("view marked: '#{@str_screen['str_servicephmain']}'")
  wait_for_none_animating
end

def service_inside_tap
if ENV['DEVICE'] == 'ipad'
touch('tableViewCell index:5')
wait_for_none_animating
else
wait_for_none_animating
touch('tableViewCell index:0')
wait_for_none_animating
end
end

def click_make_reservation
if ENV['DEVICE'] == 'ipad'
touch('button index:0')
wait_for_none_animating
else
  wait_for_none_animating
  touch("view marked:'servicePopViewMenu'")
end
end

def click_view_menu(arg1)
touch('button index:1')
wait_for_none_animating
end

def tap_out_popup
if ENV['DEVICE'] == 'ipad'
touch('tableViewCell index:1')
wait_for_none_animating
else
wait_for_none_animating
touch('label index:5')
end
end

def tap_sales_associates
  if ENV['DEVICE'] == 'ipad'
  wait_for_none_animating
  touch("view marked:'#{@str_screen['lbl_strmenu']}'")
  wait_for_none_animating
  sleep 5
  touch('button index:4')
  wait_for_none_animating
  wait_for_none_animating
  touch("view marked:'#{@str_screen['str_detailsalesass']}'")
  wait_for_none_animating
  else
  tap_sales_associates_iphone
  end
end

def tap_sales_associates_iphone
  wait_for_none_animating
  touch("view marked:'#{@str_screen['lbl_menu_btn']}'")
  wait_for_none_animating
  wait_for_none_animating
  touch("view marked:'#{@str_screen['lbl_strmenu']}'")
  wait_for_none_animating
  sleep 5
  touch('tableViewCell index:1')
  wait_for_none_animating
  touch("view marked:'#{@str_screen['str_detailsalesass']}'")
  wait_for_none_animating
end

 def scrollupdown
      sleep 5
      scroll('scrollView', :down)
      sleep 5
      scroll('scrollView', :up)
 end

   def verify_servicetable(test)
      sleep 5
      @result_value = []
      i = 0
      test.hashes.each do |args|
      @result_value[i] = args['buttons']
      i = i + 1
     end
      (0..@result_value.length - 1).each do |j|
      unless element_exists("view marked:'#{@result_value[j]}'")
      raise 'element not found'
      end
      end
   end

    def table_element(tblName, value)
       sleep 6
        @result_value = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1
     end
      table_verify
    end

    def table_verify
      if ENV['DEVICE'] == 'ipad'
     (0..@result_value.length - 1).each do |i|
       if @result_value[i] == 'Phone number'
         element_exists('label index:17')
         element_exists('label index:16')
       elsif @result_value[i] == 'Service name'
         element_exists('label index:7')
       elsif @result_value[i] == 'Location'
         element_exists('label index:9')
       elsif @result_value[i] == 'Working hours'
         element_exists('label index:12')
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
       if @result_value[i] == 'Phone number'
         element_exists('label index:19')
         element_exists('label index:20')
       elsif @result_value[i] == 'Service name'
         element_exists('label index:13')
       elsif @result_value[i] == 'Location'
         element_exists('label index:14')
       elsif @result_value[i] == 'Working hours'
         element_exists('label index:11')
       else
        raise 'element not found'
       end
      end
    end

    def service_detail(tblName, value)
       sleep 6
        @result_value = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1
     end
      service_table
    end

    def service_table
      if ENV['DEVICE'] == 'ipad'
     (0..@result_value.length - 1).each do |i|
       if @result_value[i] == 'Service Timing'
         element_exists('label index:2')
       elsif @result_value[i] == 'Contact Information'
         element_exists('label index:1')
       elsif @result_value[i] == 'View Menu button'
         element_exists('label index:5')
       elsif @result_value[i] == 'Back button'
         element_exists('label index:4')
       else
        raise 'element not found'
       end
      end
      else
        servicetable_iphone
      end
    end

    def servicetable_iphone
       (0..@result_value.length - 1).each do |i|
       if @result_value[i] == 'Service Timing'
         element_exists('label index:14')
       elsif @result_value[i] == 'Contact Information'
         element_exists('label index:11')
       elsif @result_value[i] == 'View Menu button'
         element_exists('label index:10')
       elsif @result_value[i] == 'Back button'
         element_exists('label index:5')
       else
        raise 'element not found'
       end
      end
    end
  def verify_msgicon
    wait_for_none_animating
    element_exists("view marked:'#{@str_screen['sales_msgicon']}'")
  end
  def verify_chaticon
    wait_for_none_animating
    element_exists("view marked:'#{@str_screen['sales_chaticon']}'")
  end
end