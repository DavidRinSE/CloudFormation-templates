This CloudFormation template will create the necessary AWS roles and services for a CICD pippeline that runs when a new commit is made to your GitHub branch. 

Prerequisites
1. Have the create.sh file in your project folder
2. Have AWS cli installed. You can test this is working by running `aws --version` in terminal. You can find install instructions here: 
https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
3. Have AWS cli configured with your access key. You can find instructions to do this here:
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-config
4. Have an AWS connection made to your Github account and save the Connection ARN somewhere on your computer, you will use this when creating your pipeline. You can find instructions to create a connection here:
https://docs.aws.amazon.com/dtconsole/latest/userguide/connections-create-github.html#connections-create-github-console
5. Have a Github repo with a buildspec.yml file that can be run by your new pipeline to build services specific to your project

Running the bash script
1. Open terminal and navigate to the root directory of your project where the `create.sh` script exists
2. In terminal, run `bash create.sh` - this will ask for the following inputs to create your pipeline
 * Project Name -> Any name can be inputted here that will help identify these resources in the AWS console
 * Repo path -> This is the path to the repo that your pipeline should monitor and build. For example, the path to this repo is DavidRinSE/CloudFormation-templates
 * Connection ARN -> This is the string that you should have saved from step 4 of the prerequisites. It represents the AWS connection to your specific github account
After providing these inputs, a pipeline will be made and a codebuild will automatically start on the repo you provided, looking for a `buildspec.yml` file.

DavidRinSE/ideal-octo-adventure is an example of a serverless framework lambda application that can be used with this pipeline. Fork it and use your own repo path so you can test pushing changes and see how the pipeline runs with every commit.

To delete a CloudFormation stack created by a template, sign in to the AWS console and navigate to CloudFormation. Select the stack created which can be identified by the Project Name provided to the Bash Script and delete it. An S3 bucket is created by this template and if it is not empty you will need to navigate to S3 and empty the bucket that can also be identified by Project Name before deleting the stack