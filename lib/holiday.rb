require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |x,y|
    y.each do |a,b|
      if x == :winter
        b << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season,season_holidays_hash|
    season_holidays_hash.each do |holiday,supply_array|
      if holiday ==  :memorial_day
        supply_array << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
#   holiday_hash.each do |season,season_holidays_hash|
#     puts "#{season.capitalize}"
#     season_holidays_hash.each do |holiday,supply_array|
#       supply_array.each do |item|
#         puts "  #{holiday.capitalize}: #{item.capitalize}"
#       end
#     end
#   end
# end

holiday_hash.each {|key, value|
  puts "#{key.to_s.capitalize!}:"
  value.each {|key, value|
  keyvalue = key.to_s.split("_").map(&:capitalize).join(" ")
  puts "  #{keyvalue}: #{value.join(", ")}"
}
}
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  name = "BBQ"
  array = []
  holiday_hash.each{ |key, value|
    value.each{ |key, value|
      if value.include? name
        array << key
      end
    }
  }
  array.flatten
end
