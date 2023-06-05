# frozen_string_literal: true

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].sort.each { |file| require file }

Main.start
