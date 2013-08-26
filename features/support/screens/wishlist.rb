require 'calabash-cucumber/core'
require 'calabash-cucumber/operations'

class WishList

include Calabash::Cucumber::Operations

    def initialize(world)
      @world = world
      DataMagic.yml_directory = 'config'
      DataMagic.load('neiman_marcus.yml')
      @data = data_for(:store_data)
    end
    
  def elemnt_not_exists(arg1)
    if element_does_not_exist("view marked:'#{@data['arg1']}'") == 'false'
    screenshot_and_raise "#{arg1} elment is visible / elememt present in the screen"
    end
  end
  def element_verify_labeltext(arg1)
      wait_for_none_animating
      unless element_exists("label text:'#{@data['arg1']}'")
        screenshot_and_raise "#{arg1} elemnt may not visible / may not available"
      end
  end
  
  def is_elm_prst(val)
    sleep 4
        #wait_for_none_animating
        @elmval = "#{@data[val]}"
        if @elmval == ''
        if element_exists("view marked:'#{val}'")
        else screenshot_and_raise "#{val} is not present"
        end
        else
        if element_exists("view marked:'#{@data[val]}'")
        else screenshot_and_raise "#{@data[val]} is not present"
        end 
        end
  end
     
     def clk_elm(elm)
        wait_for_none_animating
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
     
   def enter_text(arg1)
      wait_for_none_animating
      keyborad_enter_text(arg1)
   end
   
   def wait_for_ldg
    sleep 3
    # sleep 2
    # if element_exists("view marked:'In progress'")
    # wait_for_elements_do_not_exist(["activityIndicatorView"], timeout: 10000)
    # else
    # wait_for_none_animating
    # end
  end
   
   def entr_txt(val,id)
    @elmval = "#{@data[val]}"
    if @elmval == ''
        if element_exists("view marked:'#{id}'")
           touch("view marked:'#{@data[id]}'")
           keyboard_enter_text "#{val}"
           wait_for_none_animating
           done
           wait_for_none_animating
        else screenshot_and_raise "#{@data[id]} field is not present"
        end
      else
        if element_exists("view marked:'#{@data[id]}'")
           touch("view marked:'#{@data[id]}'")
           keyboard_enter_text @elmval
           wait_for_none_animating
           done
           wait_for_none_animating
       else screenshot_and_raise "#{@data[id]} field is not present"
       end
    end
    end
    
