#!/usr/bin/env bash

RED="\033[0;31m"
BLUE="\033[0;34m"
NC="\033[0m"

./ci/publish-cocoapods.sh --tag="$CI_COMMIT_REF_NAME"

git diff --exit-code HEAD IndoorLocation.podspec > /dev/null
if [ $? -ne 0 ]; then
    echo -e "${BLUE}  > Synchronizing the new Podspec version into the master branch...${NC}"
    git checkout master
    git add IndoorLocation.podspec
    git commit -m ":robot: chore: updating the Podspec version to $CI_COMMIT_REF_NAME :robot:"
    git push origin HEAD:master > /dev/null
fi

# release_notes=$(sed -n "/^## ${CI_COMMIT_REF_NAME}$/,/^## /p" changelog.md | grep -E "^(\*|-|\s+)" | sed ':a;N;$!ba;s/\n/\\n/g')

echo -e "${BLUE}  > Creating or retrieving the release linked to \"$CI_COMMIT_REF_NAME\"...${NC}"
response=$(http \
    --ignore-stdin \
    --check-status \
    GET \
    https://api.github.com/repos/IndoorLocation/indoor-location-ios/releases/tags/$CI_COMMIT_REF_NAME \
    "Accept:application/vnd.github.v3+json" \
    "Authorization: token $GITHUB_TOKEN")
if [ $? -ne 0 ]; then
    response=$(http \
        --ignore-stdin \
        --check-status \
        POST \
        https://api.github.com/repos/IndoorLocation/indoor-location-ios/releases \
        "Accept:application/vnd.github.v3+json" \
        "Authorization: token $GITHUB_TOKEN" \
        tag_name="$CI_COMMIT_REF_NAME")
        # body="$release_notes")
fi

exit $?
