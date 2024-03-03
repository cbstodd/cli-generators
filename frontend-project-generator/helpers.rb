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
  acceptable_answers = acceptable_answers.split(',')
  # TODO: Check to see if array of acceptable answers matches the provided answer.
  if (provided_answer == acceptable_answers.exists?)
    return true
  else
    raise print_cta("Unfortunately, that answer does not exist, Please start over...")
  end
end
