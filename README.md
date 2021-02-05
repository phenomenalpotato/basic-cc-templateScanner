# basic-cc-workflow
A basic Cloud Conformity Template Scanner

How to Use:

    1 - Put your API KEY in the api.txt file
        1.2 - The Cloud Conformity API file MUST have the following format inside:

                Authorization: ApiKey your_api_key_here

    2 - Execute the set-env.sh script
        2.1 - See if the variables/ values in the file make sense to your environment

    3 - Smile ;) if it works || Don't cry ;( if it gives an error... Just kidding, you can always open an issue, I'll be happy to try to solve it!

The Template_Scanner executable will search for a variable called payload so be sure to have this variable exported to your env. Or if you want to change this 
variable name, you will have to change in the Template_Scanner.c Source File the name of the variable that you exported in your env. 

    To do this:
        - In the Template_Scanner.c go to the getenv("payload") function and change to your exported variable name! E.g. getenv("new");

If you don't want to export or install anything in your own environment, you can use the docker image:

    1 - Build the image:

        docker build --tag templatescanner:latest .

    2 - Run the container:

        docker run templatescanner:latest /bin/bash -c "echo Authorization: ApiKey your_api_key_here > api.txt;/var/set-env.sh"

If you want, you can also use the Makefile to:

    Build the docker image:

        - make build-dockerfile

    Run the container: (Just don't forget to change your API Key in the MakeFile!)

        - make docker-run

    And Delete the Template_Scanner Executable:

        - make delete

<b>WARNING:</b>

        - This project/ files are only for DEMO purpose!!


<i>If you want to contribute, feel free to do so!</i>
