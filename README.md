# LWC Training 101 - Dreamhouse App

This repository contains the Dreamhouse application provided by Salesforce which will be used as the foundation for the course.

The Dreamhouse app contains real-estate objects and data and the course will be centered around improving the interface.

**Credit**:
This repository was cloned and modified from https://github.com/garazi/lwc-workshop-master

## Preparation

### Software Required

1. **Salesforce CLI**
   1. `sfdx --version` to check if installed
2. **Node** (This is optional but HIGHLY recommended to ensure that the code formatter `prettier` works in your codebase)
   1. run `npm --version` to see if this is installed
3. **VSCode** (This is the recommended IDE, but you can use another IDE if you prefer as long as you are comfortable working with SFDX)
4. **Developer Hub Org**
   1. This can be any developer org, but you will need to enable the developer hub within the setup menu.
5. **Optional** Install the Shane SFDX Plugin
   1. https://github.com/mshanemc/shane-sfdx-plugins

## Setup Steps

- Using a CLI, navigate to where you want the folder for the source created, and execute the following command:
  - using SSH (preferred) - `git clone git@github.com:atginfo/atg-lwc-training-master.git lwc-workshop`
  - or using HTTPS (you will have to authenticate frequently) - `git clone https://github.com/atginfo/atg-lwc-training-master.git lwc-workshop`
- Using the CLI, navigate into the newly created folder `lwc-workshop`.
- Run `npm install` to install the project dependencies
- Log into your devhub with the following (Your devhub org will use the alias `lwcDevHub`):
  - `sfdx force:auth:web:login -a lwcDevHub`
  - **Note**: This can be any developer org, but you first must enable Dev Hub in the setup menu.
- Close the browser window once you have authenticated.
- Run the following command (feel free to change `lwc-workshop` if you want):
  - `sfdx force:org:create -f config/project-scratch-def.json -s -v lwcDevHub -a lwc-workshop -d 30 -w 10`
    - `-v lwcDevHub` sets the devhub org to use
    - `-a lwc-workshop` sets the name of the scratch org
    - `-d 30` keeps the org valid for 30 days
    - `-w 10` waits up to 10 minutes for the operation to complete
- Once the scratch org has been created, execute the following commands:
  - `sfdx force:org:open` - or you can use VSCode `SFDX: Open default org`
  - `sfdx force:source:pull`
  - `sfdx force:source:push`
  - `sfdx force:user:permset:assign -n All_Access`
- If you installed the optional [shane sfdx plugin](https://github.com/mshanemc/shane-sfdx-plugins) then you can run `sfdx shane:user:password:set -l User -g User -p sfdx1234 --json` to set your password to `sfdx1234` for easier login to your scratch org using tools like `FuseKit`.

### FINAL STEPS

- In the org, open the App Launcher and choose **Dreamhouse Lightning**.
  - Don't see it? Make sure the `All_Access` permission set is assigned to your user.
- Choose the **Data Import** tab, and click the **Initialize Sample Data** button.
- Click on the **Properties** tab to confirm that you have a list of properties generated from the step above.
