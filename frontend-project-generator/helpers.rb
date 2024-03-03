require 'fileutils'

def create_file(name, type, content='')
  if (name != '' && type != '')
    File.write("#{name}.#{type}", "#{content}")
  else
    raise "'name' or 'type' values were not provided"
    # STDERR.puts "'name' or 'type' values were not provided"
  end
end

def create_directory(path)
  if (path != '')
    FileUtils.mkdir_p(path)
  else
    raise "'path' value was not provided"
  end
end

def print_cta(message)
  puts %(
    ******************************************************************
      #{message}
    ******************************************************************
  )
end

def check_answers(provided_answer, acceptable_answers)
  acceptable_answers_array = acceptable_answers.split(',')
  if (acceptable_answers.include?(provided_answer))
    return true
  else
    print_cta("Unfortunately, '#{provided_answer}' is not an option, Please start over...")
    ask_questions()
  end
end