# --------------Commom method END-------------------------#
#----------------NAD Methods -----------------------------#
   def scrl_view(val)
    wait_for_ldg
    swipe("#{val}", {:query => "scrollView index:0"})
   end
   
   def hme_pge_popup(val)
    if ENV['DEVICE'] == 'ipad'
       if element_exists("view marked:'#{val}'")
            touch("view marked:'#{val}'")
            wait_for_ldg
       else screenshot_and_raise "#{val} is not present"
       end
    else
    wait_for_ldg
    if element_exists("view marked:'#{val}'")
        touch("view marked:'#{val}'")
        wait_for_ldg
    else screenshot_and_raise "#{val} is not present"
    end
   end  
   end
  
  def verify_home_page
   wait_for_ldg
   if ENV['DEVICE'] == 'iphone'
      home_element = ["HOME","ACCOUNT","STORES","INCIRCLE","SHOP"]
      i=0 
      while i<home_element.length do
          if (element_does_not_exist("view marked:'#{home_element[i]}'"))
             screenshot_and_raise "Categories '#{home_element[i]}' not found"
          end
         i+=1
       end
     end 
   end
   
 def entr_txt_email(val1,val2)
   wait_for_ldg
   @elmval = "#{@data[val1]}"
     if element_exists("textField index:0")
      set_text("textField index:0","")      # this is app issue
      touch("textField index:0") 
      wait_for_ldg
      keyboard_enter_text @data[val2]
      wait_for_ldg
      done
      wait_for_ldg
      else screenshot_and_raise "#{@data[val2]} is not present"
     end
  end
  
  def entr_txt_pwd(val1,val2)
    wait_for_ldg
    @elmval = "#{@data[val1]}"
    if element_exists("textField index:1")
    touch("textField index:1") 
    wait_for_ldg
    keyboard_enter_text @data[val2]
    wait_for_ldg
    done
    wait_for_ldg
    else screenshot_and_raise "#{@data[val2]} is not present"
    end
  end
 # ------------------------NAD Method End-------------------------- 
    def table_element_account(tblName, value)
       sleep 6
        @result_value = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1
     end
       (0..@result_value.length - 1).each do |j|
       if element_exists("view marked:'#{@result_value[j]}'")
       else
        raise 'table element not found'  
       end
      end
   end
      
   def table_element_text(tblName, value)
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
       if element_exists("label text:'#{@result_value[i]}'")
       else
        raise 'table element not found'  
       end
      end
   end
   
   def profileinfo_verify_iphone
     is_elm_prst('acc_incrle_btn')
     is_elm_prst('acc_edit_btn')
     is_elm_prst('acc_log_out_btn')
     scrl_view("up")
     is_elm_prst('acc_screen_edit_wish')
     is_elm_prst('acc_screen_addcart_wish')
     scrl_view('down')
   end
   
   def profileinfo_verify_ipad
     scrl_view('up')
     is_elm_prst('incl_viewincl_detail_ipad')
     is_elm_prst('incl_edit_info_ipad')
     is_elm_prst('incl_logout_ipad')
     is_elm_prst('incl_myacc_page_ipad')
   end
   
  def verify_networkmsg(arg1)
  wait_for_none_animating
  element_exists("view marked:'#{arg1}'")
  wait_for_none_animating
  raise 'Text may not available'
  end
  
  def table_element_input(tblName, value)
       sleep 6
        @result_value = []
        @input_field = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1
     end
      invoke_input_loop
   end
   
    def invoke_input_loop
     (0..@result_value.length - 1).each do |i|
       entr_txt_email('#{@result_value[i]}','#{@input_field[i]}')
      end
   end
   
   def label_text_ele_pre(val)
        unless element_exists("label text:'#{@data[val1]}'")
        screenshot_and_raise "element is not present"
        end
   end
  
  def label_text_ele_click(val)
        unless touch("label text:'#{@data[val1]}'")
        screenshot_and_raise "element is not present"
        end
   end
   
   def clear_field
      set_text("textField index:0","")      # this is app issue
      touch("textField index:0") 
    end
    
 def enter_input_details(tblName, value)
     sleep 6
     home_element = ["BillingAddress","CardTypeDropdown","CardNumber","Expiration"]
        @result_value = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1
      end
       (0..@result_value.length - 1).each do |j|
       if j==0
         sleep 7
         set_text("view marked:'BillingAddress'", "#{@result_value[j]}")
       elsif j==1
         sleep 7
         touch("view marked:'CardTypeDropdown'")
         sleep 5
         touch("view marked:'Visa'")
         sleep 5
         touch("view marked:'DONE'")
       elsif j==2
         sleep 5
         set_text("view marked:'CardNumber'", "#{@result_value[j]}")
         sleep 5
       elsif j==3
         sleep 7
         touch("view marked:'Expiration'")
         if ENV['DEVICE'] == 'ipad'
           touch(nil, { offset: { x: 176, y: 960 } }) # month
           touch(nil, { offset: { x: 576, y: 960 } }) # year
           sleep 5
         else
         touch(nil, { offset: { x: 100, y: 410 } }) # month
         touch(nil, { offset: { x: 280, y: 410 } })
         sleep 5
         end
         touch("view marked:'DONE'")
         sleep 7
       else
         raise "Not able to Enter the Inputs"
       end
      end
   end
   
   def verify_mask_value_ipad
     @masked_value="MasterCard ************"
     @arr = query("label", :text)[16].split('')[23]
     @arr1 = query("label", :text)[16].split('')[24]
     @arr2 = query("label", :text)[16].split('')[25]
     @arr3 = query("label", :text)[16].split('')[26]
     @val = @arr+@arr1+@arr2+@arr3
     @masked_value_home=@masked_value+@val
     unless element_does_not_exist("view marked:'#{@masked_value_home}'")
       raise "Not able to verify masked value"
     end
   end
   
   def verify_mask_value_iphone
     @masked_value="MasterCard ************"
     @arr = query("label", :text)[16].split('')[23]
     @arr1 = query("label", :text)[16].split('')[24]
     @arr2 = query("label", :text)[16].split('')[25]
     @arr3 = query("label", :text)[16].split('')[26]
     @val = @arr+@arr1+@arr2+@arr3
     @masked_value_home=@masked_value+@val
     unless element_does_not_exist("view marked:'#{@masked_value_home}'")
       raise "Not able to verify masked value"
     end
   end
   
   #-----NAD New Function--------
   
   def entr_txt_data(val)
    @elmval = "#{@data[val]}"
    if @elmval == ''
        if element_exists("view marked:'#{val}'")
        else screenshot_and_raise "#{val} is not present"
        end
    else
        if element_exists("view marked:'#{@data['strs_search_txtfld']}'")
           touch("view marked:'#{@data['strs_search_txtfld']}'")
           keyboard_enter_text @data['strs_search_txt']
           wait_for_none_animating
           done
           wait_for_none_animating
       else screenshot_and_raise "#{@data[val]} is not present"
       end
    end
  end

