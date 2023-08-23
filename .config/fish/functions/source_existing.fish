function source_existing --description "Source the passed in file if it exists"

    if test -f $argv[1]
        source $argv[1]
    end

end
