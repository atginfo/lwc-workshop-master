# "shane" is a plugin from someone @ SFDC: https://github.com/mshanemc/shane-sfdx-plugins
# `sfdx plugins:install shane-sfdx-plugins`
sfdx shane:org:create -f config/project-scratch-def.json -d 14 -s --json -u int -o work.shop
sfdx force:source:push
sfdx force:user:permset:assign -n All_Access
sfdx shane:user:password:set -l User -g User -p sfdx1234 --json
sfdx force:org:open
