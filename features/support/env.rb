require 'calabash-cucumber/cucumber'
require 'require_all'
require 'data_magic'
require 'yaml'
require_all 'features/support/screens'

#Screen Object
World(ScreenObject)

#Cucumber Methods
include Calabash::Cucumber::Operations

#Data Magic
include DataMagic
