# OSG Online API Documentation Repository

This repository contains all the files related to the API documentation for learninglogin.com available at https://api.learninglogin.com.

## Getting Started

This project is updated to ruby 2.7.2 and bundler 2.2.8. The project uses Nanoc(https://nanoc.ws/) as a static-site-generator. 

After cloning the source code, run bundle to install all the gems needed

Run the project with the following command:

```bash
bundle exec nanoc view
```

Open the website at yout localhost http://localhost:3000

## Compilation

Content folder contains the source files for the pages, if you want do changes, modify these files as needed and compile them to generate the static site. The files for deployment are generated in the output folder. 

To compile the project we use the following command:

```bash
bundle exec nanoc
```

## Deployment
We are using fog to upload files to AWS S3 bucket. The configuration is at the end of the file `nanoc.yaml`, for security reasons you might want to store your AWS credentials in `.fog` file in the user’s home directory, as follows:

```yaml
default:
  aws_access_key_id: <REPLACE-WITH-YOUR-KEY-ID>
  aws_secret_access_key: <REPLACE-WITH-YOUR-SECRET-ACCESS-KEY>
```

Use the following command for deployments replace the <environment> placeholder with 'staging' or 'production':

```bash
bundle exec nanoc deploy -t <environment>
```

