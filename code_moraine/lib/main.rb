#!/Users/$USER/.rbenv/shims/ruby || #!/usr/lib/ruby

require 'date'
require 'fileutils'
require 'helpers'
require 'content'

# styles_library = ''
# TODO 1: Create a function to determine which license to use.
# TODO 2: Add option for VITE https://vitejs.dev/guide/

class GenerateApp
  attr_accessor :package_manager,
                :script_language,
                :styles_language,
                :use_license,
                :project_name,
                :project_path,
                :generate_project

  def initialize
    @package_manager = package_manager
    @script_language = script_language
    @styles_language = styles_language
    @use_license = use_license
    @project_name = project_name
    @project_path = project_path
  end

  def ask_questions
    todays_date = Date.today.strftime('Today is: %A, %b %d, %Y')
    print_cta("#{todays_date}. Welcome to Project Generator.\n\tPlease type your answers below.")

    puts "1). What do you want to name your application/project? ie. 'sampleApp'"
    @project_name = gets.chomp

    puts '2). What package manager do you want to use? (npm / pnpm / yarn / bun)'
    @package_manager = gets.chomp.downcase
    check_answers(@package_manager, 'npm,pnpm,yarn,bun')

    puts '3). What scripting language do you want to use? (js / ts)'
    @script_language = gets.chomp.downcase
    check_answers(@script_language, 'js,ts')

    puts '4). What styles language do you want to use? (css / scss / sass)'
    @styles_language = gets.chomp.downcase
    check_answers(@styles_language, 'css,scss,sass')

    puts '5). Do you want to use a license? (Y / n)'
    @use_license = gets.chomp.downcase
    check_answers(@use_license, 'y,n')

    require './content'

    print_cta("Your answers for: \"#{@project_name}\":")
    puts "🧑🏻‍💻 Project name: \t #{@project_name}"
    puts "📦 Package manager: \t #{@package_manager}"
    puts "📜 Scripting language: \t #{@script_language}"
    puts "🎨 Styles language: \t #{@styles_language}"
    if @use_license == 'n'
      puts '👎🏼 Not using a license.'
    else
      puts "📝 License: \t\t YES (MIT)"
      @use_license = 'y'
    end

    puts('---------------------------------------------------------------------------------')
    puts 'Do you want to generate the project (y)? Or start over (n)? (y/n) / or (q to quit)?'
    generate_project = gets.chomp.downcase

    case generate_project
    when 'q'
      print_cta('Quitting...')
    when 'y'
      print_cta('Generating project...')
      # scaffold_project()
      always_generated_files
    when 'n'
      puts 'Starting questions over.....'
      ask_questions
    else
      print_cta('Sorry, something went wrong, incorrect input. Starting over...')
      ask_questions
      # raise "Something within the generator went wrong, please restart the app and try again."
    end
  end

  def always_generated_files
    @project_name = project_name.to_s
    create_directory(@project_name)
    change_directory(@project_name)

    create_directory('styles')
    if @styles_language == 'css'
      create_file('styles/main', @styles_language, $css_main_content)
      create_file('styles/variables', @styles_language, $css_variables_content)
      create_file('styles/custom', @styles_language, $css_custom_content)
    else
      create_file('styles/main', @styles_language, $scss_main_content)
      create_file('styles/_variables', @styles_language, $scss_variables_content)
      create_file('styles/_custom', @styles_language, $scss_custom_content)
    end

    system('git init')
    create_file('', 'gitignore', $gitignore_content)
    create_file('README', 'md', $readme_content)
    create_file('LICENSE', 'md', $mit_license_content) if @use_license == 'y'

    # Generates index.html with js or ts.
    if @script_language == 'ts'
      create_file('index', 'html', $ts_html_content)
      create_directory('src')
      create_file('src/index', 'ts', $ts_content)
    else # IF JavaScript
      create_file('index', 'html', $js_html_content)
      create_directory('src')
      create_file('src/index', 'js', $js_content)
    end
  end

  # TODO: 3: Package Managers are not being init'ed/generated.
  def install_dependencies
    if @package_manager == 'bun'
      system('bun init', '-y')
      puts('Generating default bun.io project...')
      raise 'Bun project was not generated...'
    elsif @package_manager == 'yarn'
      system('yarn init', '-y')
      system('yarn add', 'nodemon lite-server @babel/preset-env babel-eslint eslint -D')
      puts('Generating default yarn project...')
      puts("Running 'eslint init', please answer questions for that (refer back to choices above if needed)...")
      create_file('babel.config', 'json', $babelrc_content)
      puts("Generating default eslint project, please answer questions (put scripts in ./src/index.#{@script_language})...")
      system('eslint init', '-y')
    else
      puts("Generating project with #{@package_manager}...")
      system("#{@package_manager} init", '-y')
      system("#{@package_manager} install", 'nodemon lite-server @babel/preset-env babel-eslint eslint -D')
      puts("Running 'eslint init', please answer questions for that (refer back to choices above if needed)...")
      create_file('babel.config', 'json', $babelrc_content)
      puts("Generating default eslint project, please answer questions (put scripts in ./src/index.#{@script_language})...")
      system('eslint init', '-y')
    end
  end
end

new_app = GenerateApp.new
new_app.ask_questions

at_exit do
  new_app.install_dependencies
  print_cta('Project finished generating!')
end
