function! GenTags()
python << EOF
import os.path
from subprocess import call

if os.path.isfile("dub.json"):
	f = open("tags", "w")
	call(["dscanner", "source/", "--ctags"], stdout=f)
EOF
endfunction
