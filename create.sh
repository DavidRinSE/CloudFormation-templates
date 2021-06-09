# ProjectName -> Used to name resources
# Repo -> Path to repo in GitHub | "userName/repoName"
# Branch -> Branch to watch and build | "main" | default = "main"
# ConnectionArn -> AWS Connection Arn to GitHub account
projectName=
repo=
branch=
connectionArn=

if [ -z "$projectName" ]; then
    echo "Project name: "
        read projectName
fi

if [ -z "$repo" ]; then
    echo "Repo path: "
        read repo
fi

if [ -z "$connectionArn" ]; then
    echo "Connection Arn: "
        read connectionArn
fi

if [ -z "$branch" ]; then
    branch="main"
fi

echo "Outputting parameters for testing..."
echo "Project name: $projectName"
echo "Repo path: $repo"
echo "Connection Arn: $connectionArn"
echo "Branch: $branch"

aws cloudformation create-stack --stack-name $projectName --template-url  --parameters ParameterKey=ProjectName,ParameterValue=$projectName ParameterKey=Repo,ParameterValue=$repo ParameterKey=Branch,ParameterValue=$branch ParameterKey=ConnectionArn,ParameterValue=$connectionArn --capabilities CAPABILITY_IAM \