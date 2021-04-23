# Code Examples that show how to work with Salesforce Data in LWC

1. Clone the repo:

   ```
   git clone git@github.com:albarivas/security.git
   ```

1. If you haven't already done so, authorize with your hub org and provide it with an alias (**myhuborg** in the command below):

   ```
   sfdx force:auth:web:login -d -a myhuborg
   ```

1. Create a scratch org and provide it with an alias (**security** in the command below):

   ```
   sfdx force:org:create -s -f config/project-scratch-def.json -a security
   ```

1. Push the app to your scratch org:

   ```
   sfdx force:source:push
   ```

1. Assign the **Security** permission set to the default user:

   ```
   sfdx force:user:permset:assign -n Security
   ```

1. Open the scratch org:

   ```
   sfdx force:org:open
   ```
