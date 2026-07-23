#!/bin/bash

# Step 1: Create react app using the create-react-app tool
# (Note: In our environment, the workspace folder was capitalized "Blackbird", which create-react-app rejected due to npm package naming restrictions. So we created it in lowercase and moved the files.)
npx -y create-react-app blackbird
mv blackbird/* .
mv blackbird/.* .
rmdir blackbird

# Step 2: Commit the code, create GitHub repo using GitHub CLI
# (create-react-app automatically initialized the Git repository and created the initial commit)
gh repo create Blackbird --public --source=. --remote=origin --push

# Step 3: Switch branch to "update_logo"
git checkout -b update_logo

# Step 4: Replace existing logo with Propeller Aero logo
# (On Windows we used: Invoke-WebRequest -Uri "..." -OutFile "src/logo.svg")
curl -o src/logo.svg https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg

# Step 5: Replace existing link in src/App.js
# We edited the file src/App.js to replace "https://reactjs.org" with "https://www.propelleraero.com/dirtmate/"

# Step 6: Commit, then push the code
git add src/App.js src/logo.svg
git commit -m "Replace default logo with Propeller SVG and update link"
git push -u origin update_logo

# Step 7: Create PR from "update_logo" to "master" branch using GitHub CLI
gh pr create --title "Update logo and link" --body "Replaced existing logo and link with Propeller Aero/Dirtmate values." --head update_logo --base master

# Step 8: Merge the PR using GitHub CLI
gh pr merge 1 --merge

# REPO_URL https://github.com/Thorat-Kaustubh/Blackbird
