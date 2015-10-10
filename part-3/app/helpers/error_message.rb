
def error_message(errors)
  if errors
    error = []
    # there should be multiple errors, dunno why its not triggered??
    errors.each do |name, problem|
       error << "Error: #{name} #{problem[0]}"
    end
  end
    error.join(' ')
end
