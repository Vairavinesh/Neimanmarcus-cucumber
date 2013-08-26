require 'calabash-cucumber/core'
require 'calabash-cucumber/operations'

class Product

include Calabash::Cucumber::Operations

    def initialize(world)
      @world = world
      DataMagic.yml_directory = 'config'
      DataMagic.load('neiman_marcus.yml')
      @data = data_for(:store_data)
    end
    
  def product_detailpage
   if ENV['DEVICE'] == 'ipad'
    hme_pge_navi('CONTINUE AS GUEST')
    product_detail_homeipad
   else
    product_detail_homeiphone
   end
  end

  def scrollup
    if ENV['DEVICE'] == 'ipad'
      scroll("scrollView", :down)
      sleep 5
      scroll("scrollView", :up)
    else
     wait_for_none_animating
     swipe("up", {:query => "scrollView index:0"})
     sleep 3
     swipe("down", {:query => "scrollView index:0"})
     wait_for_none_animating
     swipe("up", {:query => "scrollView index:0"})
  end
  end
  def click_image
    if ENV['DEVICE'] == 'ipad'
      wait_for_none_animating
      sleep 5
      touch("imageView index:8")
      sleep 4
    else
      wait_for_none_animating
      touch("imageView index:11")
    end
  end
  def swipe_left
    swipe("left")
    sleep 5
    swipe("left")
  end
  def click_back_button
    if ENV['DEVICE'] == 'ipad'
    wait_for_none_animating
    touch('label index:5')
    else
      wait_for_none_animating
      touch(nil, { offset: { x: 30, y: 72 } })
    end
    
  end

  def product_detail_homeipad
   wait_for_none_animating
   clk_elm('shop_home')
   wait_for_none_animating
   sleep 5
   clk_elm('shop_gftproduct')
   sleep 3
   touch('tableViewCell index:7')
   wait_for_none_animating
   touch("imageView index:7") 
   wait_for_none_animating
   touch("imageView index:9")
   wait_for_none_animating
   wait_for_none_animating
  end
  
  def product_detail_homeiphone
   wait_for_none_animating
   clk_elm('lbl_menu_btn')
   sleep 3
   clk_elm('shop_home')
   wait_for_none_animating
   sleep 3
   clk_elm('shop_gftproduct')
   sleep 3
   clk_elm('lbl_menu_btn')
   wait_for_none_animating
   touch("imageView index:11")
   wait_for_none_animating
   touch("imageView index:11") 
   wait_for_none_animating
   touch("imageView index:13")
   wait_for_none_animating
   sleep 5
   swipe("up", {:query => "scrollView index:0"})
   sleep 3
  end
  
  def productlist_page
    if ENV['DEVICE'] == 'ipad'
      hme_pge_navi('CONTINUE AS GUEST')
      productlist_homeipad
    else
      productlist_homeiphone
    end
  end
  
  def productlist_homeipad
   wait_for_none_animating
   clk_elm('shop_home')
   wait_for_none_animating
   sleep 3
   clk_elm('shop_gftproduct')
   wait_for_none_animating
   sleep 3
   touch('tableViewCell index:7')
   wait_for_none_animating
   touch('imageView index:7') 
   wait_for_none_animating
   touch("imageView index:9")
  end
  
  def productlist_homeiphone
   wait_for_none_animating
   clk_elm('lbl_menu_btn')
   sleep 3
   clk_elm('shop_home')
   wait_for_none_animating
   sleep 3
   clk_elm('shop_gftproduct')
   sleep 3
   clk_elm('lbl_menu_btn')
   wait_for_none_animating
   sleep 3
   touch("imageView index:11")
   wait_for_none_animating
   touch("imageView index:11") 
   wait_for_none_animating
  end
  
  def tap_product_fromlist
    if ENV['DEVICE'] == 'ipad'
      wait_for_none_animating
      touch('label index:9')
      wait_for_none_animating
    else
      touch("imageView index:13")
      sleep 3
      swipe("up", {:query => "scrollView index:0"})
      wait_for_none_animating
    end
  end
  
  def verify_moredetailpopup
    if ENV['DEVICE'] == 'ipad'
      wait_for_none_animating
      elemnt_not_exists('More')
      element_exists("label index:3")
    else
      wait_for_none_animating
      elemnt_not_exists('pd_detail_more_iphone')
      element_exists('label index:2')
    end
  end

  def verify_sizeguidepopup
    if ENV['DEVICE'] == 'ipad'
      wait_for_none_animating
      elemnt_not_exists('More')
      element_exists("label index:5")
    else
    end
  end
  
  def verify_table_element(tblName, value)
       sleep 6
        @result_value = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1
     end
      invoke_loop
   end

    def invoke_loop
     (0..@result_value.length - 1).each do |i|
       if ENV['DEVICE'] == 'ipad'
       if element_exists("view marked:'#{@data[@result_value[i]]}'")
       else
        raise 'table element not found'  
       end
       else
         if @result_value[i] == 'Size guide'
           element_exists("view marked:'#{@data[@result_value[i]]}'")
         elsif @result_value[i] == 'More'
           element_exists("view marked:'#{@data['pd_detail_more_iphone']}'")
         else
            raise 'table element not found'
         end
       end
      end
      end
    def tap_outside_popup
      wait_for_none_animating
      touch(nil, { offset: { x: 0, y: 100 } })
    end
    def verify_back_button_iphone
      unless element_exists("imageView index:10")
        raise "Back button is not available"
      end
    end
    def elemnt_not_exists(arg1)
      if element_does_not_exist("view marked:'#{@data['arg1']}'") == 'false'
        screenshot_and_raise "#{arg1} elment is visible / elememt present in the screen"
      end
    end
    
     # def hme_pge_navi(val)
    # if ENV['DEVICE'] == 'iphone'
      # is_elm_prst('iph_signin_btn') 
      # is_elm_prst('iph_signup_btn')
      # is_elm_prst('iph_cntue_guest_btn') 
    # if val == 'CONTINUE AS GUEST'
      # clk_elm('iph_cntue_guest_btn')
    # elsif val == 'SIGN IN'
      # clk_elm('iph_signin_btn')
    # elsif val == 'SIGN UP'
      # clk_elm('iph_signup_btn')
    # end
    # else
      # is_elm_prst('signin_btn') 
      # is_elm_prst('signup_btn')
      # is_elm_prst('cntue_guest_btn') 
      # if val == 'CONTINUE AS GUEST'
      # clk_elm('cntue_guest_btn')
      # elsif val == 'SIGN IN'
      # clk_elm('signin_btn')
      # elsif val == 'SIGN UP'
      # clk_elm('signup_btn')
      # end
     # end
  # end
  
   def swipe_left_pd_detail
    if element_does_not_exist("view marked:'page 1 of 1'")
    swipe("left")
    sleep 5
    swipe("left")
    else
      puts 'only one image is availale'
    end
  end
  
  def element_verify_labeltext(arg1)
      wait_for_none_animating
      unless element_exists("label text:'#{@data['arg1']}'")
        screenshot_and_raise "#{arg1} elemnt may not visible / may not available"
      end
  end
  
  def verify_option_selected(arg1,table)
  @button_names = []
  i = 0
  table.hashes.each do |args|
  @button_names[i] = args['buttons']
  i=i+1
  end
  (0..@button_names.length-1).each do |k|
   unless element_exists("view marked:'#{@data[@button_names[k]]}'")
    raise "Expected buttons value are not found"  
    end 
  end
  end
  
  # def is_elm_prst(val)
        # wait_for_none_animating
        # @elmval = "#{@data[val]}"
        # if @elmval == ''
        # if element_exists("view marked:'#{val}'")
        # else screenshot_and_raise "#{val} is not present"
        # end
        # else
        # if element_exists("view marked:'#{@data[val]}'")
        # else screenshot_and_raise "#{@data[val]} is not present"
        # end 
        # end
  # end
     
     def clk_elm(elm)
        #wait_for_none_animating
        sleep 4
        @elmval = "#{@data[elm]}"
        if @elmval == ''
        if touch("view marked:'#{elm}'")
        else screenshot_and_raise "#{elm} button is not tapped"
        end
        else
        if touch("view marked:'#{@data[elm]}'")
        else screenshot_and_raise "#{@data[elm]} button is not tapped"
        end 
        end
        wait_for_none_animating
     end
  #--------------------------------
  def fullview_img_verification
      wait_for_none_animating
      elemnt_not_exists('More')
  end
  
  def wishlist_popup
      wait_for_none_animating
      elemnt_not_exists('More')
      element_exists("label index:5")
  end
  
  def enter_text(arg1)
      wait_for_none_animating
      keyborad_enter_text(arg1)
   end
   
   def promotional_offer_verify
      wait_for_none_animating
      elemnt_not_exists('pro_click_fordetails')
      element_exists("label index:5")
   end
   
end