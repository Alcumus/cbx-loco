require 'rainbow'
require 'fileutils'

class CbxLoco::Utils
  def self.create_directory(path)
    print "Creating \"#{path}\" folder... "

    FileUtils.mkdir_p(path)
    puts Rainbow("Done!").green

    print "Creating \".keep\" file... "
    file_path = File.join path, ".keep"
    FileUtils.touch(file_path)

    puts Rainbow("Done!").green
  end

  def self.print_error(message)
    puts "\n\n" + Rainbow(message).red.underline.bright
  end

  def self.print_success(message)
    puts "\n\n" + Rainbow(message).green.underline.bright
  end
end
