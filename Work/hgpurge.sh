hg st | awk '{if($1=="?") print $2}' | xargs rm -f
