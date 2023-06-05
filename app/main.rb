# frozen_string_literal: true

# Class to interact with the user
class Main
  def self.start
    puts 'Insert the data:'
    items = []
    user_input = nil
    while user_input != ''
      user_input = gets.chomp
      items << user_input unless user_input.empty?
    end

    objects = ItemConverter.item_objects(items)
    puts ItemPresenter.items_result(objects)
  end
end
