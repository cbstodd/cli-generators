require 'date'
require 'fileutils'
require './helpers.rb'

$todays_date = Date.today.strftime('Today is: %A, %b %d, %Y')
# $styles_library = ''
# TODO 1: Create a function to determine which license to use.
# TODO 2: Add option for VITE https://vitejs.dev/guide/

def ask_questions()
	print_cta("#{$todays_date}. Welcome to Project Generator.\n\tPlease type your answers below.")

	puts "1). What do you want to name your application/project? ie. 'sampleApp'"
	$project_name = gets.chomp()

	puts "2). What package manager do you want to use? (npm / pnpm / yarn / bun)"
	$package_manager = gets.chomp().downcase()
	check_answers($package_manager, 'npm,pnpm,yarn,bun')

	puts "3). What scripting language do you want to use? (js / ts)"
	$script_language = gets.chomp().downcase()
	check_answers($script_language, 'js,ts')

	puts "4). What styles language do you want to use? (css / scss / sass)"
	$styles_language = gets.chomp().downcase()
	check_answers($styles_language, 'css,scss,sass')

	puts "5). Do you want to use a license? (Y / n)"
	$use_license = gets.chomp().downcase()
	check_answers($use_license, 'y,n')

	require './content.rb'

	print_cta("Your answers for: \"#{$project_name}\":")
	puts "🧑🏻‍💻 Project name: \t #{$project_name}"
	puts "📦 Package manager: \t #{$package_manager}"
	puts "📜 Scripting language: \t #{$script_language}"
	puts "🎨 Styles language: \t #{$styles_language}"
	if ($use_license == 'n')
		puts "👎🏼 Not using a license."
	else
		puts "📝 License: \t\t YES (MIT)"
		$use_license = 'y'
	end

	puts( '---------------------------------------------------------------------------------')
	puts "Do you want to generate the project (y)? Or start over (n)? (y/n) / or (q to quit)?"
	$generate_project = gets.chomp().downcase()

	if $generate_project == 'q'
		print_cta("Quitting...")
	elsif ($generate_project == 'y')
		print_cta( "Generating project..." )
		# scaffold_project()
		always_generated_files()
	elsif ($generate_project == 'n')
		puts "Starting questions over....."
		ask_questions()
	else
		print_cta("Sorry, something went wrong, incorrect input. Starting over...")
		ask_questions()
		# raise "Something within the generator went wrong, please restart the app and try again."
	end
end

def always_generated_files()
	create_directory("#{$project_name}")
	change_directory("#{$project_name}")

	create_directory('styles')
	if ($styles_language == 'css')
		create_file('styles/main', $styles_language, $css_main_content)
		create_file('styles/variables', $styles_language, $css_variables_content)
		create_file('styles/custom', $styles_language, $css_custom_content)
	else
		create_file('styles/main', $styles_language, $scss_main_content)
		create_file('styles/_variables', $styles_language, $scss_variables_content)
		create_file('styles/_custom', $styles_language, $scss_custom_content)
	end

	system('git init')
	create_file('', 'gitignore', $gitignore_content)
	create_file('README', 'md', $readme_content)
	if $use_license == 'y'
		create_file('LICENSE', 'md', $mit_license_content)
	end

	# Generates index.html with js or ts.
	if ($script_language == 'ts')
		create_file('index', 'html', $ts_html_content)
		create_directory('src')
		create_file('src/index', 'ts', $ts_content)
	else # IF JavaScript
		create_file('index', 'html', $js_html_content)
		create_directory('src')
		create_file('src/index', 'js', $js_content)
	end

		# Package Managers:
		install_dependencies()
end

# TODO 3: Package Managers are not being init'ed/generated.
def install_dependencies()
	if ($package_manager == 'bun')
		puts( "Generating default bun.io project..." )
		system('bun init', '-y')
	elsif ($package_manager == 'yarn')
		puts( "Generating default yarn project..." )
		system( 'yarn init', '-y' )
		system( 'yarn add', 'nodemon lite-server @babel/preset-env babel-eslint eslint -D' )
		puts( "Running 'eslint init', please answer questions for that (refer back to choices above if needed)..." )
		create_file( 'babel.config', 'json', $babelrc_content )
		puts( "Generating default eslint project, please answer questions (put scripts in ./src/index.#{$script_language})..." )
		system( 'eslint init', '-y' )
	else
		puts( "Generating project with #{$package_manager}..." )
		system( "#{$package_manager} init", '-y' )
		system( "#{$package_manager} install", 'nodemon lite-server @babel/preset-env babel-eslint eslint -D' )
		puts( "Running 'eslint init', please answer questions for that (refer back to choices above if needed)..." )
		create_file( 'babel.config', 'json', $babelrc_content )
		puts( "Generating default eslint project, please answer questions (put scripts in ./src/index.#{$script_language})..." )
		system( 'eslint init', '-y' )
	end
end

ask_questions()

END {
	# system( 'cd', $project_name )
	print_cta( "Project finished generating!" )
}
