
def dir_cleanup(dirname, indent = "")
    print "#{indent}→ ", dirname, "\n"

    Dir.open dirname, do |dir|
        dir.each do |entry|
            unless entry =~ /^\.+$/
                print "#{indent}  ✓ ", entry, "\n"

                if Dir.exists? "#{dirname}/#{entry}"
                    dir_cleanup "#{dirname}/#{entry}", "  "
                end
            end
        end

        # Check if only entries are . and ..
        if Dir.entries(dirname).size == 2
            print "#{indent}⨯ ", dirname, "\n"
            Dir.delete dirname
        end
    end
end