def entr_txt_email(val1,val2)
  wait_for_none_animating
    @elmval = "#{@data[val1]}"
    # if @elmval == ''
       # if element_exists("view marked:'#{val1}'")
       # if element_exists("textField index:0")
        # else screenshot_and_raise "ele is not present"
        # end
    # else
           if element_exists("textField index:0")
           #touch("view marked:'#{@data[val1]}'")
           set_text("textField index:0","")      # this is app issue
           touch("textField index:0") 
           #touch("view marked:'#{@data[val1]}'")
           #wait_for_none_animating
           sleep 0.5
           keyboard_enter_text @data[val2]
           sleep 0.5
           done
           wait_for_none_animating
       else screenshot_and_raise "#{@data[val2]} is not present"
       end
    # end
  end

def entr_txt_pwd(val1,val2)
  wait_for_none_animating
    @elmval = "#{@data[val1]}"
    # if @elmval == ''
       # if element_exists("view marked:'#{val1}'")
       # if element_exists("textField index:0")
        # else screenshot_and_raise "ele is not present"
        # end
    # else
           if element_exists("textField index:1")
           #touch("view marked:'#{@data[val1]}'")
           touch("textField index:1") 
           #touch("view marked:'#{@data[val1]}'")
           #wait_for_none_animating
           sleep 0.5
           keyboard_enter_text @data[val2]
           sleep 0.5
           done
           wait_for_none_animating
       else screenshot_and_raise "#{@data[val2]} is not present"
       end
    # end
  end

def entr_bill_add(id,val)
    @elmval = "#{@data[val]}"
    sleep 1
    if @elmval == ''
        if element_exists("view marked:'#{id}'")
           touch("view marked:'#{@data[id]}'")
           set_text("view marked:'#{@data[id]}'", "")
           set_text("view marked:'#{@data[id]}'", "#{val}")
           # keyboard_enter_text "#{val}"
           wait_for_none_animating(timeout: @timeout_twnty)
           # done
           # wait_for_none_animating(timeout: @timeout_twnty)
        else raise "#{@data[id]} field is not present"
        end
    else
        if element_exists("view marked:'#{@data[id]}'")
           touch("view marked:'#{@data[id]}'")
           set_text("view marked:'#{@data[id]}'", "")
           set_text("view marked:'#{@data[id]}'", @elmval)
           # keyboard_enter_text @elmval
           wait_for_none_animating(timeout: @timeout_twnty)
           # done
           # wait_for_none_animating(timeout: @timeout_twnty)
       else raise "#{@data[id]} field is not present"
       end
    end

  end



def hme_pge_popup(val)
  wait_for_none_animating
  if ENV['DEVICE'] == 'ipad'
       if element_exists("view marked:'#{val}'")
            touch("view marked:'#{val}'")
            wait_for_none_animating
       else screenshot_and_raise "#{val} is not present"
       end
  else
    wait_for_none_animating
    if element_exists("view marked:'#{val}'")
        touch("view marked:'#{val}'")
        wait_for_none_animating
    else screenshot_and_raise "#{val} is not present"
    end
    
  end  
  
end

def edt_txt_fld(idx, val)
  if element_exists("textField index:'#{idx}'")
           set_text("textField index:'#{idx}'","")
           touch("textField index:'#{idx}'")
           sleep 0.5
           keyboard_enter_text @data[val]
           sleep 0.5
           done
           wait_for_none_animating
       else screenshot_and_raise "#{@data[val]} is not present"
       end
  
