# Commit your improvements with a specific identifier in the message
function gcmi() {
    git commit -m "[UNRELATED-IMPROVEMENT] $1"
}

# Creates a new branch, cherry-picks all unrelated improvement commits to that branch, moves back to 
# the feature branch and removes any improvements commits from it.
function gsi() {
    # Get current git branch
    CURRENT_BRANCH=$(gb --show-current)

    # Set default branch name if no parameter is provided
    IMPROVEMENTS_BRANCH_NAME=${1:-unrelated-improvements}

    # Create a new branch for unrelated improvements
    git checkout -b $IMPROVEMENTS_BRANCH_NAME

    # Cherry-pick commits with the specified identifier, removing that identified when committing
    git log --grep="\[UNRELATED-IMPROVEMENT\]" --reverse --format=%H | xargs -I {} \
        git cherry-pick --no-commit {} && \
        git commit --amend -m "$(git log --format=%B -n 1 {} | sed 's/\[UNRELATED-IMPROVEMENT\] //')"

    git push origin $IMPROVEMENTS_BRANCH_NAME

    # Switch back to the original branch
    git checkout $CURRENT_BRANCH

    # Remove commits with the specified identifier
    git log --grep="\[UNRELATED-IMPROVEMENT\]" --reverse --format=%H | xargs -I {} git reset --hard {}

    # Push the updated branch
    git push origin $CURRENT_BRANCH
}
