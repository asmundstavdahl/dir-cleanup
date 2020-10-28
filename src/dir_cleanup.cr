
def dir_cleanup(dirname, indent = "")
    print "#{indent}in #{dirname}\n"

    begin
        Dir.open dirname, do |dir|
            dir.each do |entry|
                unless entry =~ /^\.+$/
                    print "#{indent}  is #{entry}\n"

                    child_path = "#{dirname}/#{entry}"

                    if Dir.exists? child_path
                        if File.symlink? child_path
                            print "#{indent}    * is a symlink\n"
                            print "#{indent}  rm #{child_path}\n"
                            File.delete child_path
                        else
                            dir_cleanup child_path, "#{indent}  "
                        end
                    end
                end
            end

            # Check if only entries are . and ..
            if Dir.entries(dirname).size == 2
                print "#{indent}rm #{dirname}\n"
                Dir.delete dirname
            end
        end
    rescue exception
        print "#{indent} WARNING #{exception}"
    end
end
