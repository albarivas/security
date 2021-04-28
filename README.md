# Code Examples that show how to enforce security in Apex and LWC

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

1. Import sample data:

   ```
   sfdx force:data:tree:import -p ./data/sample-data-plan.json
   ```

1. If you want to test locker DOM containment, install

   ```
   sfdx force:package:install --package 04t4W000002vsDKQAY
   ```

1. Open the scratch org:

   ```
   sfdx force:org:open
   ```
