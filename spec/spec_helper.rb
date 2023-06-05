# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'rspec'
require_relative '../app/main'
require_relative '../app/models/item'
require_relative '../app/services/item_converter'
require_relative '../app/services/tax_applier'
require_relative '../app/presenters/item_presenter'
