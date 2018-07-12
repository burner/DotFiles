function! GenTags()
:! dscanner --ctags `find . -name \*.d` > tags
"python << EOF
"import os.path
"from subprocess import call
"
"if os.path.isfile("dub.json"):
"	f = open("tags", "w")
"	call(["dscanner", "`find . -name \*.d`, "--ctags"], stdout=f)
"EOF
endfunction
