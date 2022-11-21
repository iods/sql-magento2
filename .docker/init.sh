#!/bin/bash
# A short description of the script goes here.
#
# Usage:
#  - <command> [OPTION] [ARG]
#
#   ____  ____  ____  ____
#  ||i  |||o  |||d  |||s  |
#  ||___|||___|||___|||___|
#  |/___\|/___\|/_ _\|/___\
#
# Version 00.1.2 [2022-10-31]
# Based on the Google Style Guide: https://google.github.io/styleguide/shell.xml

mysql -u root -proot magento < "/docker-entrypoint-initdb.d/00-create.sql"
mysql -u root -proot magento < "/docker-entrypoint-initdb.d/01-create-tables.sql"

#!/bin/bash
# A short description of the script goes here.
#
# Usage:
#  - <command> [OPTION] [ARG]
#
#   ____  ____  ____  ____
#  ||i  |||o  |||d  |||s  |
#  ||___|||___|||___|||___|
#  |/___\|/___\|/_ _\|/___\
#
# Version 00.1.2 [2022-10-31]
# Based on the Google Style Guide: https://google.github.io/styleguide/shell.xml

if ! (return 0 2> /dev/null); then
  # now these will only get enabled if not sourced
  set -o errexit  # exit on most errors (get description)
  set -o nounset  # exit on expansion of unset variables (get description)
  set -o pipefail # use last non-zero exit code in a pipeline (get description)
fi

# ensures the trap handler is inherited or it wont work as expected
set -o errtrace

# function for a help message
function usage() {
  local script_name
  script_name="$(basename "$0")"

  cat >&2 <<-EOF
  Command: ${script_name}
  Description: Returns what process is the owner of a provided port.
  Usage:
    ${script_name} [PORT]
  Available Options:
    -h, --help              Print this help menu.
    -v|vv|vvv, --verbose    Increase the verbosity of messages.
  Help:
    Check for ports that are taken when trying to run Magento.
      whohas 8080
    Make sure you have System Preferences closed to not overwrite options.
EOF
  exit 1
}

#function err() {}

function func_one() {
    echo "rye"
}


function func_type() {
    local arg="${1-}"
    echo "using the database ${arg}" 
}

function main() {
  case "${1-}" in
    -h | --help) usage
    ;;
    
    -t | --type)
        query="${OPTARG-}"
        func_type
    ;;

    *) func_one ;;
  esac
}

main "$@"

# loop: get the next option, using silent error checking, with v and f as options.
# while getopts ":t:v:f:a:d" options; do
#     case "${options}" in
#         pattern )
#             ;;
#     esac
# done





# usage() {
#   cat << HEREDOC
# upload
# Usage: upload <file_name> [<uploaded_name>]
# HEREDOC
# }

# upload() {
#   if [ $# -eq 0 ]; then
#     usage

#     return 0
#   fi

#   bucket="$GSUTILS_DEFAULT_BUCKET"
#   input_file_name="$1"
#   upload_file_name="$2"

#   if [ -z "$upload_file_name" ]; then
#     md5="$(md5sum "$input_file_name" | cut -c 1-32)"
#     extension="${input_file_name##*.}"
#     upload_file_name="$md5.$extension"
#   fi

#   gsutil cp "$input_file_name" "gs://$bucket/$upload_file_name"

#   echo "https://$bucket/$upload_file_name"
# }

# upload "$@"

#   echo "Usage: $0 [ -n NAME ] [ -t TIMES ]" 1>&2 
# }

# exit_abnormal() {                         # Function: Exit with error.
#   usage
#   exit 1
# }

# while getopts ":n:t:" options; do         # Loop: Get the next option;
#                                           # use silent error checking;
#                                           # options n and t take arguments.
#   case "${options}" in                    # 
#     n)                                    # If the option is n,
#       NAME=${OPTARG}                      # set $NAME to specified value.
#       ;;
#     t)                                    # If the option is t,
#       TIMES=${OPTARG}                     # Set $TIMES to specified value.
#       re_isanum='^[0-9]+$'                # Regex: match whole numbers only
#       if ! [[ $TIMES =~ $re_isanum ]] ; then   # if $TIMES not whole:
#         echo "Error: TIMES must be a positive, whole number."
#         exit_abnormal
#       elif [ $TIMES -eq "0" ]; then       # If it's zero:
#         echo "Error: TIMES must be greater than zero."
#         exit_abnormal                     # Exit abnormally.
#       fi
#       ;;
#     :)                                    # If expected argument omitted:
#       echo "Error: -${OPTARG} requires an argument."
#       exit_abnormal                       # Exit abnormally.
#       ;;
#     *)                                    # If unknown (any other) option:
#       exit_abnormal                       # Exit abnormally.
#       ;;
#   esac
# done
# if [ "$NAME" = "" ]; then                 # If $NAME is an empty string,
#   STRING="Hi!"                            # our greeting is just "Hi!"
# else                                      # Otherwise,
#   STRING="Hi, $NAME!"                     # it is "Hi, (name)!"
# fi
# COUNT=1                                   # A counter.
# while [ $COUNT -le $TIMES ]; do           # While counter is less than
#                                           # or equal to $TIMES,
#   echo $STRING                            # print a greeting,
#   let COUNT+=1                            # then increment the counter.
# done
# exit 0                                    # Exit normally.
# 
#!/bin/bash
#
#

MYSQL_DEFAULTS_GROUP_SUFFIX="CORRA"
MYSQL_CONNECT_CMD="mysql --defaults-group-suffix=${MYSQL_DEFAULTS_GROUP_SUFFIX}"
MYSQL_ADMIN_PING_CMD="mysqladmin --defaults-group-suffix=${MYSQL_DEFAULTS_GROUP_SUFFIX} --silent ping"

function color() {
	local color_code="${1}"
	local message="${2}"

	DEFAULT_COLOR_CODE="$(printf '\033')"

	printf "${DEFAULT_COLOR_CODE}[${color_code}m${message}${DEFAULT_COLOR_CODE}[m"
}

function red() {
	color 31 "${1}"
}

function yellow() {
	color 33 "${1}"
}

mysql -u root -proot sandbox < "/docker-entrypoint-initdb.d/000-create.sql"
mysql -u root -proot sandbox < "/docker-entrypoint-initdb.d/001-tables.sql"

. .env

. ./.docker/init.sh

function get_container_name() {
	local container_name="${1}"
	docker ps -f name="${container_name}" --format "{{.Names}}"
}


function setup() {
	local WAIT_MAX=30
	local retry_count=0

	until docker exec -it $(get_container_name) sh -c "${MYSQL_ADMIN_PING_CMD}" > /dev/null 2>&1; do

	done
}

function main() {
	echo "run"
}

main "$@"


#!/bin/bash
#

docker compose exec database bash -c "chmod 0775 docker-entrypoint-initdb.d/init.sh"
docker compose exec database bash -c "./docker-entrypoint-initdb.d/init.sh"