aoc_files = Dir['aoc-*.rb'].sort_by { |name| name.split('-').last.to_i }

aoc_files.each do |file|
    puts "Running #{file}..."
    load file
end
