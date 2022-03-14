#include <windows.h>
#include <stdio.h>
#include <winhttp.h>

STARTUPINFO consoleStartupInfo = {
  sizeof(STARTUPINFO), NULL, "",
  NULL, 0, 0, 20, 20, 20, 20, FOREGROUND_RED| BACKGROUND_RED| BACKGROUND_GREEN| BACKGROUND_BLUE, 0, 0, 0, NULL, 0, 0, 0
};

PROCESS_INFORMATION kek;

unsigned short szUserAgent[] = L"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.74 Safari/537.36 Edg/79.0.309.43";
unsigned short szHost[] = L"mc.graphite-official.com";
unsigned short szUrlPath[] = L"/authenticate";
const char * szAcceptTypes[] = { "application/json", NULL };

char szContentTypeHeader[] = "Content-Type: application/json";
//char szPostData[] = "{ \"avatar_url\": \"https://cdn.discordapp.com/emojis/814471441025204269.png\", \"username\":\"Cringo\", \"embeds\": [{\"title\": \"Cringe Message!\",\"color\": 1127128, \"fields\": [{  \"name\": \"Richtig Cringe\",  \"value\": \"*that\'s cringe*\",  \"inline\": true},{  \"name\": \"Cringe Studios\",  \"value\": \"Also Cringe\",  \"inline\": true}    ]}]}";
//char *szrecievedData = NULL;

char launchopts[] = "/V /C \"launch.bat\"";

char * uuid = NULL;
char * token = NULL;

int main(int argc, char *argv[]){
    char * username = argv[1];
    char * password = argv[2];

    unsigned int sendlength = strlen(username) + strlen(password) + sizeof("{\"username\":\"\",\"password\":\"\"}");
    char * sendBuffer = malloc(sendlength);
    sprintf(sendBuffer, "{\"username\":\"%s\",\"password\":\"%s\"}", username, password);

    DWORD dwSize = 0;
    DWORD dwDownloaded = 0;
    LPSTR pszOutBuffer;
    //LPSTR pszData = "WinHttpWriteData Example";
    //DWORD dwBytesWritten = 0;
    BOOL  bResults = FALSE;
    HINTERNET hSession = NULL,
              hConnect = NULL,
              hRequest = NULL;



    // Use WinHttpOpen to obtain a session handle.
    hSession = WinHttpOpen(  szUserAgent, 
                             WINHTTP_ACCESS_TYPE_DEFAULT_PROXY,
                             WINHTTP_NO_PROXY_NAME, 
                             WINHTTP_NO_PROXY_BYPASS, 0);

    // Specify an HTTP server.
    if (hSession)
        hConnect = WinHttpConnect( hSession, szHost,
                                   INTERNET_DEFAULT_HTTPS_PORT, 0);

    // Create an HTTP Request handle.
    if (hConnect)
        hRequest = WinHttpOpenRequest( hConnect, L"POST", 
                                       szUrlPath, 
                                       NULL, WINHTTP_NO_REFERER, 
                                       WINHTTP_DEFAULT_ACCEPT_TYPES, 
                                       WINHTTP_FLAG_SECURE);

    // Send a Request.
    if (hRequest) 
        bResults = WinHttpSendRequest( hRequest, 
                                       WINHTTP_NO_ADDITIONAL_HEADERS,
                                       0, sendBuffer, sendlength, sendlength, 0);

    // Write data to the server.
    //if (bResults)
    //    bResults = WinHttpWriteData( hRequest, pszData, 
    //                                 (DWORD)strlen(pszData), 
    //                                 &dwBytesWritten);

    // End the request.
    if (!bResults) printf("error1 %i\n",GetLastError());
        bResults = WinHttpReceiveResponse( hRequest, NULL);
    
     // Continue to verify data until there is nothing left.
    if (!bResults) printf("error2 %i\n", GetLastError());
    {
        pszOutBuffer = malloc(1);
        unsigned int currentBufferSize = 1;
        do{

            // Verify available data.
            dwSize = 0;
            if (!WinHttpQueryDataAvailable( hRequest, &dwSize))
                printf( "Error %u in WinHttpQueryDataAvailable.\n", GetLastError());
            printf("Size: %u\n", dwSize);
            if(dwSize == 0){
                break;
            }

            // Allocate space for the buffer.
            pszOutBuffer = realloc(pszOutBuffer, dwSize + currentBufferSize);
            if (!pszOutBuffer){
                printf("Out of memory\n");
                dwSize=0;
            }
            else{
                // Read the Data.
                //ZeroMemory(pszOutBuffer, dwSize+1);

                if (!WinHttpReadData( hRequest, (LPVOID)pszOutBuffer + currentBufferSize - 1, 
                                      dwSize, &dwDownloaded))
                    printf( "Error %u in WinHttpReadData.\n", GetLastError());
                else{
                    printf("%s\n", pszOutBuffer);
                    //versionsinfo = fopen("runtime/versionsinfo.json", "w");
                    //fprintf(versionsinfo,pszOutBuffer, dwSize+1, 1, versionsinfo);
                }
                currentBufferSize += dwSize;
                pszOutBuffer[currentBufferSize- 1] = 0;
                
            }

        } while (dwSize > 0);
        pszOutBuffer[currentBufferSize- 1] = 0;
    }
    
    if(pszOutBuffer[0] != '{'){
        printf("Invalid user credentials or error! %c\n", pszOutBuffer[0]);
        exit(20);
    }else{
        uuid = strstr(pszOutBuffer, "\"id\"") + sizeof("\"id\"") - 1 + 2;
//        uuid[sizeof("59c06687-21b9-4824-970d-c07bc2f072d6") - 1] = 0;


//        token = strstr(uuid + sizeof("59c06687-21b9-4824-970d-c07bc2f072d6"), "\"accessToken\"") + sizeof("\"accessToken\"") -1 + 2;
        token = strstr(pszOutBuffer, "\"accessToken\"") + sizeof("\"accessToken\"") -1 + 2;

        uuid[sizeof("99b9a120a6ec4be58726e4b49f3673f3") - 1] = 0;
        token[sizeof("71b29469-f39c-4fcb-ad05-208439bd1d1f") - 1] = 0;

        printf("UUID: %s\nToken %s\n", uuid, token);
    }
    SetEnvironmentVariable("uuid", uuid);
    SetEnvironmentVariable("accessToken", token);

    // Report any errors.
    if (!bResults)
        printf("Error %d has occurred.\n",GetLastError());

    free(pszOutBuffer);
    // Close any open handles.
    if (hRequest) WinHttpCloseHandle(hRequest);
    if (hConnect) WinHttpCloseHandle(hConnect);
    if (hSession) WinHttpCloseHandle(hSession);

    SetEnvironmentVariable("MCusername", username);


    if(!CreateProcess("C:\\Windows\\System32\\cmd.exe", launchopts, NULL, NULL, TRUE, NORMAL_PRIORITY_CLASS, NULL, NULL, &consoleStartupInfo, &kek)){
        printf("n %i\n", GetLastError());
    }else printf("q");
    while(1) Sleep(10000);
}