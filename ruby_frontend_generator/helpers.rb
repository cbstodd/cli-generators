require 'fileutils'

def create_file(name = '', type = '', content = '')
  if type != ''
    File.write("#{name}.#{type}", "#{content}")
  else
    warn "'name' was nil, or 'type' value was not provided"
    raise "'name' was nil, or 'type' value was not provided"
  end
end

def create_directory(path)
  raise "'path' value was not provided" unless path != ''

  FileUtils.mkdir_p("#{path}")
end

def change_directory(path)
  raise "#{path} directory does not exist." unless path != ''

  Dir.chdir("#{path}")
end

def rename_directory(currrent_dir, new_dir)
  raise "One of the two paramaters are empty: ('curr_dir', 'new_dir')" unless !currrent_dir.nil? && !new_dir.nil?

  FileUtils.mv("#{currrent_dir}", "#{new_dir}")
end

def check_answers(provided_answer, acceptable_answers)
  return true if acceptable_answers.split(',').include?(provided_answer)

  print_cta("Unfortunately, '#{provided_answer}' is not an option, Please start over...")
  ask_questions
end

def print_cta(message)
  puts %(
  ******************************************************************
  #{message}
  ******************************************************************
  )
end
