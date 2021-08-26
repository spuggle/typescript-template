#! /bin/bash

# USAGE:
# lint.sh fix
# lint.sh check source/commit

case $1 in

  "fix")
    eslint --fix src/
    ;;

  "check")
    case $2 in

      "source")
        eslint src/
        ;;

      "commit")
        git log -1 --pretty=format:"%s" | commitlint
        ;;

      *)
        echo "Invlid target!"; exit 1

      esac
  	    ;;

  *)
      echo "Invalid action!"; exit 1
      ;;

esac
