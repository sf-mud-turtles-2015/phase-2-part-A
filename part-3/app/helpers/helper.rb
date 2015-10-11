
def error_message(errors)
  if errors
    # there should be multiple errors, dunno why its not triggered??
    errors.each do |name, problem|
       return "Error: #{name} #{problem[0]}"
    end
  end
end


