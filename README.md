# Dreamhouse App

The is the Dreamhouse application for use with the Lightning Web Components workshop.

## Preparation

You will need to have SFDX (Salesforce CLI) installed and VS Code. You will also need your own Dev Hub.

- Using the CLI, navigate to where you want the folder for the source created, and execute the following command:
  - `git clone https://github.com/atginfo/lwc-workshop-master.git lwc-workshop`
- Using the CLI, navigate into the newly created folder “lwc-workshop.
- Run `npm install` to install the project dependencies
- Log into your devhub with the following (Your devhub org will use the alias `dfDevHub`):
  - `sfdx force:auth:web:login -a dfDevHub`
  - **Note**: This can be any developer org, but you first must enable Dev Hub in the setup menu.
- Close the browser window once you have authenticated.
- Run the following command (feel free to change `lwc-workshop` if you want):
  - `sfdx force:org:create -f config/project-scratch-def.json -s -v dfDevHub -a lwc-workshop -d 30 -w 10`
    - Note: `-v dfDevHub` sets the devhub org to use
- Once the scratch org has been created, execute the following commands:
  - `sfdx force:org:open` - or you can use VSCode `SFDX: Open default org`
  - `sfdx force:source:pull`
  - `sfdx force:source:push`
  - `sfdx force:user:permset:assign -n All_Access`

### FINAL STEPS

- In the org, open the App Launcher and choose **Dreamhouse Lightning**.
- Choose the **Data Import** tab, and click the **Initialize Sample Data** button.
- Click on the **Properties** tab to confirm that you have a list of properties.
