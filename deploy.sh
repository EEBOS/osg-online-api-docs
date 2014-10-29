ENV=$1
if [ "$1" = "" ]
then
  ENV="staging"
fi

echo "Compiling files"
nanoc
echo "Deploying to $ENV"
nanoc deploy --target $ENV
