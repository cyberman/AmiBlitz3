/* Load a source into AmiBlitz3 and compile it */
OPTIONS RESULTS

PARSE ARG 1 PARAMETERS 1 PARAMETER.1 PARAMETER.2
IF PARAMETER.1 = "" THEN DO
    SAY "No filename given."
    EXIT
END

SAY "Connection to AmiBlitz3."
ADDRESS "PED.1"
IF (RC == 10) THEN DO
    SAY "AmiBlitz3 seems not to be running."
    EXIT
END

SCREENTOFRONT

/* Load the main project file (first command line parameter) */
SAY "Loading <" PARAMETER.1 ">"
LOAD parameter.1
IF (RC == 0) THEN 
    DO
        /* Compile the project */
        SAY "Compiling..."
        COMPILE
    END 
ELSE
    DO
        SAY "Error: " RC
        SAY "Error2:" RC2
    END

SCREENTOBACK
SAY "Done."