# basic-cc-workflow
A basic Cloud Conformity Template Scanner Workflow

How to Use:

    1 - Put your API KEY in the api.txt file
    2 - Execute the set-env.sh script
        2.1 - See if the variables/ values in the file make sense to your environment
    3 - Smile ;) if it works || Don't cry ;( if it gives an error 

The Template_Scanner executable will search for a variable called payload so be sure to have this variable exported to your env. Or if you want to change this 
varialbe name, you will have to change in the Template_Scanner.c Source File the name of the variable that you exported in your env. 

    To do this:
        - In the Template_Scanner.c go to the getenv("payload") function and change to your exported variable name! E.g. getenv("new");

<b>WARNING:</b>

        - This project/ files are only for DEMO purpose!!
