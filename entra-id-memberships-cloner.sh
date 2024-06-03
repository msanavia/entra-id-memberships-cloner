#! /bin/bash

validate_input(){
    if az ad user show --id $1 >/dev/null 2>&1; then
        if az ad user show --id $2 >/dev/null 2>&1; then
            echo "users"
        else
            echo "Error: invalid second input (not a user or cannot be read)."
        fi
    elif az ad group show --group $1 >/dev/null 2>&1; then
        if az ad group show --group $2 >/dev/null 2>&1; then
            echo "groups"
        else
            echo "Error: invalid second input (not a group or cannot be read)."
        fi
    else
        echo "Error: invalid first input (not a user, or a group or cannot be read)."
    fi
}

clone_users(){
    for group in $(az ad user get-member-groups --id $1 | jq -r '.[].id'); do
        az ad group member add -g $group --member-id $2;
    done
}

clone_groups(){
    for member in $(az ad group member list --group $1 | jq -r '.[].id'); do
        az ad group member add --group $2 --member-id $member
    done
}

# Main
if [ $(validate_input "$1" "$2") == "users" ]; then
    echo "Cloning memberships between 2 users."
    clone_users "$1" "$2"
elif [ $(validate_input "$1" "$2") == "groups" ]; then
    echo "Cloning memberships between 2 groups."
    clone_groups "$1" "$2"
fi
echo "Done"
