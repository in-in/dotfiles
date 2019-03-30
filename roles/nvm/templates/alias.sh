# fix everything in npm
alias npmplease='rm -rf node_modules/ package-lock.json && npm cache clean --force && npm install'

# npm start
alias ns='npm run start'

# show project repository url
nsu() { npm view "$1" repository.url }
