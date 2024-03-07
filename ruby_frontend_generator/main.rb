require 'date'
require 'fileutils'
require './helpers.rb'
require './content.rb'

$todays_date = Date.today.strftime('Today is: %A, %b %d, %Y')
# $styles_library = ''
# TODO: Create a function to determine which license to use.
# => For now, it's auto-assigned to always select MIT License.
$copyright_license = $mit_license_content


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



	print_cta("Your answers for: \"#{$project_name}\":")
	puts "🧑🏻‍💻 Project name: \t #{$project_name}"
	puts "📦 Package manager: \t #{$package_manager}"
	puts "📜 Scripting language: \t #{$script_language}"
	puts "🎨 Styles language: \t #{$styles_language}"

	puts "Do you want to generate the project (y)? Or start over (n)? (y/n) / or (q to quit)"
	$generate_project = gets.chomp().downcase()

	if $generate_project == 'q'
		print_cta("Quitting...")
	elsif ($generate_project == 'y')
		scaffold_project()
	elsif ($generate_project == 'n')
		puts "Starting questions over....."
		ask_questions()
	else
		print_cta("Sorry, incorrect input, Please restart CLI.")
		raise "Something within the generator went wrong, please restart the app and try again."
	end
end


def scaffold_project()
	print_cta("Generating project...")
	create_directory("#{$project_name}")
	change_directory("#{$project_name}")
	create_file('index', 'html', $html_content)
	create_file('', 'gitignore', $gitignore_content)
	create_file('README', 'md', $readme_content)
	if $copyright_license == $mit_license_content
		create_file('LICENSE', 'md', $mit_license_content)
	end
end

END {
	print_cta("Thanks for using Project Generator.")
}
