function gri --description "Interactive rebase from HEAD~{{number}}"
    git rebase --interactive HEAD~$argv[1]
end