end

def inpt_txt_data(fld, val)
  if ENV['DEVICE'] == 'iphone'
    scroll("view", :down)
  end
  if element_exists("view marked:'#{@data[fld]}'")
       touch("view marked:'#{@data[fld]}'")
       wait_for_none_animating
       sleep 0.5
       keyboard_enter_text @data[val]
       sleep 0.5
       done
       wait_for_none_animating
  else screenshot_and_raise "#{@data[val]} is not present"
  end
 end

  def verify_creditcard_detail(tblName, value)
    # set_text("view marked:'CardNumber'","")
    # set_text("view marked:'BillingAddress'","")
    sleep 6
        @result_value = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1
     end
      cc_detil_verify
  end  
  
  def cc_detil_verify

    if ENV['DEVICE'] == 'ipad'
         (0..@result_value.length - 1).each do |i|
         if @result_value[i] == 'visa'
           clk_elm('CardTypeDropdown')
           touch(nil, { offset: { x: 376, y: 950 } })
           tap_done_btn()
         elsif @result_value[i] == '05/16'
           touch("view marked:'08/2014'")
           touch(nil, { offset: { x: 176, y: 960 } }) # month
           touch(nil, { offset: { x: 576, y: 960 } }) # year
           tap_done_btn()
         elsif @result_value[i] == '43546568565656'
           # enter credit card no
           #inpt_txt_data('txt_card_fld','txt_ans_val' )
            entr_bill_add('txt_card_fld','txt_card_val')
         elsif @result_value[i] == '420 water Ave, Newyork 10025'
         # enter Billing address
           entr_bill_add('txt_bill_add','shp_add_val')
         else
          screenshot_and_raise 'element not found'
         end
      end
      else
          cc_detlverify_iphone
      end
    end

    def cc_detlverify_iphone
       (0..@result_value.length - 1).each do |i|
        if @result_value[i] == 'visa'
          clk_elm('CardTypeDropdown')
          touch(nil, { offset: { x: 376, y: 950 } })
          tap_done_btn()
       elsif @result_value[i] == '05/16'
         touch("view marked:'08/2014'")
         touch(nil, { offset: { x: 176, y: 960 } }) # month
         touch(nil, { offset: { x: 576, y: 960 } }) # year
         tap_done_btn()
       elsif @result_value[i] == '43546568565656'
         # enter credit card no
         inpt_txt_data('txt_ans_fld','txt_ans_val' )
       elsif @result_value[i] == '420 water Ave, Newyork 10025'
         # enter Billing address
         inpt_txt_data('txt_ans_fld','txt_ans_val' )
       else
        screenshot_and_raise 'element not found'
       end
      end
    end

   def collect_cc_details
     # $crdt_card_type = query("label", :text)[59]
     # puts $crdt_card_type
     # $crdt_card_no = query("label", :text)[60]
     # puts $crdt_card_no
     # $payment_mthd = $crdt_card_type + " " + $crdt_card_no
   end
  
   def tap_done_btn
    sleep 3
    if element_exists("view marked:'DONE'")
       touch("view marked:'DONE'")
    else
    end     
  end

   def get_crd_crd_info
     arr_values = []
     (0..100).each do|k|
        arr_values[k] = query("label", :text)[k] 
     end
     (0..arr_values.length - 1).each do|m|
         if arr_values[m] != nil
            if ENV['DEVICE'] == 'ipad'
              arr_values[m] = query("label", :text)[m].include?('PAYMENT')
            else
              arr_values[m] = query("label", :text)[m].include?('Confirm Password')
            end     
            if arr_values[m].to_s == 'true'
            @indexValue = m
            end
         end
    end
    if ENV['DEVICE'] == 'ipad'
       card_type =  @indexValue + 1
       card_no =  @indexValue + 2
       $crdt_card_type = query("label", :text)[card_type]
       $crdt_card_no = query("label", :text)[card_no]
       $payment_mthd = $crdt_card_type + " " + $crdt_card_no
    else
       card_type =  @indexValue + 2
       card_no =  @indexValue + 3
       $crdt_card_type = query("label", :text)[card_type]
       $crdt_card_no = query("label", :text)[card_no]
       $payment_mthd = $crdt_card_type + " " + $crdt_card_no
    end      
  end
  
   def hme_pge_navi(val)
    if ENV['DEVICE'] == 'iphone'
      scrl_view("up")
      is_elm_prst('iph_signin_btn') 
      is_elm_prst('iph_signup_btn')
      is_elm_prst('iph_cntue_guest_btn') 
      if val == 'CONTINUE AS GUEST'
         clk_elm('iph_cntue_guest_btn')
      elsif val == 'SIGN IN'
         clk_elm('iph_signin_btn')
      elsif val == 'SIGN UP'
         clk_elm('iph_signup_btn')
      end
    else
      if val == 'CONTINUE AS GUEST'
         sleep 6
         clk_elm('cntue_guest_btn')
      elsif val == 'SIGN IN'
         clk_elm('signin_btn')
      elsif val == 'SIGN UP'
         clk_elm('signup_btn')
      end
     end
  end
  
  def is_tbl_elm_prst_iphone(tblName, value)
        wait_for_none_animating
        @result_value = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1 end
        (0..@result_value.length - 1).each do|j|
           if element_exists("view marked:'#{@result_value[j]}'")
           else screenshot_and_raise 'not found'
           end
           if j == 2
              scroll("view", :down)
              wait_for_none_animating
           end 
        end
        scroll("view", :up) 
  end
  def is_tbl_elm_prst_lastiphone(tblName, value)
        wait_for_none_animating
        scroll("view", :down)
        sleep 3
        scroll("view", :down)
        wait_for_none_animating
        @result_value = []
        i = 0
        value.hashes.each do |args|
        @result_value[i] = args[tblName]
        i = i + 1 end
        (0..@result_value.length - 1).each do|j|
           if element_exists("view marked:'#{@result_value[j]}'")
           else screenshot_and_raise 'not found'
           end
        end
  end
