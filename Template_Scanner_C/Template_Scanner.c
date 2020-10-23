#include <stdio.h>
#include <curl/curl.h>
#include <string.h>
#include <stdlib.h>

int main(void) {

    CURL *curl; // You will do transfer using this. It's just a handle to transfers to operate 

    CURLcode res; // Declaring a variabel to be able to return the code from perform

    // When using libcurl you init your easy seesion and get a handle, which you use as input to the following interface functions you use

    // You continue by sending all the options you want in the upcoming transfer, most important among them is the URL itself. You might want to set some
    // callbacks as well that will be called from the library when data is available etc 

    // When all is setup, you tell libcurl to perform the transfer. It will then do the entire operation and won't return until it is done or failed.

    // After the performance is made, you may get information about the transfer and then you cleanup the easy-session's handle and libcurl is entirely
    // off the hook.

    // --------------------------------======================================------------------------------------------===================================

    // The function curl_easy_init() will start a libcurl easy session. This funtion must be the first function to call, and it returns a CURL easy handle that 
    // you must use as input to other functions in the easy interface. This call MUST have a corresponding call to curl_easy_cleanup when the operation is complete.

    curl_global_init(CURL_GLOBAL_ALL);

    curl = curl_easy_init();

    FILE *fh = fopen("api.txt", "r");

        if(fh == NULL) {

        perror("Error in opening file");
        return(1);

    }

    char token[87] = {0};

    if(fgets(token, 87, fh) == NULL || strlen(token) + 1 < 87) {

        puts("The API Key is lower than 87 caracters");
        exit(1);

    }

    if(curl) {

        char *teste = getenv("payload");

            if(teste == NULL) {

            perror("Variable not found");
            exit(1);

        }

        curl_easy_setopt(curl, CURLOPT_CUSTOMREQUEST, "POST");

        curl_easy_setopt(curl,CURLOPT_URL, "https://us-west-2-api.cloudconformity.com/v1/template-scanner/scan");

        curl_easy_setopt(curl, CURLOPT_VERBOSE, 0L);

        curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);

        curl_easy_setopt(curl, CURLOPT_DEFAULT_PROTOCOL, "https");

        struct curl_slist *headers = NULL;

        headers = curl_slist_append(headers, token);

        headers = curl_slist_append(headers, "Content-Type: application/vnd.api+json");

        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);

        const char *data = teste;

        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data);

        res = curl_easy_perform(curl);        

    }

    curl_easy_cleanup(curl);

    curl_global_cleanup(); // And when we are done with our operations, we do this

    printf("\n");

    fclose(fh);

    return 0;
}