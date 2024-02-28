require 'date'
require './helpers.rb'
require './content.rb'

$todays_date = Date.today.strftime('Today is: %A, %b %d, %Y')
$project_name = ''
$package_manager = ''
$script_language = ''
$styles_language = ''
$styles_library = ''
$copyright_license = ''

def ask_questions()
	print_cta("#{$todays_date}. Welcome to Project Generator.\n\tPlease type your answers below.")

	puts "1). What do you want to name your application/project? ie. 'sampleApp'"
	$project_name = gets.chomp

	puts "2). What package manager do you want to use? (npm / pnpm / yarn / bun)"
	$package_manager = gets.chomp.downcase!

	puts "3). What scripting language do you want to use? (js / ts)"
	$script_language = gets.chomp.downcase!

	puts "4). What styles language do you want to use? (css / scss / sass)"
	$styles_language = gets.chomp.downcase!

	print_cta("Your answers to generate: '#{$project_name}':")

	puts "🧑🏻‍💻 Project name: #{$project_name}"
	puts "📦 Package manager: #{$package_manager}"
	puts "📜 Scripting language: #{$script_language}"
	puts "🎨 Styles language: #{$styles_language}"

	puts "Do you want to generate the project? (y/n)"
	$generate_project = gets.chomp.downcase!
end

def generate_project()
	begin
		ask_questions()
		if ($generate_project == 'y')
			puts "Generating project..."
			# TODO: Generate Project:
		end
	rescue ($generate_project == 'n')
		puts "Exiting..."
		ask_questions()
	end
end

generate_project()
