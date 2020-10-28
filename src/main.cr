require "./dir_cleanup"

unless ARGV.size > 0
    puts "Usage: #{PROGRAM_NAME} dir [dir [dir [dir ...]]]"
    exit 1
end

ARGV.each do |dir|
    dir_cleanup(dir)
end