=begin
  # -------------------- In-Circle Feature Functions ----------------------
  # -----------------------------------------------------------------------
  def incircle_tabs_verify
       touch(nil, { offset: { x: 70, y: 54 } })
       wait_for_ldg
        @incircleTabs = ['circleOneButton', 'circleTwoButton', 'circleThreeButton', 'circleFourButton', 'presidentCircleButton' ]
        i = 0
        (0..@incircleTabs.length - 1).each do |j|
        element_exists("view marked:'#{@incircleTabs[i]}'")
        wait_for_ldg
        i = i + 1
      end
   end
   
   def incircle_tabs_click
        @incircleTabs = ['circleOneButton', 'circleTwoButton', 'circleThreeButton', 'circleFourButton', 'presidentCircleButton' ]
        i = 0
        (0..@incircleTabs.length - 1).each do |j|
        element_exists("view marked:'#{@incircleTabs[i]}'")
        wait_for_ldg
        touch("view marked:'#{@incircleTabs[i]}'")
        wait_for_ldg
        i = i + 1
      end
   end
   
   def verify_benifit
     unless element_exists("label index:15") && element_exists("label index:16")
       raise "Benifit's are not available"
     end
   end
   
   def scroll_screen(val)
     wait_for_ldg
     swipe(val)
   end
   
   def verifytabs_iphone
      @incircleTabsiphone = ['CIRCLE ONE', 'CIRCLE TWO', 'CIRCLE THREE', 'CIRCLE FOUR', 'PRESIDENTS CIRCLE' ]
        i = 0
        (0..@incircleTabsiphone.length - 1).each do |j|
        element_exists("view marked:'#{@incircleTabsiphone[i]}'")
        wait_for_ldg
        i = i + 1
        if i==4
          scroll "scrollView", :down
        end
      end
      scroll "scrollView", :up
   end
   
   def click_incircle_tabs_iphone
      @incircleTabsiphone = ['CIRCLE ONE', 'CIRCLE TWO', 'CIRCLE THREE', 'CIRCLE FOUR', 'PRESIDENTS CIRCLE' ]
      @incircleTabsBack = ['iPhCircleOneBackButton', 'iPhCircleTwoBackButton', 'iPhCircleThreeBackButton', 'iPhCircleFourBackButton', 'iPhCirclePresidentBackButton' ]
        i = 0
        (0..@incircleTabsiphone.length - 1).each do |j|
        element_exists("view marked:'#{@incircleTabsiphone[i]}'")
        wait_for_ldg
        touch("view marked:'#{@incircleTabsiphone[i]}'")
        wait_for_ldg
        touch("view marked:'#{@incircleTabsBack[i]}'")
        i = i + 1
        if i==4
          scroll "scrollView", :down
        end
      end
      scroll "scrollView", :up
   end
   
   def verify_view_full_site_iphone
     scroll "scrollView", :down
     wait_for_ldg
     scroll "scrollView", :down
     wait_for_ldg
     scroll "scrollView", :down
     wait_for_ldg
     is_elm_prst('lbl_iphone_view_full_site')
   end
   
   def view_gift_perk_cards
     @incirclePerkCards = ['CARD VALUE - $550.00', 'CARD VALUE - $550.00', 'CARD VALUE - $550.00', 'CARD VALUE - $550.00' ]
        i = 0
        (0..@incirclePerkCards.length - 1).each do |j|
        element_exists("view marked:'#{@incirclePerkCards[i]}'")
        wait_for_ldg
        i = i + 1
      end
   end
   
   def gift_perk_cards_not_present
     @incirclePerkCards = ['CARD VALUE - $550.00', 'CARD VALUE - $550.00', 'CARD VALUE - $550.00', 'CARD VALUE - $550.00' ]
        i = 0
        (0..@incirclePerkCards.length - 1).each do |j|
        element_does_not_exist("view marked:'#{@incirclePerkCards[i]}'")
        wait_for_ldg
        i = i + 1
      end
   end
   def scrol_scrn_dwn
   scroll("view", :down)
   sleep 3
 end
 
  def scrol_scrn_up
   scroll("view", :up)
   sleep 3
 end
 
  def hme_pge_navi(val)
    if ENV['DEVICE'] == 'iphone'
      scrl_view("up")
      is_elm_prst('iph_signin_btn') 
      is_elm_prst('iph_signup_btn')
      is_elm_prst('iph_cntue_guest_btn') 
    if val == 'CONTINUE AS GUEST'
      clk_elm('iph_cntue_guest_btn')
    elsif val == 'SIGN IN'
      clk_elm('iph_signin_btn')
    elsif val == 'SIGN UP'
      clk_elm('iph_signup_btn')
    end
    else
      is_elm_prst('signin_btn') 
      is_elm_prst('signup_btn')
      is_elm_prst('cntue_guest_btn') 
      if val == 'CONTINUE AS GUEST'
      clk_elm('cntue_guest_btn')
      elsif val == 'SIGN IN'
      clk_elm('signin_btn')
      elsif val == 'SIGN UP'
      clk_elm('signup_btn')
      end
     end
  end
  
  def clk_elm_scr_value(elm)
    wait_for_none_animating
    @elmval = "#{@data[elm]}"
    if @elmval == ""
      puts @elmval
      if touch("label marked:'#{elm}'")
      else screenshot_and_raise "#{elm} button is not tapped" 
      end
    else
      if touch("label marked:'#{@data[elm]}'")
      else screenshot_and_raise "#{@data[elm]} button is not tapped" 
      end end
    wait_for_none_animating
  end 
  
  def is_tbl_elm_prst(tblName, value)
       wait_for_none_animating
       @result_value = []
       i = 0
       value.hashes.each do |args|
       @result_value[i] = args[tblName]
       i = i + 1 end
       (0..@result_value.length - 1).each do|j|
       if element_exists("view marked:'#{@result_value[j]}'")
       else screenshot_and_raise 'not found'
       end end
    end
    def clear_field(val)
      set_text("textField index:'#{arg1}'","")
      wait_for_ldg
    end
    
    def view_full_site_iphone_learn
     scroll "scrollView", :down
     wait_for_ldg
     scroll "scrollView", :down
     wait_for_ldg
     scroll "scrollView", :down
     wait_for_ldg
     is_elm_prst('incl_iphone_viewfull_learn')
   end
   
   def verify_learn_page_iphone
     is_elm_prst('incl_learn_table_iphone')
     is_elm_prst('incl_learn_table_iph1')
     is_elm_prst('incl_learn_table_iph2')
   end
   
   def verify_incl_scr_table
     is_elm_prst('incl_cir_learn_iphone')
     is_elm_prst('incl_screen_view_full')
   end
=end
end