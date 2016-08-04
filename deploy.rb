require 'fileutils'

if ARGV.empty? || ARGV.size > 1
  puts 'LintRoller Usage'
  puts '––––––––––––––––'
  puts 'ruby deploy.rb [DIRECTORY]'
  puts
  puts 'Specify absolute directory path for deployment. Will create/update'
  puts 'linters in all sub-directories of target directory.'
  puts
  puts ''
  exit(1)
end

directory_location = ARGV[0]

if File.directory?(directory_location)
  directory_location = File.realpath(directory_location)
else
  puts "Error: #{directory_location} is not a directory, or does not exist"
  exit(1)
end

# Include Flag to be sure we also grab dotfiles
linters = Dir.glob('lints/*', File::FNM_DOTMATCH)
# Since we're including dotfiles, we now need to reject '.' and '..'
linters.reject! { |linter| linter == 'lints/.' || linter == 'lints/..' }

deployment_directories = []

Dir.glob(File.join(directory_location, '*')) do |file|
  # Don't deploy to this directory :)
  next if file == Dir.pwd
  deployment_directories << file if File.directory?(file)
end

puts "Deploying to #{directory_location}." \
  " #{deployment_directories.size} directories found."

deployment_directories.each do |directory|
  puts "-> Copying to #{directory}"
  FileUtils.cp(linters, directory)
end
