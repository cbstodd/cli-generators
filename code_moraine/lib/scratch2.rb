require './helpers'

def run_commands(directory_name)
  raise 'No directory name was provided' if directory_name.nil?

  @dir_name = directory_name
  create_directory(@dir_name)
  change_directory(@dir_name)
  system('bun init -y')
end

run_commands('HELPERS')
