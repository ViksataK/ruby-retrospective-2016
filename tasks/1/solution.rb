TABLE_ = { 
  'water' => [0, 100],
  'ethanol' => [-114, 78.37],
  'gold' => [1064, 2700],
  'silver' => [961.8, 2162],
  'copper' => [1085, 2567]
}
def convert_between_temperature_units(deg, from_unit, to_unit)
  if from_unit != to_unit
    if from_unit == 'C'
      from_celsius(deg, to_unit)
    elsif from_unit == 'K'
      from_kelvins(deg, to_unit)
    elsif from_unit == 'F'
      from_farenheit(deg, to_unit)
    end
  else
    deg
  end
end
def melting_point_of_substance(subst, unit)
  
  if unit == 'C'
    TABLE_[subst][0]
  else
    convert_between_temperature_units(TABLE_[subst][0], 'C', unit)
  end
end
def boiling_point_of_substance(subst, unit)
  if unit == 'C'
    TABLE_[subst][1]
  else
    convert_between_temperature_units(TABLE_[subst][1], 'C', unit)
  end
end
def from_celsius(deg, to_unit)
  if to_unit == 'K'
    deg + 273.15
  elsif to_unit == 'F'
    deg.to_f * 9 / 5 + 32
  else
    'Bad units'
  end
end
def from_kelvins(deg, to_unit)
  if to_unit == 'C'
    deg - 273.15
  elsif to_unit == 'F'
    deg.to_f * 9 / 5 - 459.67
  end   
end
def from_farenheit(deg, to_unit)
  if to_unit == 'K'
    (deg.to_f + 459.67) * 5 / 9
  elsif to_unit == 'C'
    (deg.to_f - 32) * 5 / 9
+
  end
end