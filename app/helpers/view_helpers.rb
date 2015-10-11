def pluralize (count, singular, plural = singular.pluralize) 
  if count == 1
    "#{count} #{singular}"
  else
    "#{count} #{plural}"
  end
end