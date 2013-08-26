
require 'calabash-cucumber/launcher'
#NMCFA-fcfdqikvmjjoatavfmvylzqkrsok - NM 8000 build
#NMCFA-bhwhpzaynlxjqfasitfcpfohtvii - NM 7000 build
#NMCFA-gvcirhxkkeypdzegssrkqyndortl_9000  QA env
APP_BUNDLE_PATH = "/Users/photon/Library/Developer/Xcode/DerivedData/NMCFA-dztlgzywyhbcfvchytxtcazjctwh/Build/Products/Debug-iphonesimulator/NMCFA-cal.app"

Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new
  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch
    @calabash_launcher.calabash_notify(self)
  end
end

After do |scenario|
  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end

at_exit do
  launcher = Calabash::Cucumber::Launcher.new
  Calabash::Cucumber::SimulatorHelper.stop unless launcher.calabash_no_stop?
end
