# fix everything in npm
alias npmplease='rm -rf node_modules/ package-lock.json && npm cache clean --force && npm install'

# npm start
alias ns='npm run start'

# sort package.json based on the well-known package.json keys
alias spj='npx sort-package-json'

# update LTS release, migrate npm packages from a previous version and update npm
alias node_update="nvm install 'lts/*' --reinstall-packages-from=default --latest-npm"

# show project repository url
nsu() { npm view "$1" repository.url; }

# upgrade your package.json dependencies
ncu () { npx npm-check-updates "$1"; }
