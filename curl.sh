ubuntu $ cat curl_test.sh 
#!/bin/bash

# Your GitHub repository details
REPO_OWNER="sharath71"
REPO_NAME="bottomline"
FILE_PATH="main/deployments.yml"  # The path to the file in the repository

# Set your Personal Access Token
ACCESS_TOKEN="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"

# File to keep track of the latest commit
LAST_COMMIT_FILE="last_commit.txt"

# Get the last recorded commit
if [ -f "$LAST_COMMIT_FILE" ]; then
    last_commit=$(cat "$LAST_COMMIT_FILE")
else
    last_commit=""
fi

# Fetch the latest commit from the repository
latest_commit=$(git ls-remote "https://github.com/$REPO_OWNER/$REPO_NAME.git" HEAD | cut -f1)

# Compare the latest commit with the last recorded commit
if [ "$last_commit" != "$latest_commit" ]; then
    echo "New commits found in the repository!"

    # Update the recorded commit
    echo "$latest_commit" > "$LAST_COMMIT_FILE"

    # Perform the cURL command to download the file
    curl -u "$REPO_OWNER:$ACCESS_TOKEN" -o "SHARATH71.txt" -L "https://raw.githubusercontent.com/$REPO_OWNER/$REPO_NAME/$FILE_PATH"
#     curl -H "Authorization: token $ACCESS_TOKEN" -H "Accept: application/vnd.github.v3.raw" -o sharath71.txt -L "https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/contents/$FILE_PATH"
    # Additional cURL commands or actions can be added here if required
else
    echo "No new commits in the repository."
fi
